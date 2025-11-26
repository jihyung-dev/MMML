package com.smu.householdaccount.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@Profile("dev")
public class SecurityConfigDev {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable())                 // CSRF 비활성화 (테스트용)
                .authorizeHttpRequests(auth -> auth
                        .anyRequest().permitAll()                // 모든 요청 허용
                )
                .logout(logout -> logout
                        .logoutUrl("/logout")                    // 로그아웃 요청 URL
                        .logoutSuccessUrl("/")                   // 로그아웃 후 이동할 URL (메인 페이지)
                );

        return http.build();
    }
}
