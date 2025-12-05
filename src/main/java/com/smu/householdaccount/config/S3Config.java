package com.smu.householdaccount.config;

import jakarta.servlet.MultipartConfigElement;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class S3Config {
    /**
     * S3Template이 사용할 기본 버킷 이름
     */
    @Bean
    public String s3BucketName(
            @Value("${spring.cloud.aws.s3.bucket}") String bucketName
    ) {
        return bucketName;
    }
}