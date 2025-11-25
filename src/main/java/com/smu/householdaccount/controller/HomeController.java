package com.smu.householdaccount.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class HomeController {

    // 메인 홈 페이지
    @GetMapping({"/", "/home"})
    public String home() {
        return "home/indexhome";   // templates/home/indexhome.html
    }
}