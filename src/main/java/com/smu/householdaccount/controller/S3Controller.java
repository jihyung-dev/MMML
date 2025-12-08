package com.smu.householdaccount.controller;

import com.smu.householdaccount.service.common.S3Service;
import com.smu.householdaccount.util.Utility;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@RequestMapping("/s3")
public class S3Controller {

    private final S3Service s3Service;

    public S3Controller(S3Service s3Service, Utility util) {
        this.s3Service = s3Service;
    }

    /**
     * fileName에 확장자명까지 붙여야된다.
     * @param file
     * @param dir
     * @param fileName
     * @return
     * @throws IOException
     */
    @PostMapping("/upload/image")
    public ResponseEntity<?> upload(
            @RequestParam("file") MultipartFile file,
            @RequestParam("dir") String dir,
            @RequestParam("fileName") String fileName) throws IOException {
        String url = s3Service.upload(file, dir ,fileName);
        return ResponseEntity.ok(url);
    }

    /**
     * Presigned URL 방식으로 호출, 보안성, 대규모 트래픽에도 안정적
     * 임시 권한이 있는 URL로만 접근하게 하는 구조
     * 파일 다운로드 혹은 비공개 파일을 잠시 노출할 때 사용
     * @param key
     * @return
     * @throws IOException
     */
    @GetMapping("/presigned")
    public ResponseEntity<String> getPresignedUrl(@RequestParam String key) {
        return ResponseEntity.ok(s3Service.createPresignedGetUrl(key));
    }

    @GetMapping("/test")
    public String test(){
        return "test";
    }
}
