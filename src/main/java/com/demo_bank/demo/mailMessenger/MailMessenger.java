package com.demo_bank.demo.mailMessenger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class MailMessenger {

    private final JavaMailSender javaMailSender;

    @Autowired
    public MailMessenger(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    public void htmlEmailMessenger(String from, String toMail, String subject, String body) throws MessagingException {
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper htmlMessage = new MimeMessageHelper(message, true);

        htmlMessage.setTo(toMail);
        htmlMessage.setFrom(from);
        htmlMessage.setSubject(subject);
        htmlMessage.setText(body, true);

        javaMailSender.send(message);
    }
}
