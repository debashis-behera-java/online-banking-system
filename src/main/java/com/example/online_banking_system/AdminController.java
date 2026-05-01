package com.example.online_banking_system;

import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    JdbcTemplate jdbc;

   

    

   @GetMapping("/admindashboard")
public String adminDashboard(Model m, HttpSession session) {

    Object name = session.getAttribute("name");
    if (name == null) {
        return "redirect:/login";
    }

    

    Integer totalCustomer = jdbc.queryForObject(
            "SELECT COUNT(*) FROM register WHERE role='customer'",
            Integer.class
    );

    Integer totalTransaction = jdbc.queryForObject(
            "SELECT COUNT(*) FROM transfer_details",
            Integer.class
    );

    Integer activeCustomer = jdbc.queryForObject(
            "SELECT COUNT(*) FROM register WHERE role='customer' AND status=1",
            Integer.class
    );

    Integer inactiveCustomer = jdbc.queryForObject(
            "SELECT COUNT(*) FROM register WHERE role='customer' AND status=0",
            Integer.class
    );

    Integer pendingRequests = jdbc.queryForObject(
            "SELECT COUNT(*) FROM create_account WHERE status=0",
            Integer.class
    );

    Integer totalMessages = jdbc.queryForObject(
            "SELECT COUNT(*) FROM contact_table",
            Integer.class
    );

    m.addAttribute("name", name);
    m.addAttribute("totalCustomer", totalCustomer == null ? 0 : totalCustomer);
    m.addAttribute("totalTransaction", totalTransaction == null ? 0 : totalTransaction);
    m.addAttribute("activeCustomer", activeCustomer == null ? 0 : activeCustomer);
    m.addAttribute("inactiveCustomer", inactiveCustomer == null ? 0 : inactiveCustomer);
    m.addAttribute("pendingRequests", pendingRequests == null ? 0 : pendingRequests);
    m.addAttribute("totalMessages", totalMessages == null ? 0 : totalMessages);
List<Map<String,Object>> fraudList =
    jdbc.queryForList(
        "SELECT * FROM fraud_log WHERE action IS NULL ORDER BY date DESC LIMIT 5"
    );
   
System.out.println("FRAUD LIST SIZE = " + fraudList.size());

m.addAttribute("frauds", fraudList);

if (!fraudList.isEmpty()) {
    m.addAttribute("showFraudAlert", true);
} else {
    m.addAttribute("showFraudAlert", false);
}


    return "admindashboard";
}

    @GetMapping("/customeraccounts")
    public String customeraccounts(Model m) {
        List<Map<String, Object>> li = jdbc.queryForList(
                "SELECT * FROM create_account"
        );

        for (Map<String, Object> user : li) {
            byte[] img = (byte[]) user.get("photo");
            if (img != null) {
                user.put("photoBase64", Base64.getEncoder().encodeToString(img));
            }
        }

        m.addAttribute("li", li);
        return "customeraccounts";
    }

    @GetMapping("/activeusers")
    public String activeusers(Model m) {
        m.addAttribute("li",
                jdbc.queryForList("SELECT * FROM register WHERE role!='admin' AND status=1"));
        return "activeusers";
    }

    @GetMapping("/customer")
    public String customer(Model m) {
        m.addAttribute("usermaster",
                jdbc.queryForList("SELECT * FROM register WHERE role!='admin'"));
        return "customer";
    }

    @PostMapping("/manageuser")
    public String manageuser(@RequestParam String email,
                             @RequestParam String btn,
                             Model m) {
if ("Delete".equalsIgnoreCase(btn)) {

    // delete from register (if exists)
    jdbc.update("DELETE FROM register WHERE email=?", email);

    // delete from create_account (IMPORTANT)
    jdbc.update("DELETE FROM create_account WHERE email=?", email);

    return customeraccounts(m); // reload same page
}

        List<Map<String, Object>> regUser = jdbc.queryForList(
                "SELECT accountno,name,email,role,status FROM register WHERE email=?",
                email
        );

        if (!regUser.isEmpty()) {
            m.addAttribute("usermaster", regUser);
            return "edituser";
        }

        List<Map<String, Object>> createUser = jdbc.queryForList(
                "SELECT accountno,name,email,status FROM create_account WHERE email=?",
                email
        );

        if (!createUser.isEmpty()) {
            Map<String, Object> row = createUser.get(0);
            row.put("role", "customer");
            m.addAttribute("usermaster", createUser);
            return "edituser";
        }

        m.addAttribute("usermaster", jdbc.queryForList("SELECT * FROM register WHERE role!='admin'"));
        return "customer";
    }

    @PostMapping("/updateuser")
    public String updateuser(@RequestParam String email,
                             @RequestParam String name,
                             @RequestParam String role,
                             @RequestParam String status,
                             Model m) {

        List<Map<String, Object>> regUser = jdbc.queryForList(
                "SELECT * FROM register WHERE email=?",
                email
        );

        if (!regUser.isEmpty()) {
            jdbc.update(
                    "UPDATE register SET name=?, role=?, status=? WHERE email=?",
                    name, role, status, email
            );
        }

        List<Map<String, Object>> createUser = jdbc.queryForList(
                "SELECT * FROM create_account WHERE email=?",
                email
        );

        if (!createUser.isEmpty()) {
            jdbc.update(
                    "UPDATE create_account SET name=?, status=? WHERE email=?",
                    name, status, email
            );
        }

        return customeraccounts(m);
    }

    @GetMapping("/faq_admin")
    public String faq(Model m) {
        m.addAttribute("usermaster", jdbc.queryForList("SELECT * FROM faq"));
        return "faq_admin";
    }

    @PostMapping("/addfaq")
    public String addfaq(@RequestParam String question,
                         @RequestParam String answer,
                         Model m) {
        jdbc.update("INSERT INTO faq(question,answer) VALUES(?,?)", question, answer);
        return faq(m);
    }

    @PostMapping("/managefaq")
    public String managefaq(@RequestParam int slno,
                            @RequestParam String btn,
                            Model m) {

        if ("Delete".equalsIgnoreCase(btn)) {
            jdbc.update("DELETE FROM faq WHERE slno=?", slno);
            return faq(m);
        }

        List<Map<String, Object>> faqs = jdbc.queryForList("SELECT * FROM faq");
        m.addAttribute("usermaster", faqs);
        return "faq_admin";
    }

    @GetMapping("/message")
public String message(Model m) {
    m.addAttribute("messages", jdbc.queryForList("SELECT * FROM contact_table ORDER BY slno DESC"));
    return "message";
}
@PostMapping("/deletemessage")
public String deleteMessage(@RequestParam("id") int id) {
    jdbc.update("DELETE FROM contact_table WHERE slno=?", id);
    return "redirect:/message";
}

@PostMapping("/allowTransaction")
public String allowTransaction(@RequestParam int id) {

    jdbc.update(
        "UPDATE fraud_log SET action='APPROVED' WHERE id=?",
        id
    );

    return "redirect:/admindashboard";
}   
@PostMapping("/blockTransaction")
public String blockTransaction(@RequestParam int id,
                               @RequestParam String accountno) {

    // Mark as blocked
    jdbc.update(
        "UPDATE fraud_log SET action='BLOCKED' WHERE id=?",
        id
    );

    // Disable account
    jdbc.update(
        "UPDATE register SET status=0 WHERE accountno=?",
        accountno
    );

    return "redirect:/admindashboard";
}


@PostMapping("/deleteFraud")
public String deleteFraud(@RequestParam int id) {

    jdbc.update(
        "DELETE FROM fraud_log WHERE id=?",
        id
    );

    return "redirect:/admindashboard";
}

}