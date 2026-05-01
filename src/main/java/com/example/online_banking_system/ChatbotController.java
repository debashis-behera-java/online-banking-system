package com.example.online_banking_system;

import org.springframework.web.bind.annotation.*;
import org.springframework.http.*;
import org.springframework.web.client.RestTemplate;

import java.util.*;

@RestController
@CrossOrigin(origins = "*")
public class ChatbotController {

  private final String API_KEY = System.getenv("OPENROUTER_API_KEY"); // 🔥 paste here

    @PostMapping("/chat")
    public String chat(@RequestBody String message) {

        String msg = message.toLowerCase();

        // ✅ 1. RULE-BASED (FAST)
        if (msg.contains("balance")) {
            return "💰 You can check your balance in 'Check Account' section.";
        }

        if (msg.contains("transfer")) {
            return "🔁 Go to Transfer section and enter account details.";
        }

        if (msg.contains("loan")) {
            return "💳 You can apply loan in Loan section.";
        }

        if (msg.contains("emi")) {
            return "📊 EMI depends on amount, interest, and duration.";
        }

        if (msg.contains("hello") || msg.contains("hi")) {
            return "👋 Hello! How can I help you today?";
        }

        // 🤖 2. REAL AI (Nemotron FREE)
        try {
            RestTemplate restTemplate = new RestTemplate();

            String url = "https://openrouter.ai/api/v1/chat/completions";

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.setBearerAuth(API_KEY);

            // 🔥 REQUIRED HEADERS
            headers.add("HTTP-Referer", "http://localhost:8082");
            headers.add("X-Title", "Banking AI");

            String body = """
            {
              "model": "nvidia/nemotron-3-super-120b-a12b:free",
              "messages": [
                {
                  "role": "system",
                  "content": "You are a helpful banking assistant. Keep answers short and clear."
                },
                {
                  "role": "user",
                  "content": "%s"
                }
              ]
            }
            """.formatted(message);

            HttpEntity<String> request = new HttpEntity<>(body, headers);

            Map<?, ?> response = restTemplate.postForObject(url, request, Map.class);

            // 🔥 SAFE PARSING
            if (response == null) {
                return "⚠️ No response from AI";
            }

            List<?> choices = (List<?>) response.get("choices");
            if (choices == null || choices.isEmpty()) {
                return "⚠️ AI returned empty response";
            }

            Map<?, ?> choice = (Map<?, ?>) choices.get(0);
            Map<?, ?> msgRes = (Map<?, ?>) choice.get("message");

            return msgRes.get("content").toString();

        } catch (Exception e) {
            e.printStackTrace();
            return "⚠️ AI busy or unavailable. Try again.";
        }
    }
}