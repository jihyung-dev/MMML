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

                // [추가] 로그아웃 설정 추가
                .logout(logout -> logout
                        .logoutUrl("/logout")             // 로그아웃 요청 URL (HTML에서 이 주소로 호출)
                        .invalidateHttpSession(true)      // 세션 무효화
                        .deleteCookies("JSESSIONID")      // 쿠키 삭제 (선택 사항)
                        .logoutSuccessHandler(customLogoutSuccessHandler) // ★ 핵심: 커스텀 핸들러 연결
                );

        return http.build();
    }
}