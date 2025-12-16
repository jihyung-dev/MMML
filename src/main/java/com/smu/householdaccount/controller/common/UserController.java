package com.smu.householdaccount.controller.common;

import com.smu.householdaccount.dto.CustomUserDetails;
import com.smu.householdaccount.entity.common.Member;
import com.smu.householdaccount.service.common.KakaoApiService;
import com.smu.householdaccount.service.common.MemberService;
import com.smu.householdaccount.service.common.NaverApiService;
import com.smu.householdaccount.util.Log;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.json.simple.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import java.util.Map;
import java.util.UUID;

@Controller()
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController{

    private final KakaoApiService kakaoApiService;
    private final NaverApiService naverApiService;
    private final MemberService memberService;
    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

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
    public String kakaoCallback(
            @RequestParam(required = false) String code,
            @RequestParam(required = false) String error,
            HttpSession session
    ){
        // 1) Provider가 에러 리턴한 경우 (카카오 권한 거부 등)
        if (error != null) {
            Log.e("Kakao returned error param: {}", error);
            return "redirect:/login?error=" + error;
        }

        // 2) code 자체가 없는 경우
        if (code == null) {
            Log.e("Authorization code is null.","");
            return "redirect:/login?error=invalid_request";
        }
        // 3) 인가 코드로 Access Token 발급
        boolean isSuccess = kakaoApiService.handleAuthorizationCallback(code);

        if (!isSuccess) {
            Log.e("Failed to issue token from Kakao API.","");
            return "redirect:/login?error=token_failed";
        }

        // 4) 토큰 성공 → 유저 정보 조회
        JSONObject userInfo = kakaoApiService.getUserProfile();
        if (userInfo == null) {
            Log.e("Failed to fetch user profile from Kakao.","");
            return "redirect:/login?error=userinfo_failed";
        }


        // id는 Long 형태이므로 안전하게 문자열 변환
        String oauthId = userInfo.get("id").toString();

        String provider = "kakao"; // 카카오니까!
        String oauthKey = memberService.buildSimpleOauthKey(provider, oauthId);
        boolean isMember = memberService.isMember(oauthKey);
        Member member = null;
        // 기존 회원의 경우
        if(isMember){
            member = memberService.getMember(oauthKey);
            member.setPassword(null);
            session.setAttribute("loginUser", member);
            session.setAttribute("loginUserId", member.getMemberId());
        }
        // 신규 회원의 경우
        else {
            // 멤버 신규 등록
            JSONObject properties = (JSONObject) userInfo.get("properties");
            String nickname = (String) properties.get("nickname");

            member = new Member();
            String encodedPw = passwordEncoder.encode(UUID.randomUUID().toString());
            member.setPassword(encodedPw);
            member.setMemberName("OAuthUser"); // 임시 이름
            member.setMemberId(oauthKey);
            member.setRole("GENERAL");
            member.setMemberNickname(nickname);
            memberService.registerOAuthUser(member);
            member.setPassword(null);
            session.setAttribute("loginUser", member);
            session.setAttribute("loginUserId", member.getMemberId());
        }
        // CSRF 인증용 세션 저장
        CustomUserDetails userDetails = new CustomUserDetails(member);
        Authentication authentication =
                new UsernamePasswordAuthenticationToken(
                        userDetails,
                        null,
                        userDetails.getAuthorities()
                );
        SecurityContextHolder.getContext().setAuthentication(authentication);
        session.setAttribute(
                HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY,
                SecurityContextHolder.getContext()
        );

        String inviteToken = (String) session.getAttribute("inviteToken");
        // 그룹 가게부 초대 토큰이 있을 경우
        if(inviteToken != null){
            return "redirect:/api/group/accept?token=" + inviteToken;
        }
        // 로그인 성공 후 메인 페이지로
        return "redirect:/home";
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
        Log.d("[naver]", naverApiService.getAuthUrl());
        return new RedirectView(naverApiService.getAuthUrl());
    }

    @GetMapping("/naver/naverCallback")
    public String naverCallback(
            @RequestParam(required = false) String code,
            @RequestParam(required = false) String state,
            @RequestParam(required = false) String error,
            HttpSession session
    ) {

        // 1) Provider에서 에러 내려온 경우 (사용자 취소 등)
        if (error != null) {
            Log.e("[NAVER]Error returned from provider: {}", error);
            return "redirect:/login?error=" + error;
        }

        // 2) 필수 파라미터 검증
        if (code == null || state == null) {
            Log.e("[NAVER]","Missing code or state");
            return "redirect:/login?error=invalid_request";
        }

        // 3) state 토큰 검증
        String savedState = naverApiService.getStateToken();
        if (!state.equals(savedState)) {
            Log.e("[NAVER]","Invalid state token");
            return "redirect:/login?error=invalid_state";
        }

        // 4) Access Token 요청
        String accessToken = naverApiService.requestToken(code, state);
        if (accessToken == null) {
            Log.e("[NAVER]","Failed to issue access token");
            return "redirect:/login?error=token_failed";
        }

        Log.i("[NAVER] Access token issued: {}", accessToken);

        JSONObject userInfo = naverApiService.getUserProfile();
        if (userInfo == null) {
            Log.e("[NAVER]","Failed to fetch user info");
            return "redirect:/login?error=userinfo_failed";
        }

        String provider = "naver";
        Map<String, Object> response = (Map<String, Object>) userInfo.get("response");

        String oauthId = response.get("id").toString();

        String oauthKey = memberService.buildSimpleOauthKey(provider, oauthId);
        boolean isMember = memberService.isMember(oauthKey);
        Member member = null;
        // 기존 회원의 경우
        if(isMember){
            member = memberService.getMember(oauthKey);
            member.setPassword(null);
            session.setAttribute("loginUser", member);
            session.setAttribute("loginUserId", member.getMemberId());
        } else {
            member = new Member();

            String encodedPw = passwordEncoder.encode(UUID.randomUUID().toString());
            member.setPassword(encodedPw);

            member.setRole("GENERAL");
            member.setMemberName("OAuthUser");
            member.setMemberId(oauthKey);
            member.setMemberNickname(response.get("name").toString());
            memberService.registerOAuthUser(member);
            member.setPassword(null);
            session.setAttribute("loginUser", member);
            session.setAttribute("loginUserId", member.getMemberId());
        }

        // CSRF 인증용 세션 저장
        CustomUserDetails userDetails = new CustomUserDetails(member);
        Authentication authentication =
                new UsernamePasswordAuthenticationToken(
                        userDetails,
                        null,
                        userDetails.getAuthorities()
                );
        SecurityContextHolder.getContext().setAuthentication(authentication);
        session.setAttribute(
                HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY,
                SecurityContextHolder.getContext()
        );

        String inviteToken = (String) session.getAttribute("inviteToken");
        // 그룹 가게부 초대 토큰이 있을 경우
        if(inviteToken != null){
            return "redirect:/api/group/accept?token=" + inviteToken;
        }

        return "redirect:/home";
    }



    @GetMapping("/login")
    public String index() {
        return "login";
    }

    @GetMapping("auth/social-info")
    public ResponseEntity<?> socialInfo() {

        return ResponseEntity.ok("");
    }
}
