package com.smu.householdaccount.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

import static com.smu.householdaccount.security.PathList.*;

@Configuration
@Profile("prod")
public class SecurityConfig {

    @Bean
    @Order(1)
    public SecurityFilterChain apiChain(HttpSecurity http) throws Exception {
        http
                .securityMatcher(PathList.values(API_LEDGER, EXCEL, AI))
                .csrf(csrf -> csrf.ignoringRequestMatchers(PathList.values(API_LEDGER, EXCEL, AI)))
                .authorizeHttpRequests(auth -> auth
                        .anyRequest().authenticated()   // 세션 인증 필요
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
}