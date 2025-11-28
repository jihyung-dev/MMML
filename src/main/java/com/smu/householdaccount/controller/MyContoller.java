package com.smu.householdaccount.controller;

import com.smu.householdaccount.entity.Member;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("/my")
public class MyContoller {
    @GetMapping
    public String myPage(
            @SessionAttribute("loginUser") Member loginUser
    ){
        return "user/mypage";
    }
}
