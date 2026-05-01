package com.example.online_banking_system;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.twilio.Twilio;

import jakarta.servlet.http.HttpSession;


import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;


import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@Controller
public class AuthController {

    @Autowired
    JdbcTemplate jdbc;

     @Autowired
    private JavaMailSender mailSender;


     public void sendAccountEmail(String toEmail, String name, Long accountno) {
        SimpleMailMessage msg = new SimpleMailMessage();
     


        msg.setTo(toEmail);
        msg.setSubject("Account Request Submitted");

        msg.setText("Hello " + name + ",\n\n"
                + "Your account request has been submitted successfully.\n"
                + "Your Account Number: " + accountno + "\n\n"
                + "Please wait for admin approval.\n\n"
                + "Thank you.");

        mailSender.send(msg);
    }


public void sendSMS(String mobile, String messageBody) {


    String ACCOUNT_SID = System.getenv("TWILIO_SID");
    String AUTH_TOKEN = System.getenv("TWILIO_TOKEN");

   

    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

    Message message = Message.creator(
            new PhoneNumber("+91" + mobile),   // user number
            new PhoneNumber("+12605295779"), // twilio number
            messageBody
    ).create();

    System.out.println("SMS SID: " + message.getSid());
}
    

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/create_account")
    public String createAccountPage() {
        return "create_account";
    }

   @PostMapping("/create_account")
public String createAccount(
        @RequestParam Map<String, String> data,
        @RequestParam("photo") MultipartFile photo,
        Model m) throws IOException {

    // 1️⃣ Get values
    String name = data.get("name");
    String email = data.get("email");
    String aadhar = data.get("aadhar_no");
    String pan = data.get("pan_no");
    String mobile = data.get("mobile_no");

    // 2️⃣ VALIDATION

    if (name == null || !name.matches("^[A-Za-z ]+$")) {
        m.addAttribute("error", "Name must contain only letters");
        return "create_account";
    }

    if (email == null || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
        m.addAttribute("error", "Invalid Email");
        return "create_account";
    }

    if (aadhar == null || !aadhar.matches("\\d{12}")) {
        m.addAttribute("error", "Aadhaar must be 12 digits");
        return "create_account";
    }

    if (pan == null || !pan.matches("[A-Z]{5}[0-9]{4}[A-Z]")) {
        m.addAttribute("error", "Invalid PAN format (ABCDE1234F)");
        return "create_account";
    }

    if (mobile == null || !mobile.matches("[6-9]\\d{9}")) {
        m.addAttribute("error", "Invalid Mobile Number");
        return "create_account";
    }

    // 3️⃣ DUPLICATE CHECK
    Integer count = jdbc.queryForObject(
            "SELECT COUNT(*) FROM create_account WHERE email = ? OR aadhar_no = ?",
            Integer.class,
            email, aadhar
    );

    if (count != null && count > 0) {
        m.addAttribute("error", "User already exists with same Email or Aadhaar");
        return "create_account";
    }

    // 4️⃣ Convert photo
    byte[] img = photo.getBytes();

    // 5️⃣ INSERT INTO DATABASE
    jdbc.update("""
        INSERT INTO create_account
        (name, account_type, email, fathers_name, mothers_name, dob, gender, occupation,
         aadhar_no, mobile_no, marital_status, pan_no, nationality, religion,
         qualification, category, address, city, state, pin, photo, status)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    """,
            name,
            data.get("account_type"),
            email,
            data.get("fathers_name"),
            data.get("mothers_name"),
            data.get("dob"),
            data.get("gender"),
            data.get("occupation"),
            aadhar,
            mobile,
            data.get("marital_status"),
            pan,
            data.get("nationality"),
            data.get("religion"),
            data.get("qualification"),
            data.get("category"),
            data.get("address"),
            data.get("city"),
            data.get("state"),
            data.get("pin"),
            img,
            0
    );

    // 6️⃣ GET ACCOUNT NUMBER (simple version for demo)
    Long accountno = jdbc.queryForObject(
            "SELECT MAX(accountno) FROM create_account",
            Long.class
    );

    // 7️⃣ SEND EMAIL + SMS
    sendAccountEmail(email, name, accountno);

    String msg = "Your account request submitted. Account No: " + accountno;

    try {
        sendSMS(mobile, msg);
    } catch (Exception e) {
        m.addAttribute("error", "SMS failed: " + e.getMessage());
        return "create_account";
    }

    // 8️⃣ SUCCESS MESSAGE
    m.addAttribute("sms", "Account Request Submitted Successfully. Wait for Admin Approval.");
    m.addAttribute("accountNo", "Your Account Number: " + accountno);

    return "create_account";
}

    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }

    @PostMapping("/register")
    public String register(@RequestParam Map<String, String> data, Model m) {

        String accountno = data.get("accountno");
        String name = data.get("name");
        String email = data.get("email");
        String password = data.get("password");
        String cpassword = data.get("cpassword");

        if (password == null || !password.equals(cpassword)) {
            m.addAttribute("sms", "Password and Confirm Password do not match");
            return "register";
        }

        List<Map<String, Object>> approvedAccount = jdbc.queryForList(
                "SELECT * FROM create_account WHERE accountno=? AND name=? AND email=? AND status=1",
                accountno, name, email
        );

        if (approvedAccount.isEmpty()) {
            m.addAttribute("sms", "Account not approved by admin or details are incorrect");
            return "register";
        }

        List<Map<String, Object>> existingUser = jdbc.queryForList(
                "SELECT * FROM register WHERE email=?",
                email
        );

        if (!existingUser.isEmpty()) {
            m.addAttribute("sms", "User already registered. Please login.");
            return "register";
        }

        String hash = BCrypt.hashpw(password, BCrypt.gensalt());

        jdbc.update(
                "INSERT INTO register(accountno, name, email, password, role, status) VALUES (?, ?, ?, ?, ?, ?)",
                accountno, name, email, hash, "customer", 1
        );

        jdbc.update(
                "INSERT IGNORE INTO account_balance(accountno, balance) VALUES (?, ?)",
                accountno, 0
        );

        m.addAttribute("sms", "Registration Successful. Please Login.");
        return "login";
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @PostMapping("/login")
public String login(@RequestParam("email") String email,
                    @RequestParam("password") String password,
                    HttpSession session,
                    Model m) {

    System.out.println("EMAIL = [" + email + "]");
    System.out.println("PASSWORD = [" + password + "]");

    List<Map<String, Object>> user = jdbc.queryForList(
            "SELECT * FROM register WHERE email = ?",
            email.trim()
    );

    System.out.println("USER FOUND = " + user.size());

    if (user.isEmpty()) {
        m.addAttribute("sms", "Invalid Email");
        return "login";
    }

    String dbPass = String.valueOf(user.get(0).get("password")).trim();
    String role = String.valueOf(user.get(0).get("role")).trim();
    String name = String.valueOf(user.get(0).get("name")).trim();
    String accountno = String.valueOf(user.get(0).get("accountno")).trim();
    int status = Integer.parseInt(String.valueOf(user.get(0).get("status")));

    System.out.println("DB PASS = [" + dbPass + "]");
    System.out.println("ROLE = [" + role + "]");
    System.out.println("STATUS = [" + status + "]");

    if (status != 1) {
        m.addAttribute("sms", "Account not active");
        return "login";
    }

    boolean matched = false;
    try {
        matched = BCrypt.checkpw(password, dbPass);
    } catch (Exception e) {
        e.printStackTrace();
        m.addAttribute("sms", "Password hash error");
        return "login";
    }

    System.out.println("PASSWORD MATCHED = " + matched);

    if (!matched) {
        m.addAttribute("sms", "Wrong Password");
        return "login";
    }

    session.setAttribute("accountno", accountno);
    session.setAttribute("name", name);
    session.setAttribute("role", role);
    session.setAttribute("email", email);

    if ("admin".equalsIgnoreCase(role)) {
        return "redirect:/admindashboard";
    } else {
        return "customerdashboard";
    }
}

    @PostMapping("/contact")
    public String contact(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String subject,
            @RequestParam String message,
            Model m) {

        jdbc.update(
                "INSERT INTO contact_table(name,email,subject,message) VALUES(?,?,?,?)",
                name, email, subject, message
        );

        m.addAttribute("sms", "Message Sent Successfully");
        return "index";
    }

    @GetMapping("/faq")
public String faq(Model m) {
    List<Map<String, Object>> faqs = jdbc.queryForList("SELECT * FROM faq ORDER BY slno DESC");
    m.addAttribute("faqlist", faqs);
    return "faq";
}

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/forgot")
public String forgotPage() {
    return "forgot";
}


@PostMapping("/send-reset")
public String sendResetOtp(@RequestParam String email,
                           HttpSession session,
                           Model m) {

    List<Map<String, Object>> user =
            jdbc.queryForList("SELECT * FROM register WHERE email=?", email);

    if (user.isEmpty()) {
        m.addAttribute("msg", "Email not found");
        return "forgot";
    }

    int otp = (int)(Math.random() * 900000) + 100000;

    session.setAttribute("resetOtp", otp);
    session.setAttribute("resetEmail", email);

    SimpleMailMessage msg = new SimpleMailMessage();
    msg.setTo(email);
    msg.setSubject("Password Reset OTP");
    msg.setText("Your OTP is: " + otp);

    mailSender.send(msg);

    m.addAttribute("msg", "OTP sent to your email");
    return "reset_password";
}

@PostMapping("/update-password")
public String updatePassword(@RequestParam int otp,
                             @RequestParam String password,
                             HttpSession session,
                             Model m) {

    int sessionOtp = (int) session.getAttribute("resetOtp");
    String email = (String) session.getAttribute("resetEmail");

    if (otp != sessionOtp) {
        m.addAttribute("msg", "Wrong OTP");
        return "reset_password";
    }

    String hash = org.mindrot.jbcrypt.BCrypt.hashpw(password,
            org.mindrot.jbcrypt.BCrypt.gensalt());

    jdbc.update("UPDATE register SET password=? WHERE email=?", hash, email);

    m.addAttribute("msg", "Password updated successfully");
    return "login";
}
}