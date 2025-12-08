package com.smu.householdaccount.controller;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.smu.householdaccount.entity.common.Member;

@Controller
@RequiredArgsConstructor
public class AdminController {

    @GetMapping("/admin")
    public String adminHome(HttpSession session, Model model) {
        Member loginUser = (Member) session.getAttribute("loginUser");

        // 혹시 직접 URL로 들어올 때 대비
        if (loginUser == null || !"ADMIN".equalsIgnoreCase(loginUser.getRole())) {
            return "redirect:/";   // 비관리자는 메인으로 보냄
        }

        model.addAttribute("admin", loginUser);
        return "admin/dashboard";  // templates/admin/dashboard.html
    }
}
