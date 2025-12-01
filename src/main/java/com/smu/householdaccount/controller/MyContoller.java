package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.Member;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("/mypage")
public class MyContoller {
    @GetMapping
    public String myPage(
            @SessionAttribute("loginUser") Member loginUser,
            Model model
    ){
        model.addAttribute("member",loginUser);
        return "user/mypage";
    }
}
