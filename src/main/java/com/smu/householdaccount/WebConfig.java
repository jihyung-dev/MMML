
//package com.smu.householdaccount;
//
//import com.smu.householdaccount.interceptor.AutoLoginInterceptorDev;
//import lombok.AllArgsConstructor;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//
//@Configuration
//@AllArgsConstructor( onConstructor_ = @Autowired)
//public class WebConfig implements WebMvcConfigurer {
//
//    private final AutoLoginInterceptorDev autoLoginInterceptorDev;
//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        registry
//                .addInterceptor(autoLoginInterceptorDev)
//                .addPathPatterns("/**")
//                .excludePathPatterns("/css/**", "/js/**", "/img/**", "/favicon.ico","/seller/login","/user/login");
//    }
//}
//
//
