package com.smu.householdaccount.interceptor;

import com.smu.householdaccount.entity.Member;
import com.smu.householdaccount.entity.Seller;
import com.smu.householdaccount.service.MemberService;
import com.smu.householdaccount.service.SellerService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
@AllArgsConstructor(onConstructor_ = @Autowired)
public class AutoLoginInterceptorDev implements HandlerInterceptor {

    private final MemberService memberService;

    //컨드롤러 도작전에 자동 셀러,유저 로그인
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //1,123-01-00006,U006,식품제조/농산물,2025-11-25 10:57:29,
        HttpSession session = request.getSession();
        Object loginUser = session.getAttribute("loginUser");

        if(loginUser!=null) return true;

        Member loginMember=memberService.login("U006","1234");
        session.setAttribute("loginUser",loginMember);


        return true;
    }
}