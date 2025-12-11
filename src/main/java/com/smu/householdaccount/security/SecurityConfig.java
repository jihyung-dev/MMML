package com.smu.householdaccount.security;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import org.springframework.stereotype.Component;

import java.io.IOException;

import static com.smu.householdaccount.security.PathList.*;

@Configuration
@Profile("prod")
@RequiredArgsConstructor
public class SecurityConfig {

    // [추가] 위에서 만든 핸들러 주입
    private final CustomLogoutSuccessHandler customLogoutSuccessHandler;

    // CSRF 방지용 보안, 웹 보안 설정
    // oAuth2.0 로그인을 직접 구현하고 있어서 oAuth2Login 기능 미사용.
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf(csrf ->
                        csrf.ignoringRequestMatchers("/api/**")
                        .ignoringRequestMatchers(AI.getPath()) // 기존 코드 병합
                ) // api는 토큰으로 이루어지고 있기 때문에 csrf 보안에서 제외
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers(
                                PathList.values(LOGIN, ERROR, ERROR_ALL, FAVICON, AI, KAKAO, NAVER, OAUTH2_1, OAUTH2_2,
                                        STATIC_CSS, STATIC_ASSETS, STATIC_IMG, STATIC_JS, ALL)
                        ).permitAll()
                        .anyRequest().authenticated()
                )
                .csrf(csrf -> csrf
                        .ignoringRequestMatchers(AI.getPath()))
                .formLogin(form -> form
                        .loginPage("/user/login")
                        .permitAll()
                )

                // [수정] 로그아웃 설정
                .logout(logout -> logout
                        // 1. GET 방식 로그아웃 허용 (<a> 태그 버튼 사용 시 필수)
                        .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))

                        .invalidateHttpSession(true)
                        .deleteCookies("JSESSIONID")

                        // 2. 아래에 정의한 핸들러 빈 호출
                        .logoutSuccessHandler(logoutSuccessHandler())
                );

        return http.build();
    }

    // [추가] 로그아웃 핸들러 (스레드 안전한 방식)
    @Bean
    public SimpleUrlLogoutSuccessHandler logoutSuccessHandler() {
        return new SimpleUrlLogoutSuccessHandler() {
            @Override
            public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
                // [디버깅용 로그] 이 줄을 추가하세요!
                System.out.println(">>> 로그아웃 핸들러 실행됨! Referer: " + request.getHeader("Referer"));
                // 이전 페이지 가져오기
                String refererUrl = request.getHeader("Referer");

                // 갈 곳 정하기 (없으면 메인)
                String targetUrl = (refererUrl != null && !refererUrl.isEmpty()) ? refererUrl : "/";

                // [핵심] 빈의 설정을 바꾸지 않고, 즉시 리다이렉트 수행 (동시성 문제 해결)
                getRedirectStrategy().sendRedirect(request, response, targetUrl);
            }
        };
    }
}