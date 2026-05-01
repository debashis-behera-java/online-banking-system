package com.example.online_banking_system;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service

public class EmiReminderService {

    @Autowired
    JdbcTemplate jdbc;

    @Autowired
    JavaMailSender mailSender;

    // 🔥 RUN EVERY DAY AT 9 AM
     @Scheduled(cron = "0 0 9 * * ?") 
public void autoDeductEmi() {

    LocalDate today = LocalDate.now();

    // 🔥 GET LOANS DUE TODAY
    List<Map<String,Object>> loans =
        jdbc.queryForList(
            "SELECT * FROM loan_master WHERE next_due_date=? AND paid_emi < tenure",
            today
        );

    for (Map<String,Object> loan : loans) {

        String accountno = (String) loan.get("accountno");
        int loanId = ((Number) loan.get("loan_id")).intValue();

        double emi = ((Number) loan.get("emi")).doubleValue();
        int paid = ((Number) loan.get("paid_emi")).intValue();
        int tenure = ((Number) loan.get("tenure")).intValue();

        // 🔥 CHECK BALANCE
        double balance = jdbc.queryForObject(
            "SELECT balance FROM account_balance WHERE accountno=?",
            Double.class, accountno
        );

        if (balance >= emi) {

            // ✅ DEDUCT MONEY
            jdbc.update(
                "UPDATE account_balance SET balance = balance - ? WHERE accountno=?",
                emi, accountno
            );

            // ✅ UPDATE EMI COUNT
            jdbc.update(
                "UPDATE loan_master SET paid_emi = paid_emi + 1 WHERE loan_id=?",
                loanId
            );

            // ✅ UPDATE NEXT DATE
            LocalDate next = today.plusMonths(1);

            jdbc.update(
                "UPDATE loan_master SET next_due_date=? WHERE loan_id=?",
                next, loanId
            );

            // ✅ CLOSE LOAN
            jdbc.update(
                "UPDATE loan_master SET status='Closed' WHERE loan_id=? AND paid_emi >= tenure",
                loanId
            );

            // 🔥 SEND SUCCESS EMAIL
            String email = jdbc.queryForObject(
                "SELECT email FROM register WHERE accountno=?",
                String.class,
                accountno
            );

            SimpleMailMessage msg = new SimpleMailMessage();
            msg.setTo(email);
            msg.setSubject("EMI Auto Deducted");
            msg.setText("₹" + emi + " EMI has been auto deducted.");

            mailSender.send(msg);

            System.out.println("EMI deducted for: " + accountno);

        } else {

            // ❌ INSUFFICIENT BALANCE → WARNING EMAIL
            String email = jdbc.queryForObject(
                "SELECT email FROM register WHERE accountno=?",
                String.class,
                accountno
            );

            SimpleMailMessage msg = new SimpleMailMessage();
            msg.setTo(email);
            msg.setSubject("EMI Payment Failed");
            msg.setText("Insufficient balance for EMI. Please add funds.");

            mailSender.send(msg);

            System.out.println("EMI failed: " + accountno);
            // 🔥 HEAVY PENALTY FOR MISSED EMI
jdbc.update(
    "UPDATE register SET credit_score = credit_score - 50 WHERE accountno=?",
    accountno
);
        }
    }
}

@Scheduled(fixedRate = 60000)
public void applyPenalty() {

    System.out.println("Penalty scheduler running..."); // DEBUG

    LocalDate today = LocalDate.now();

    List<Map<String,Object>> loans =
        jdbc.queryForList(
            "SELECT * FROM loan_master WHERE next_due_date < ? AND penalty_added=0 AND paid_emi < tenure",
            today
        );

    System.out.println("Loans found for penalty: " + loans.size()); // DEBUG

    for (Map<String,Object> loan : loans) {

        int loanId = ((Number) loan.get("loan_id")).intValue();
        String accountno = (String) loan.get("accountno");

        // ✅ ADD PENALTY
        jdbc.update(
            "UPDATE loan_master SET penalty = penalty + 50, penalty_added=1 WHERE loan_id=?",
            loanId
        );

        // ✅ REDUCE CREDIT SCORE (IMPORTANT)
        jdbc.update(
            "UPDATE register SET credit_score = credit_score - 20 WHERE accountno=?",
            accountno
        );

        System.out.println("Penalty + score updated for: " + accountno);
    }
}
}