package com.smu.householdaccount.util;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Log {
    // ANSI 컬러 코드
    private static final String RESET  = "\u001B[0m";

    private static final String RED    = "\u001B[31m";
    private static final String GREEN  = "\u001B[32m";
    private static final String YELLOW = "\u001B[33m";
    private static final String BLUE   = "\u001B[34m";
    private static final String PURPLE = "\u001B[35m";
    private static final String CYAN   = "\u001B[36m";
    private static final String WHITE  = "\u001B[37m";


    // =======================
    // Android 스타일 LOG
    // =======================

    public static void d(String tag, String msg) {
        log.info(GREEN + "[{}] {}" + RESET, tag, msg);
    }

    public static void i(String tag, String msg) {
        log.info(BLUE + "ℹ[{}] {}" + RESET, tag, msg);
    }

    public static void w(String tag, String msg) {
        log.warn(YELLOW + "⚠[{}] {}" + RESET, tag, msg);
    }

    public static void e(String tag, String msg) {
        log.error(RED + "[{}] {}" + RESET, tag, msg);
    }

    public static void e(String tag, String msg, Throwable t) {
        log.error(RED + "[{}] {}" + RESET, tag, msg, t);
    }

    public static void success(String tag, String msg) {
        log.info(CYAN + "[{}] {}" + RESET, tag, msg);
    }

    public static void debugBlock(String tag, String msg) {
        log.info(PURPLE +
                        "\n================ DEBUG ================\n" +
                        "[{}] {}\n" +
                        "=======================================" + RESET,
                tag, msg);
    }
}
