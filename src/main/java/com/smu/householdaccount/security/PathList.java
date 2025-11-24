package com.smu.householdaccount.security;

import java.util.Arrays;

// CSRF 허용 사이트 ENUM
// favicon - Thymeleaf 페이지 요청하면 브라우저가 자동으로 GET / favicon.ico 요청을 하기에 예외 처리해야됨
public enum PathList {
    ALL("/**"),
    LOGIN("/user/login"),
    ERROR("/error"),
    ERROR_ALL("/error/**"),
    FAVICON("/favicon.ico"),
    SIGNUP("/signup"),
    AI("/ai/**"),
    KAKAO("/user/kakao/**"),
    NAVER("/user/naver/**"),
    OAUTH2_1("/oauth2/**"),
    OAUTH2_2("login?/oauth2/**"),
    // static 파일(css, js, img...)
    STATIC_IMG("/img/**"),
    STATIC_JS("/js/**"),
    STATIC_CSS("/css/**"),
    STATIC_ASSETS("/assets/**"),;


    private final String path;

    PathList(String path){
        this.path = path;
    }

    public String getPath(){
        return this.path;
    }

    public static String[] values(PathList... pages) {
        return Arrays.stream(pages)
                .map(PathList::getPath)
                .toArray(String[]::new);
    }
}
