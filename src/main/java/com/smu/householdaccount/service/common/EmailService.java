package com.smu.householdaccount.service.common;

import com.smu.householdaccount.entity.account.BudgetGroup;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    private final JavaMailSender mailSender;

    public EmailService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void sendExcelFile(String to, String subject, String text, byte[] excelBytes) throws MessagingException {

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(text);

        // 첨부 파일 추가
        helper.addAttachment(
                "ledger.xlsx",
                new ByteArrayResource(excelBytes)
        );

        mailSender.send(message);
    }

    public void sendAuthCode(String to, String subject, String text) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(text);

        mailSender.send(message);
    }

    public void sendInviteMail(String to, String inviteUrl, String groupName) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

        helper.setTo(to);
        helper.setSubject(groupName + "에 초대되었습니다.");

        String text = """
            안녕하세요.<br><br>
            
            <b>%s</b> 그룹 가계부에 초대되었습니다.<br><br>

            아래 링크를 클릭하여 초대를 수락해주세요.<br>
            (24시간 동안만 유효합니다.)<br><br>

            ▶ <a href="%s">초대 수락하기</a><br><br>

            감사합니다.
            """.formatted(groupName, inviteUrl);
        helper.setText(text, true);

        mailSender.send(message);
    }

}
