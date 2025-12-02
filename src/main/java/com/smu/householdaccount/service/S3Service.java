package com.smu.householdaccount.service;

import com.smu.householdaccount.util.Log;
import com.smu.householdaccount.web.SafeHttpClient;
import io.awspring.cloud.s3.ObjectMetadata;
import io.awspring.cloud.s3.S3Resource;
import io.awspring.cloud.s3.S3Template;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.services.s3.model.GetObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.presigner.S3Presigner;
import software.amazon.awssdk.services.s3.presigner.model.GetObjectPresignRequest;

import java.io.IOException;
import java.net.URL;
import java.time.Duration;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class S3Service {

    private final S3Template s3Template;
    private final S3Presigner s3Presigner;
    private final SafeHttpClient safeHttpClient;

    @Value("${spring.cloud.aws.s3.bucket}")
    private String bucket;

    @Value("${cloudfront.domain}")
    private String cloudfrontDomain;

    @PostConstruct
    void checkBucket() {
        Log.e("S3 Bucket connected: ", bucket);
    }

    /**
     * S3 파일 업로드 후 접근 가능한 URL 반환
     */
    public String upload(MultipartFile file, String dirName, String saveFileName) throws IOException {

        String fileName = dirName + "/" + saveFileName; // dirName = 경로 이름, saveFileName = 저장 될 파일 이름

        ObjectMetadata metadata = ObjectMetadata.builder()
                .contentType(file.getContentType())
                .contentLength(file.getSize())
                .build();

        // S3에 업로드 (ObjectMetadata 방식)
        S3Resource resource = s3Template.upload(
                bucket,
                fileName,
                file.getInputStream(),
                metadata
        );

        // 업로드된 객체의 URL 가져오기
        URL url = resource.getURL();

        return url.toString();
    }

    public String createPresignedGetUrl(String key) {

        GetObjectRequest getObjectRequest = GetObjectRequest.builder()
                .bucket(bucket)
                .key(key)
                .build();

        GetObjectPresignRequest presignRequest = GetObjectPresignRequest.builder()
                .signatureDuration(Duration.ofMinutes(10)) // 10분 유효
                .getObjectRequest(getObjectRequest)
                .build();


        return s3Presigner.presignGetObject(presignRequest)
                .url()
                .toString();
    }

    public String getPublicUrl(String key) {
        if (key.startsWith("/")) {
            key = key.substring(1);
        }
        return "https://" + cloudfrontDomain + "/" + key;
    }
}
