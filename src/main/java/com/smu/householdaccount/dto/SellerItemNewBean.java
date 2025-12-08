package com.smu.householdaccount.dto;

import jakarta.validation.constraints.*;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Data
public class SellerItemNewBean {
    @NotBlank(message = "아이템 이름을 입력하세요.")
    private String itemName;

    @NotNull(message = "정상가는 필수입니다.")
    @DecimalMin(value = "0.0", message = "정상가는 할인가보다 크거나 같아야 합니다.")
    private BigDecimal originalPrice;

    @NotNull(message = "할인가는 필수입니다.")
    @DecimalMin(value = "0.0", message = "할인가는 0 이상이어야 합니다.")
    private BigDecimal itemSaleprice;


    @NotBlank(message = "카테고리를 선택하세요.")
    private String categoryId;


    // 파일 업로드
    private String itemImageUrl; // 외부 URL 직접 입력 허용
    private MultipartFile itemImageFile;
    private MultipartFile[] detailImageFiles;


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate saleStartDate;

    @NotNull(message = "판매 종료일을 선택하세요.")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate saleEndDate;


    private List<String> optionType;
    private List<String> optionValue;
    private List<BigDecimal> additionalPrice;
    private List<Long> stock;


    // -----------------------
    // 비즈니스 유효성 검증
    // -----------------------

    /**
     * 정상가 >= 할인가
     */
    @AssertTrue(message = "정상가는 할인가보다 크거나 같아야 합니다.")
    public boolean isPriceValid() {
        if (originalPrice == null || itemSaleprice == null) return true; // 다른 어노테이션에서 잡음
        try {
            return originalPrice.compareTo(itemSaleprice) >= 0;
        } catch (Exception e) {
            return true;
        }
    }

    /**
     * 시작일이 선택된 경우 시작일 <= 종료일
     */
    @AssertTrue(message = "판매 시작일은 종료일보다 이후일 수 없습니다.")
    public boolean isSaleDateValid() {
        if (saleEndDate == null) return true; // 종료일은 @NotNull로 잡힘
        if (saleStartDate == null) return true; // 시작일 선택은 optional인 경우 허용
        return !saleStartDate.isAfter(saleEndDate);
    }

}
