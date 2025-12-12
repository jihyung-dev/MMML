package com.smu.householdaccount.security;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;


import org.springframework.stereotype.Component;

import java.io.IOException;

import static com.smu.householdaccount.security.PathList.*;

@Configuration
@Profile("prod")
@RequiredArgsConstructor
public class SecurityConfig {

    @Bean
    @Order(1)
    public SecurityFilterChain apiChain(HttpSecurity http) throws Exception {

        http
                .securityMatcher(PathList.values(API_LEDGER, EXCEL, AI, API_GROUP))
                .csrf(csrf -> csrf.ignoringRequestMatchers(PathList.values(API_LEDGER, EXCEL, AI, API_GROUP)))
                .authorizeHttpRequests(auth -> auth
                        // ⭐ 초대 수락 URL은 로그인 없이도 가능해야 함
                        .requestMatchers("/api/group/accept").permitAll()

                        // 나머지 API는 인증 필요
                        .anyRequest().authenticated()
                );

        return http.build();
    }

    @Bean
    @Order(2)
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .securityMatcher(PathList.values(LEDGER))
                .authorizeHttpRequests(auth ->
                        auth
                                .requestMatchers("/login", "/user/login", "/user/**") // 로그인 URL은 보호 X
                                .permitAll()
                                .anyRequest().authenticated()
                )
                .formLogin(form -> form
                        .loginPage("/login")
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
    @Bean
    @Order(3)
    public SecurityFilterChain defaultSecurity(HttpSecurity http) throws Exception {

        http
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/login", "/user/**", "/error/**").permitAll()
                        .anyRequest().permitAll()
                )
                .csrf(csrf -> csrf.disable());

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