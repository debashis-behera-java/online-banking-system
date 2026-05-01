package com.example.online_banking_system;

import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;

@Controller
public class CustomerController {

    @Autowired
    JdbcTemplate jdbc;

    @Autowired
    private JavaMailSender mailSender;

    // ================= DASHBOARD =================
    @GetMapping("/customerdashboard")
    public String dashboard() {
        return "customerdashboard";
    }

    // ================= PROFILE =================
    @GetMapping("/profile")
    public String profile(Model m, HttpSession session) {

        String acc = (String) session.getAttribute("accountno");

        List<Map<String, Object>> user =
                jdbc.queryForList("SELECT * FROM create_account WHERE accountno=?", acc);

        for (Map<String, Object> u : user) {
            byte[] img = (byte[]) u.get("photo");
            if (img != null) {
                u.put("photoBase64", Base64.getEncoder().encodeToString(img));
            }
        }

        m.addAttribute("usermaster", user);
        return "profile";
    }

 @GetMapping("/check_account")
public String check(@RequestParam(value="accountno", required=false) String acc,
                    Model m,
                    HttpSession session) {

    // ✅ if no param → use session
    if (acc == null || acc.isEmpty()) {
        acc = (String) session.getAttribute("accountno");
    } else {
        session.setAttribute("accountno", acc);
    }

    // ✅ still null? → just open page (no error)
    if (acc != null) {
        m.addAttribute("blnc",
            jdbc.queryForList("SELECT * FROM account_balance WHERE accountno=?", acc));
    }

    return "check_account";
}

    // ================= UPDATE PROFILE PAGE =================
    @GetMapping("/updateprofile")
    public String updateProfilePage(Model m, HttpSession session) {

        String acc = (String) session.getAttribute("accountno");

        List<Map<String, Object>> user =
                jdbc.queryForList("SELECT * FROM create_account WHERE accountno=?", acc);

        m.addAttribute("user", user.get(0));

        return "updateprofile";
    }

    // ================= SEND OTP =================
    @PostMapping("/updateprofiledata")
    public String sendOtpForUpdate(@RequestParam String name,
                                  @RequestParam String email,
                                  @RequestParam String mobile_no,
                                  @RequestParam String city,
                                  @RequestParam String state,
                                  @RequestParam String pin,
                                  @RequestParam String address,
                                  HttpSession session,
                                  Model m) {

        // 🔥 Generate 6-digit OTP
        int otp = (int)(Math.random() * 900000) + 100000;

        // Store OTP + time
       session.setAttribute("profile_otp", otp);
        session.setAttribute("otp_time", System.currentTimeMillis());

        // Store new values
        session.setAttribute("new_name", name);
        session.setAttribute("new_email", email);
        session.setAttribute("new_mobile", mobile_no);
        session.setAttribute("new_city", city);
        session.setAttribute("new_state", state);
        session.setAttribute("new_pin", pin);
        session.setAttribute("new_address", address);

        // 🔥 Send Email
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setTo(email);
        msg.setSubject("🔐 OTP Verification - Banking System");
        msg.setText(
            "Dear Customer,\n\nYour OTP for profile update is: " + otp +
            "\n\nThis OTP is valid for 2 minutes.\n\nDo not share this OTP.\n\n- Bank Security Team"
        );

        mailSender.send(msg);

        m.addAttribute("msg", "OTP sent to your email");
        m.addAttribute("actionUrl", "/verify-profile-otp");

        return "otp_page";
    }

    // ================= VERIFY OTP =================
    @PostMapping("/verify-profile-otp")
    public String verifyOtp(@RequestParam int otp,
                            HttpSession session,
                            Model m) {

       Object sessionOtpObj = session.getAttribute("profile_otp");
        Object timeObj = session.getAttribute("otp_time");

        if (sessionOtpObj == null || timeObj == null) {
            m.addAttribute("msg", "Session expired. Please try again.");
            return "otp_page";
        }

        int sessionOtp = (int) sessionOtpObj;
        long otpTime = (long) timeObj;

        // 🔥 OTP expiry (2 minutes)
        if (System.currentTimeMillis() - otpTime > 120000) {
            m.addAttribute("msg", "⏰ OTP expired. Please try again.");
            return "otp_page";
        }

        // ✅ OTP MATCH
        if (otp == sessionOtp) {

            String acc = (String) session.getAttribute("accountno");

            jdbc.update(
                "UPDATE create_account SET name=?, email=?, mobile_no=?, city=?, state=?, pin=?, address=? WHERE accountno=?",
                session.getAttribute("new_name"),
                session.getAttribute("new_email"),
                session.getAttribute("new_mobile"),
                session.getAttribute("new_city"),
                session.getAttribute("new_state"),
                session.getAttribute("new_pin"),
                session.getAttribute("new_address"),
                acc
            );

            // 🔥 CLEAR SESSION
           session.removeAttribute("profile_otp");
            session.removeAttribute("otp_time");

            m.addAttribute("type", "profile");
return "success";
        }

        // ❌ WRONG OTP
        m.addAttribute("msg", "❌ Invalid OTP");
        return "otp_page";
    }

    // ================= RESEND OTP =================
    @GetMapping("/resend-otp")
    public String resendOtp(HttpSession session, Model m) {

        int otp = (int)(Math.random() * 900000) + 100000;

         session.setAttribute("profile_otp", otp); 
        session.setAttribute("otp_time", System.currentTimeMillis());

        String email = (String) session.getAttribute("new_email");

        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setTo(email);
        msg.setSubject("🔐 Resend OTP - Banking System");
        msg.setText("Your new OTP is: " + otp);

        mailSender.send(msg);

        m.addAttribute("msg", "OTP resent successfully");

        return "otp_page";
    }

@GetMapping("/withdraw")
public String withdrawPage(Model m, HttpSession session) {
    return "withdraw";
}
}