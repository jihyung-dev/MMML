package com.smu.householdaccount.security; // 패키지명은 프로젝트 구조에 맞게 수정

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class CustomLogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler {

    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        // 1. 요청 헤더에서 사용자가 머물던 페이지(Referer) URL을 가져옵니다.
        String refererUrl = request.getHeader("Referer");

        // 2. Referer가 존재하면 그곳으로, 없으면 메인('/')으로 리다이렉트 설정
        if (refererUrl != null && !refererUrl.isEmpty()) {
            setDefaultTargetUrl(refererUrl);
        } else {
            setDefaultTargetUrl("/");
        }

        // 3. 부모 클래스의 로직 실행 (리다이렉트 수행)
        super.onLogoutSuccess(request, response, authentication);
    }
}