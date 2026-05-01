package com.example.online_banking_system;


import java.util.List;
import java.util.Map;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.razorpay.RazorpayClient;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.razorpay.Order;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;


@Controller
public class TransactionController {

    @Autowired
    JdbcTemplate jdbc;


    @Autowired
private org.springframework.mail.javamail.JavaMailSender mailSender;

public void sendOtpEmail(String email, int otp) {

    org.springframework.mail.SimpleMailMessage msg =
            new org.springframework.mail.SimpleMailMessage();

    msg.setTo(email);
    msg.setSubject("🔐 OTP Verification - Banking System");

    msg.setText(
        "Dear Customer,\n\n" +
        "Your OTP for transaction is: " + otp + "\n\n" +
        "This OTP is valid for 2 minutes.\n\n" +
        "Do not share this OTP with anyone.\n\n" +
        "- Bank Security Team"
    );

    mailSender.send(msg);
}




    @GetMapping("/deposit")
    public String depositPage() {
        return "deposit";
    }

   @PostMapping("/deposit_money")
public String deposit(
        @RequestParam int dep_money,
        @RequestParam String payment_method,
        HttpSession session,
        Model m) {

    String acc = (String) session.getAttribute("accountno");

    // Save in session for payment step
    session.setAttribute("dep_amount", dep_money);
    session.setAttribute("payment_method", payment_method);

    m.addAttribute("amount", dep_money);
    m.addAttribute("method", payment_method);

    return "payment_page"; // redirect to new page
}


@PostMapping("/payment_success")
public String paymentSuccess(
        @RequestParam String razorpay_payment_id,
        @RequestParam String razorpay_order_id,
        @RequestParam String razorpay_signature,
        HttpSession session,
        Model m) {

    try {

        String secret = "tOt12c7E0KUrAlGNlvjG35Ug"; // 🔥 from Razorpay dashboard

        String generated_signature = razorpay_order_id + "|" + razorpay_payment_id;

        String expected_signature = hmacSHA256(generated_signature, secret);

        if (!expected_signature.equals(razorpay_signature)) {
            m.addAttribute("sms", "Payment verification failed ❌");
            return "deposit";
        }
       


    
        // ✅ VERIFIED → update balance
        String acc = (String) session.getAttribute("accountno");
        System.out.println("ACCOUNT: " + acc);
        int amount = (int) session.getAttribute("dep_amount");

          Integer count = jdbc.queryForObject(
                "SELECT COUNT(*) FROM transactions WHERE payment_id=?",
                Integer.class,
                razorpay_payment_id
        );

                if (count != null && count > 0) {
            m.addAttribute("sms", "Duplicate payment detected ❌");
            return "deposit";
        }

        System.out.println("INSERTING TRANSACTION...");

        // 🔥 STEP 2: SAVE TRANSACTION FIRST
        jdbc.update(
                "INSERT INTO transactions(accountno, payment_id, order_id, amount, status) VALUES(?,?,?,?,?)",
                acc,
                razorpay_payment_id,
                razorpay_order_id,
                amount,
                "SUCCESS"
        );

        // 🔥 STEP 3: UPDATE BALANCE
        jdbc.update(
                "UPDATE account_balance SET balance = balance + ? WHERE accountno = ?",
                amount,
                acc
        );



        session.removeAttribute("dep_amount");

        m.addAttribute("sms", "Deposit Successful ✅");

        String email = (String) session.getAttribute("email");

if (email != null) {
    sendDepositEmail(email, amount);
}

        return "deposit";

    } catch (Exception e) {
        m.addAttribute("sms", "Payment Error ❌");
        return "deposit";
    }
}



   @PostMapping("/transferMoney")
public String transferMoney(@RequestParam String fromAccount,
                            @RequestParam String toAccount,
                            @RequestParam double amount,
                            HttpSession session,
                            Model m) {

    try {

          Integer status = jdbc.queryForObject(
        "SELECT status FROM register WHERE accountno=?",
        Integer.class,
        fromAccount
    );

    if (status == 0) {
        m.addAttribute("error", "❌ Your account is blocked due to suspicious activity.");
        return "withdraw";
    }

        List<Map<String, Object>> fromBalList =
                jdbc.queryForList("SELECT balance FROM account_balance WHERE accountno=?", fromAccount);

        if (fromBalList.isEmpty()) {
            m.addAttribute("error", "Sender account not found");
            return "withdraw";
        }

        List<Map<String, Object>> toBalList =
                jdbc.queryForList("SELECT balance FROM account_balance WHERE accountno=?", toAccount);

        if (toBalList.isEmpty()) {
            m.addAttribute("error", "Receiver account not found");
            return "withdraw";
        }

        long fromBalance = ((Number) fromBalList.get(0).get("balance")).longValue();

        if (amount <= 0) {
            m.addAttribute("error", "Amount must be greater than 0");
            return "withdraw";
        }

        if (fromBalance < amount) {
            m.addAttribute("error", "Insufficient balance");
            return "withdraw";
        }


        // 🔥 CHECK FREQUENT TRANSACTIONS (last 1 minute)
int recentTx = jdbc.queryForObject(
    "SELECT COUNT(*) FROM transfer_details WHERE from_account=? AND transfer_date >= NOW() - INTERVAL 1 MINUTE",
    Integer.class,
    fromAccount
);

if (recentTx >= 3) {

    jdbc.update(
        "INSERT INTO fraud_log(accountno, amount, reason) VALUES(?,?,?)",
        fromAccount, amount, "Too many transactions quickly"
    );

    m.addAttribute("error", "⚠️ Too many transactions. Try later.");
    return "withdraw";
}

   if (amount > 50000) {

    jdbc.update(
        "INSERT INTO fraud_log(accountno, amount, reason, to_account, action) VALUES(?,?,?,?,NULL)",
        fromAccount, amount, "High amount transaction", toAccount
    );
     m.addAttribute("waitApproval", true);
    m.addAttribute("fromAccount", fromAccount);
    m.addAttribute("toAccount", toAccount);
    m.addAttribute("amount", amount);
    m.addAttribute("error", "⚠️ Sent for admin approval");
    return "withdraw";
}

session.removeAttribute("profile_otp"); // 🔥 prevent conflict

        // 🔥 STEP: GENERATE OTP
        int otp = (int)(Math.random() * 900000) + 100000;

        // 🔥 STORE DATA IN SESSION
        session.setAttribute("tx_otp", otp);
        session.setAttribute("fromAccount", fromAccount);
        session.setAttribute("toAccount", toAccount);
        session.setAttribute("amount", amount);

        // 🔥 GET USER EMAIL (from login session)
        String email = (String) session.getAttribute("email");

        // 🔥 SEND OTP
        sendOtpEmail(email, otp);

        m.addAttribute("sms", "OTP sent to your email");
        m.addAttribute("actionUrl", "/verify-otp");

        return "otp_page";

    } catch (Exception e) {
        e.printStackTrace();
        m.addAttribute("error", "Transaction failed");
        return "withdraw";
    }
}

   @GetMapping("/getaccountholdername")
@ResponseBody
public List<Map<String,Object>> getAccountHolderName(@RequestParam("baccount") String baccount) {
    return jdbc.queryForList("SELECT name AS ahname FROM create_account WHERE accountno=?", baccount);
}

   @GetMapping("/ministatement")
public String miniStatement(Model m, HttpSession session) {
    Object accObj = session.getAttribute("accountno");
    if (accObj == null) {
        return "redirect:/login";
    }

    String acc = String.valueOf(accObj);

    m.addAttribute("ministmt",
            jdbc.queryForList(
                    "SELECT * FROM transfer_details WHERE from_account=? OR to_account=? ORDER BY transfer_date DESC",
                    acc, acc
            ));

    return "ministatement";
}

    @GetMapping("/transactions")
    public String transactionsPage() {
        return "transactions";
    }

    @GetMapping("/addbeneficiary")
    public String addBeneficiaryPage() {
        return "addbeneficiary";
    }
    @PostMapping("/addbeneficiary")
public String addBeneficiary(@RequestParam String beneficiary_accountno,
                             @RequestParam String beneficiary_name,
                             @RequestParam String ifsc,
                             HttpSession session,
                             Model m) {

    Object accObj = session.getAttribute("accountno");
    if (accObj == null) {
        return "redirect:/login";
    }

    String accountno = String.valueOf(accObj);

    jdbc.update("INSERT INTO beneficiary_list(accountno, beneficiary_accountno, beneficiary_name, ifsc) VALUES(?,?,?,?)",
            accountno, beneficiary_accountno, beneficiary_name, ifsc);

    m.addAttribute("sms", "Beneficiary added successfully");
    return "addbeneficiary";
}


@PostMapping("/verify-otp")
public String verifyOtp(@RequestParam int otp,
                        HttpSession session,
                        Model m) {

    Object otpObj = session.getAttribute("tx_otp");

    // 🔒 SAFETY CHECK
    if (otpObj == null) {
        m.addAttribute("msg", "⏰ Session expired. Please try again.");
        return "otp_page";
    }

    int sessionOtp = (int) otpObj;

    if (otp == sessionOtp) {

        String fromAccount = (String) session.getAttribute("fromAccount");
        String toAccount = (String) session.getAttribute("toAccount");
        double amount = (double) session.getAttribute("amount");

        // 💰 TRANSFER
        jdbc.update("UPDATE account_balance SET balance=balance-? WHERE accountno=?", amount, fromAccount);
        jdbc.update("UPDATE account_balance SET balance=balance+? WHERE accountno=?", amount, toAccount);

        jdbc.update(
            "INSERT INTO transfer_details(from_account,to_account,amount,credit_amount) VALUES(?,?,?,?)",
            fromAccount, toAccount, amount, amount
        );

        // 🔥 CLEAR SESSION
        session.removeAttribute("tx_otp");
        session.removeAttribute("fromAccount");
        session.removeAttribute("toAccount");
        session.removeAttribute("amount");

        m.addAttribute("type", "transaction");
return "success";

    } else {
        m.addAttribute("msg", "❌ Wrong OTP");
        return "otp_page";
    }
}


public static String hmacSHA256(String data, String key) throws Exception {

    Mac mac = Mac.getInstance("HmacSHA256");
    SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(), "HmacSHA256");
    mac.init(secretKey);

    byte[] hash = mac.doFinal(data.getBytes());

    StringBuilder hex = new StringBuilder(2 * hash.length);
    for (byte b : hash) {
        hex.append(String.format("%02x", b));
    }

    return hex.toString();
}

@PostMapping("/create_order")
@ResponseBody
public Map<String, Object> createOrder(@RequestParam int amount) {

    try {

        RazorpayClient client = new RazorpayClient("rzp_test_SYtIERyTrzDaL2", "tOt12c7E0KUrAlGNlvjG35Ug");

        JSONObject options = new JSONObject();
        options.put("amount", amount * 100);
        options.put("currency", "INR");
        options.put("receipt", "txn_123");

        Order order = client.orders.create(options);

        return Map.of(
            "id", order.get("id"),
            "amount", order.get("amount")
        );

    } catch (Exception e) {
        e.printStackTrace();
        return Map.of();
    }
}

@GetMapping("/payment-history")
public String paymentHistory(HttpSession session, Model m) {

    String acc = (String) session.getAttribute("accountno");

    // 🔒 SECURITY CHECK
    if (acc == null) {
        return "redirect:/login";
    }

    m.addAttribute("list",
            jdbc.queryForList(
                    "SELECT * FROM transactions WHERE accountno=? ORDER BY created_at DESC",
                    acc
            )
    );

    return "payment_history";
}


public void sendDepositEmail(String email, int amount) {

    SimpleMailMessage msg = new SimpleMailMessage();

    msg.setTo(email);
    msg.setSubject("💰 Deposit Successful");

    msg.setText(
        "Dear Customer,\n\n" +
        "Your deposit of ₹" + amount + " was successful.\n\n" +
        "If this was not you, contact support immediately.\n\n" +
        "- My Bank"
    );

    mailSender.send(msg);
}


//hidden money controller

@PostMapping("/hide_money")
public String hideMoney(@RequestParam int amount, HttpSession session, Model m) {

    // 🔒 Session check
    if(session.getAttribute("accountno") == null){
        return "redirect:/login";
    }

    String acc = (String) session.getAttribute("accountno");

    // ❌ Invalid amount
    if (amount <= 0) {
        m.addAttribute("status", "error");
        m.addAttribute("msg", "Invalid amount ❌");
    }
    else {

        int balance = jdbc.queryForObject(
            "SELECT balance FROM account_balance WHERE accountno=?", 
            Integer.class, acc
        );

        // ❌ Insufficient balance
        if (balance < amount) {
            m.addAttribute("status", "error");
            m.addAttribute("msg", "Insufficient Balance ❌");
        }
        else {

            // ✅ Update balances
            jdbc.update(
                "UPDATE account_balance SET balance = balance - ?, hidden_balance = hidden_balance + ? WHERE accountno=?",
                amount, amount, acc
            );

            // 📊 Transaction history
            jdbc.update(
                "INSERT INTO transfer_details(from_account,to_account,amount,credit_amount) VALUES(?,?,?,?)",
                acc, "HIDDEN", amount, 0
            );

            m.addAttribute("status", "success");
            m.addAttribute("msg", "Money moved to hidden balance 🔒");
        }
    }

    // 🔁 Reload BOTH balances (VERY IMPORTANT)
    int mainBalance = jdbc.queryForObject(
        "SELECT balance FROM account_balance WHERE accountno=?",
        Integer.class, acc
    );

    int hidden = jdbc.queryForObject(
        "SELECT hidden_balance FROM account_balance WHERE accountno=?",
        Integer.class, acc
    );

    m.addAttribute("main_balance", mainBalance);
    m.addAttribute("hidden", hidden);

    return "hidden_dashboard";  // 🔥 FIXED (IMPORTANT)
}


//hidden dashboard
@GetMapping("/hidden_dashboard")
public String hiddenDashboard(HttpSession session, Model m) {

    // 🔒 session check
    if(session.getAttribute("accountno") == null){
        return "redirect:/login";
    }

    String acc = (String) session.getAttribute("accountno");

    // 🔥 MAIN BALANCE
    int mainBalance = jdbc.queryForObject(
        "SELECT balance FROM account_balance WHERE accountno=?",
        Integer.class, acc
    );

    // 🔥 HIDDEN BALANCE
    int hidden = jdbc.queryForObject(
        "SELECT hidden_balance FROM account_balance WHERE accountno=?",
        Integer.class, acc
    );

    // 🔥 SEND TO JSP
    m.addAttribute("main_balance", mainBalance);
    m.addAttribute("hidden", hidden);

    return "hidden_dashboard";
}

//unhide money

@PostMapping("/unhide_money")
public String unhide(@RequestParam int amount, HttpSession session, Model m) {

    if(session.getAttribute("accountno") == null){
        return "redirect:/login";
    }

    String acc = (String) session.getAttribute("accountno");

    int hidden = jdbc.queryForObject(
        "SELECT hidden_balance FROM account_balance WHERE accountno=?",
        Integer.class, acc
    );

    if (amount <= 0) {
        m.addAttribute("status", "error");
        m.addAttribute("msg", "Invalid amount ❌");
    }
    else if (hidden < amount) {
        m.addAttribute("status", "error");
        m.addAttribute("msg", "Not enough hidden balance ❌");
    }
    else {

        // ✅ UPDATE BOTH BALANCES
        jdbc.update(
            "UPDATE account_balance SET balance = balance + ?, hidden_balance = hidden_balance - ? WHERE accountno=?",
            amount, amount, acc
        );

        m.addAttribute("status", "success");
        m.addAttribute("msg", "Money restored successfully ✅");
    }

    // 🔥 VERY IMPORTANT: RELOAD BOTH BALANCES
    int mainBalance = jdbc.queryForObject(
        "SELECT balance FROM account_balance WHERE accountno=?",
        Integer.class, acc
    );

    int updatedHidden = jdbc.queryForObject(
        "SELECT hidden_balance FROM account_balance WHERE accountno=?",
        Integer.class, acc
    );

    m.addAttribute("main_balance", mainBalance);   // 🔥 MISSING BEFORE
    m.addAttribute("hidden", updatedHidden);

    return "hidden_dashboard";
}

@GetMapping("/hidden_wallet")
public String hiddenWalletPage() {
    return "hidden_wallet";
}

@GetMapping("/hidden_home")
public String hiddenHome(HttpSession session, Model m) {

    String acc = (String) session.getAttribute("accountno");

    int main = jdbc.queryForObject(
        "SELECT balance FROM account_balance WHERE accountno=?",
        Integer.class, acc
    );

    int hidden = jdbc.queryForObject(
        "SELECT hidden_balance FROM account_balance WHERE accountno=?",
        Integer.class, acc
    );

    m.addAttribute("main_balance", main);
    m.addAttribute("hidden", hidden);

    return "hidden_home";
}

@GetMapping("/hidden_deposit")
public String hiddenDeposit(HttpSession session, Model m) {

    if(session.getAttribute("accountno") == null){
        return "redirect:/login";
    }

    String acc = (String) session.getAttribute("accountno");

    int main = jdbc.queryForObject(
        "SELECT balance FROM account_balance WHERE accountno=?",
        Integer.class, acc
    );

    int hidden = jdbc.queryForObject(
        "SELECT hidden_balance FROM account_balance WHERE accountno=?",
        Integer.class, acc
    );

    m.addAttribute("main_balance", main);
    m.addAttribute("hidden", hidden);

    return "hidden_deposit";  // JSP name
}

@PostMapping("/setHiddenPin")
@ResponseBody
public String setHiddenPin(@RequestParam String pin, HttpSession session) {

    String acc = (String) session.getAttribute("accountno");

    jdbc.update("UPDATE create_account SET hidden_pin=? WHERE accountno=?", pin, acc);

    return "PIN saved";
}
@PostMapping("/verifyHiddenPin")
@ResponseBody
public String verifyHiddenPin(@RequestParam String pin, HttpSession session) {

    String acc = (String) session.getAttribute("accountno");

    String dbPin = jdbc.queryForObject(
        "SELECT hidden_pin FROM create_account WHERE accountno=?",
        String.class,
        acc
    );

    if (dbPin != null && dbPin.equals(pin)) {
        return "SUCCESS";
    } else {
        return "FAIL";
    }
}

@GetMapping("/fingerprint/register/options")
@ResponseBody
public Map<String, Object> registerOptions(HttpSession session) {

    String acc = (String) session.getAttribute("accountno");

    byte[] challenge = new byte[32];
    new java.security.SecureRandom().nextBytes(challenge);

    session.setAttribute("challenge", challenge);

    return Map.of(
        "challenge", java.util.Base64.getEncoder().encodeToString(challenge),
        "rp", Map.of("name", "My Bank"),
        "user", Map.of(
            "id", acc,
            "name", acc,
            "displayName", acc
        ),
        "pubKeyCredParams", List.of(Map.of("type", "public-key", "alg", -7)),
        "authenticatorSelection", Map.of("userVerification", "required"),
        "timeout", 60000
    );
}
@PostMapping("/fingerprint/register/verify")
@ResponseBody
public String registerVerify(@RequestBody Map<String,String> data, HttpSession session) {

    String acc = (String) session.getAttribute("accountno");

    String credentialId = data.get("id");
    String publicKey = data.get("publicKey");

    jdbc.update(
        "UPDATE create_account SET credential_id=?, public_key=? WHERE accountno=?",
        credentialId, publicKey, acc
    );

    return "REGISTERED";
}

@GetMapping("/fingerprint/login/options")
@ResponseBody
public Map<String, Object> loginOptions(HttpSession session) {

    byte[] challenge = new byte[32];
    new java.security.SecureRandom().nextBytes(challenge);

    session.setAttribute("challenge", challenge);

    return Map.of(
        "challenge", java.util.Base64.getEncoder().encodeToString(challenge),
        "timeout", 60000,
        "userVerification", "required"
    );
}

@PostMapping("/fingerprint/login/verify")
@ResponseBody
public String loginVerify(@RequestBody Map<String,String> data, HttpSession session) {

    String acc = (String) session.getAttribute("accountno");

    String stored = jdbc.queryForObject(
        "SELECT credential_id FROM create_account WHERE accountno=?",
        String.class,
        acc
    );

    String incoming = data.get("id");

    if (stored != null && stored.equals(incoming)) {
        return "SUCCESS";
    } else {
        return "FAIL";
    }
}


@GetMapping("/downloadCertificate")
public void downloadCertificate(@RequestParam int loanId,
                                HttpServletResponse response,
                                HttpSession session) throws Exception {

    String acc = (String) session.getAttribute("accountno");

    Map<String,Object> loan = jdbc.queryForMap(
        "SELECT * FROM loan_master WHERE loan_id=?",
        loanId
    );

    // 🔥 GET USER NAME
    String name = jdbc.queryForObject(
        "SELECT name FROM register WHERE accountno=?",
        String.class,
        acc
    );

    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition", "attachment; filename=LoanCertificate.pdf");

    Document document = new Document();
    PdfWriter.getInstance(document, response.getOutputStream());

    document.open();

    // TITLE
    Font titleFont = new Font(Font.FontFamily.HELVETICA, 20, Font.BOLD);
    Paragraph title = new Paragraph("Loan Closure Certificate", titleFont);
    title.setAlignment(Element.ALIGN_CENTER);
    document.add(title);

    document.add(new Paragraph("\n"));

    // CONTENT
    document.add(new Paragraph("This is to certify that:"));
    document.add(new Paragraph("\n"));

    document.add(new Paragraph("Name: " + name));
    document.add(new Paragraph("Account Number: " + acc));
    document.add(new Paragraph("Loan Amount: ₹ " + loan.get("amount")));
    document.add(new Paragraph("Status: " + loan.get("status")));

    document.add(new Paragraph("\n"));

    document.add(new Paragraph(
        "The above loan has been successfully repaid and closed."
    ));

    document.add(new Paragraph("\n\n"));

    document.add(new Paragraph("Date: " + java.time.LocalDate.now()));

    document.add(new Paragraph("\n\nAuthorized Signature"));

    document.close();
}




}