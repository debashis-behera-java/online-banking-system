package com.example.online_banking_system;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoanController {

    @Autowired
    JdbcTemplate jdbc;

    @Autowired
    private JavaMailSender mailSender;

    // ===============================
    // 🔹 LOAN PAGE
    // ===============================
    @GetMapping("/loan")
    public String loanPage(HttpSession session, Model m) {

        String acc = (String) session.getAttribute("accountno");

        if (acc == null) {
            return "redirect:/login";
        }

        m.addAttribute("loanList",
            jdbc.queryForList("SELECT * FROM loan_master WHERE accountno=?", acc)
        );

        return "loan_page";
    }

    // ===============================
    // 🔹 APPLY LOAN
    // ===============================
    @PostMapping("/applyLoan")
    public String applyLoan(@RequestParam double amount,
                            HttpSession session,
                            Model m) {

        String acc = (String) session.getAttribute("accountno");

        

        try {

            int balance = jdbc.queryForObject(
                "SELECT balance FROM account_balance WHERE accountno=?",
                Integer.class, acc
            );

            // ❌ Balance condition
            if (balance > 100) {
                m.addAttribute("error", "Balance must be below ₹100 ❌");
                return "loan_page";
            }

            double interest = 10;
            int tenure = 6;

            double r = interest / 12 / 100;
            double emi = (amount * r * Math.pow(1 + r, tenure)) /
                         (Math.pow(1 + r, tenure) - 1);


                         

            // ✅ INSERT LOAN
LocalDate nextDate = LocalDate.now().plusMonths(1);

jdbc.update(
    "INSERT INTO loan_master(accountno,amount,interest,tenure,emi,status,next_due_date) VALUES(?,?,?,?,?,?,?)",
    acc, amount, interest, tenure, emi, "Approved", nextDate
);
System.out.println("LOAN INSERTED FOR: " + acc);

            // ✅ CREDIT AMOUNT
            jdbc.update(
                "UPDATE account_balance SET balance = balance + ? WHERE accountno=?",
                amount, acc
            );


          
            // 🔥 EMAIL
            String email = (String) session.getAttribute("email");

            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(email);
            message.setSubject("Loan Approved");
            message.setText(
                "Dear Customer,\n\n" +
                "Your loan of ₹" + amount + " has been credited to your account.\n\n" +
                "Thank you for banking with us.\n\n- Digital Bank"
            );

            mailSender.send(message);

            m.addAttribute("msg", "Loan Approved Successfully ✅");

        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("error", "Error processing loan ❌");
        }

        return "loan_page";
    }

    // ===============================
    // 🔹 LOAN DASHBOARD
    // ===============================
    @GetMapping("/loanDashboard")
public String loanDashboard(HttpSession session, Model m) {

    String acc = (String) session.getAttribute("accountno");

    if (acc == null) {
        return "redirect:/login";
    }

    // ✅ ACTIVE LOANS
    List<Map<String,Object>> activeLoans =
        jdbc.queryForList(
            "SELECT * FROM loan_master WHERE accountno=? AND status!='Closed'",
            acc
        );

    // ✅ CLOSED LOANS
    List<Map<String,Object>> closedLoans =
        jdbc.queryForList(
            "SELECT * FROM loan_master WHERE accountno=? AND status='Closed'",
            acc
        );

    // 🔥 PROGRESS CALCULATION (ACTIVE)
    for (Map<String,Object> l : activeLoans) {

        int paid = l.get("paid_emi") == null ? 0 :
            ((Number) l.get("paid_emi")).intValue();

        int tenure = ((Number) l.get("tenure")).intValue();

        int safePaid = Math.min(paid, tenure);

        int progress = (tenure == 0) ? 0 : (safePaid * 100 / tenure);

        l.put("progress", progress);
        l.put("safePaid", safePaid);
    }

    // 🔥 PROGRESS CALCULATION (CLOSED)
    for (Map<String,Object> l : closedLoans) {

        int paid = ((Number) l.get("paid_emi")).intValue();
        int tenure = ((Number) l.get("tenure")).intValue();

        int progress = (tenure == 0) ? 0 : (paid * 100 / tenure);

        l.put("progress", progress);
    }

    // 🔥 SUMMARY (KEEP SAME)
    Double totalLoan = jdbc.queryForObject(
        "SELECT IFNULL(SUM(amount),0) FROM loan_master WHERE accountno=?",
        Double.class, acc
    );

   Integer loanCount = jdbc.queryForObject(
    "SELECT COUNT(*) FROM loan_master WHERE accountno=? AND status!='Closed'",
    Integer.class, acc
);

    // 🔥 CREDIT SCORE (KEEP SAME)
    Integer score = jdbc.queryForObject(
        "SELECT credit_score FROM register WHERE accountno=?",
        Integer.class,
        acc
    );

    m.addAttribute("creditScore", score);

    // 🔥 IMPORTANT CHANGE
    m.addAttribute("activeLoans", activeLoans);
    m.addAttribute("closedLoans", closedLoans);

    m.addAttribute("totalLoan", totalLoan);
    m.addAttribute("loanCount", loanCount);

    return "loan_dashboard";
}
    // ===============================
    // 🔹 PAY EMI (REAL BANKING)
    // ===============================
    @PostMapping("/payEmi")
    public String payEmi(@RequestParam Integer loanId,
                         HttpSession session,
                         RedirectAttributes ra) {

        String acc = (String) session.getAttribute("accountno");

        Map<String,Object> loan = jdbc.queryForMap(
            "SELECT * FROM loan_master WHERE loan_id=?", loanId
        );

        double emi = ((Number) loan.get("emi")).doubleValue();
        double penalty = ((Number) loan.get("penalty")).doubleValue();

double totalPay = emi + penalty;
        int paid = ((Number) loan.get("paid_emi")).intValue();
        int tenure = ((Number) loan.get("tenure")).intValue();

        // ❌ Already completed
        if (paid >= tenure) {
            ra.addFlashAttribute("error", "Loan already completed ❌");
            return "redirect:/loanDashboard";
        }

        

        // 🔥 CHECK BALANCE
        double balance = jdbc.queryForObject(
            "SELECT balance FROM account_balance WHERE accountno=?",
            Double.class, acc
        );

       if (balance < totalPay) {
    ra.addFlashAttribute("error", "Insufficient balance (including penalty) ❌");
    return "redirect:/loanDashboard";
}

        // ✅ DEDUCT EMI
       jdbc.update(
    "UPDATE account_balance SET balance = balance - ? WHERE accountno=?",
    totalPay, acc
);

        // ✅ UPDATE EMI COUNT
        // Prevent overpayment
if (paid < tenure) {

    jdbc.update(
        "UPDATE loan_master SET paid_emi = paid_emi + 1 WHERE loan_id=?",
        loanId
    );

    // 🔥 RESET PENALTY FLAG (ADD THIS)
jdbc.update(
    "UPDATE loan_master SET penalty_added=0 WHERE loan_id=?",
    loanId
);

// 🔥 RESET PENALTY AMOUNT (ADD THIS)
jdbc.update(
    "UPDATE loan_master SET penalty=0 WHERE loan_id=?",
    loanId
);

} else {
    ra.addFlashAttribute("error", "Loan already completed ❌");
    return "redirect:/loanDashboard";
}

        // ✅ CLOSE LOAN
        jdbc.update(
            "UPDATE loan_master SET status='Closed' WHERE loan_id=? AND paid_emi >= tenure",
            loanId
        );

        // 🔥 CHECK IF LOAN CLOSED
Map<String,Object> updatedLoan = jdbc.queryForMap(
    "SELECT * FROM loan_master WHERE loan_id=?",
    loanId
);

int updatedPaid = ((Number) updatedLoan.get("paid_emi")).intValue();
int tenureVal = ((Number) updatedLoan.get("tenure")).intValue();

if(updatedPaid >= tenureVal){

    String email = (String) session.getAttribute("email");

    SimpleMailMessage msg = new SimpleMailMessage();
    msg.setTo(email);
    msg.setSubject("Loan Closed Successfully 🎉");

    msg.setText(
        "Congratulations!\n\n" +
        "Your loan has been fully paid and closed successfully.\n\n" +
        "- Digital Bank"
    );

    mailSender.send(msg);
}
        // 🧠 INCREASE CREDIT SCORE (ON TIME PAYMENT)
jdbc.update(
    "UPDATE register SET credit_score = credit_score + 5 WHERE accountno=?",
    acc
);

        // 🔥 SUCCESS
        ra.addFlashAttribute("msg", "EMI Paid Successfully ✅");

        return "redirect:/loanDashboard";
    }
}