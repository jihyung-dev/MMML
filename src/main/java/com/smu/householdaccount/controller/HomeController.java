package com.smu.householdaccount.controller;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class HomeController {

    // 메인 홈 페이지
    @GetMapping({"/", "/home"})
    public String home(
            HttpSession session,
            Model model
    ) {
        String inviteError = (String) session.getAttribute("inviteError");
        String inviteSuccess = (String) session.getAttribute("inviteSuccess");

        if (inviteError != null) {
            model.addAttribute("inviteError", inviteError);
            session.removeAttribute("inviteError");
        }

        if (inviteSuccess != null) {
            model.addAttribute("inviteSuccess", inviteSuccess);
            session.removeAttribute("inviteSuccess");
        }

        return "home/indexhome";   // templates/home/indexhome.html
    }
}