package com.smu.householdaccount.controller;

import com.smu.householdaccount.service.AIService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller()
@RequestMapping("/ai")
public class AIController {
    private final AIService aiService;

    public AIController(AIService aiService) {
        this.aiService = aiService;
    }

    @GetMapping("/") 
    @ResponseBody
    public String aiTest() throws Exception{
        aiService.getAuthUrl();
        return "success";
    }
}

