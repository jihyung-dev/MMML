package com.smu.householdaccount.service;

import com.smu.householdaccount.dto.ledger.LedgerSummaryDto;
import com.smu.householdaccount.entity.LedgerEntry;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Service
public class ExcelService {

    public byte[] buildMonthlyLedgerExcel(List<LedgerEntry> entries, int year, int month) {

        try (XSSFWorkbook workbook = new XSSFWorkbook()) {

            Sheet sheet = workbook.createSheet("원본 거래");

            // 스타일
            CellStyle header = createHeaderStyle(workbook);
            CellStyle money  = createMoneyStyle(workbook);
            CellStyle text   = createTextStyle(workbook);

            // ==========================
            // 📌 헤더 생성
            // ==========================

            Row h = sheet.createRow(0);
            h.createCell(0).setCellValue("날짜");
            h.createCell(1).setCellValue("금액");
            h.createCell(2).setCellValue("카테고리");
            h.createCell(3).setCellValue("지출/수입");
            h.createCell(4).setCellValue("결제수단");
            h.createCell(5).setCellValue("카드종류");
            h.createCell(6).setCellValue("가맹점");
            h.createCell(7).setCellValue("메모");

            for (int c = 0; c <= 7; c++) h.getCell(c).setCellStyle(header);

            // ==========================
            // 📌 데이터 행 생성
            // ==========================

            int r = 1;
            for (LedgerEntry e : entries) {

                Row row = sheet.createRow(r++);
                int col = 0;
                row.setHeightInPoints(22);

                // 날짜
                row.createCell(col).setCellValue(e.getOccurredAt().toString());
                row.getCell(col++).setCellStyle(text);

                // 금액
                Cell m = row.createCell(col);
                m.setCellValue(e.getEntryAmount().doubleValue());
                m.setCellStyle(money);
                col++;

                // 카테고리
                row.createCell(col).setCellValue(e.getCategory().getCategoryName());
                row.getCell(col++).setCellStyle(text);

                // 지출/수입
                row.createCell(col).setCellValue(e.getEntryType());
                row.getCell(col++).setCellStyle(text);

                // 결제수단
                row.createCell(col).setCellValue(e.getPayType());
                row.getCell(col++).setCellStyle(text);

                // 카드 종류
                row.createCell(col).setCellValue(e.getCardType());
                row.getCell(col++).setCellStyle(text);

                // 사용처
                row.createCell(col).setCellValue(e.getPlaceOfUse());
                row.getCell(col++).setCellStyle(text);

                // 메모
                row.createCell(col).setCellValue(e.getMemo());
                row.getCell(col).setCellStyle(text);
            }

            // 자동 너비 조절
            for (int c = 0; c <= 7; c++) {
                sheet.autoSizeColumn(c);
                if(c == 2){
                    sheet.setColumnWidth(c, sheet.getColumnWidth(c) + 2048);
                }
                // 기본 컬럼은 약간만 늘림
                if (c <= 5) {
                    sheet.setColumnWidth(c, sheet.getColumnWidth(c) + 1024);
                }
                // 가맹점 (6)
                else if (c == 6) {
                    sheet.setColumnWidth(c, Math.max(sheet.getColumnWidth(c) + 4096, 8000));
                }
                // 메모 (7)
                else if (c == 7) {
                    sheet.setColumnWidth(c, Math.max(sheet.getColumnWidth(c) + 4096, 10000));
                }
            }


            // ==========================
            // 📌 파일 변환
            // ==========================

            ByteArrayOutputStream out = new ByteArrayOutputStream();
            workbook.write(out);

            return out.toByteArray();

        } catch (Exception ex) {
            throw new RuntimeException("엑셀 생성 실패", ex);
        }
    }

    // =============================
    // ✔ 헤더 스타일 (짙은 그레이 + Bold)
    // =============================
    private CellStyle createHeaderStyle(Workbook wb) {
        CellStyle style = wb.createCellStyle();
        style.setFillForegroundColor(IndexedColors.GREY_50_PERCENT.getIndex());
        style.setFillPattern(FillPatternType.SOLID_FOREGROUND);

        // 폰트 개선 (틀딱 방지)
        Font font = wb.createFont();
        font.setFontName("맑은 고딕");
        font.setFontHeightInPoints((short) 11);
        font.setBold(true);
        style.setFont(font);

        style.setAlignment(HorizontalAlignment.CENTER);
        style.setVerticalAlignment(VerticalAlignment.CENTER);

        setBorder(style);

        return style;
    }
    private CellStyle createMoneyStyle(Workbook wb) {
        CellStyle style = wb.createCellStyle();
        DataFormat df = wb.createDataFormat();

        // 금액 형식
        style.setDataFormat(df.getFormat("#,##0원"));

        // 폰트 개선 (틀딱 방지)
        Font font = wb.createFont();
        font.setFontName("맑은 고딕");
        font.setFontHeightInPoints((short) 11);
        font.setBold(true);
        style.setFont(font);

        // *** 우측 정렬 핵심 ***
        style.setAlignment(HorizontalAlignment.RIGHT);
        style.setVerticalAlignment(VerticalAlignment.CENTER);

        // wrapText는 필요하면 켜도 됨
        style.setWrapText(false);

        setBorder(style);

        return style;
    }



    // =============================
    // ✔ 일반 텍스트 스타일
    // =============================
    private CellStyle createTextStyle(Workbook wb) {
        CellStyle style = wb.createCellStyle();
        style.setAlignment(HorizontalAlignment.LEFT);
        style.setVerticalAlignment(VerticalAlignment.CENTER);
        style.setIndention((short) 1);  // ← 패딩처럼 보이게 하는 핵심
        style.setWrapText(true);
        return style;
    }

    // =============================
    // 공통: 테두리 + 패딩
    // =============================
    private void setBorder(CellStyle style) {
        style.setBorderTop(BorderStyle.THIN);
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);
    }

    private void addCellPadding(CellStyle style) {
        style.setAlignment(HorizontalAlignment.LEFT);
        style.setVerticalAlignment(VerticalAlignment.CENTER);

        // 엑셀은 padding 기본 지원 X → 텍스트 정렬로 대체
    }
}
