package com.smu.householdaccount.service;

import com.smu.householdaccount.service.common.S3Service;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
class S3ServiceTest {

    @Autowired
    private S3Service s3Service;
    @Test
    @Transactional
    void createPresignedGetUrl() {
        String key="item/20251204_115208_7392.png";
        String url=s3Service.createPresignedGetUrl(key);
        System.out.println(url);
    }
}