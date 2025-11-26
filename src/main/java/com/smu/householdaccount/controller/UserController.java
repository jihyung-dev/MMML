package com.smu.householdaccount.controller;

import com.smu.householdaccount.service.KakaoApiService;
import com.smu.householdaccount.service.NaverApiService;
import com.smu.householdaccount.util.Utility;
import jakarta.servlet.http.HttpServlet;
import org.apache.coyote.Response;
import org.json.simple.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.util.UriComponentsBuilder;

@Controller()
@RequestMapping("/user")
public class UserController{

    private final KakaoApiService kakaoApiService;
    private final NaverApiService naverApiService;

    public UserController(KakaoApiService kakaoApiService, NaverApiService naverApiService) {
        this.kakaoApiService = kakaoApiService;
        this.naverApiService = naverApiService;

        System.out.println("암호화 확인용 : " + Utility.encrypt("테스트용"));
    }

    /**
     카카오 로그인 과정
     1. /kakao/authorize로 로그인 페이지로 리다이렉트
     2. 로그인 성공 후 콜백으로 code 리턴
     3. 로그인 성공 되었으면 저장된 토큰으로 유저 정보 획득
     */

    // 카카오 로그인 요청
    @GetMapping("/kakao/authorize")
    public RedirectView kakaoLogin(@RequestParam(required = false) String scope) {
        return new RedirectView(kakaoApiService.getAuthUrl(scope));
    }

    // 카카오 로그인 콜백
    @GetMapping("/kakao/kakaoCallback")
    public String kakaoCallback(@RequestParam String code){
        boolean isSuccess = kakaoApiService.handleAuthorizationCallback(code);
        JSONObject userInfo = kakaoApiService.getUserProfile();
        System.out.println(userInfo);
        return "callback/kakao";
    }

    /**
     네이버 로그인 과정
     1. /naver/authorize로 로그인 페이지로 리다이렉트
     2. 로그인 성공 후 콜백으로 code + state 리턴
     3. 서버에서 POST 방식으로 AccessToken 요청
     4. 토큰 저장후 해당 토큰으로 유저 정보 획득
     **/
    // 네이버 로그인 요청
    @GetMapping("/naver/authorize")
    public RedirectView naverLogin() {
        return new RedirectView(naverApiService.getAuthUrl());
    }

    @GetMapping("/naver/naverCallback")
    public String naverCallback(@RequestParam String code, @RequestParam String state) {
        // 생성한 token값과 비교 진행
        String saved_token = naverApiService.getStateToken();
        System.out.println("saved_token: " + saved_token);
        System.out.println("state : " + state);
        JSONObject userInfo = null;
        // access 토큰 획득 후 로그인 정보 획득
        if(state.equals(saved_token)) {
            String accessToken = naverApiService.requestToken(code, state);
            System.out.println(accessToken);

            userInfo = naverApiService.getUserProfile(); // 유저 프로필 정보 획득 후 홈으로 리다이렉트
        }

        return "callback/naver";
    }


    @GetMapping("/login")
    public String index() {
        return "login";
    }







}
