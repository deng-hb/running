package com.denghb.running.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created by denghb on 16/9/3.
 */
public class MailUtils {

    private static Logger log = LoggerFactory.getLogger(MailUtils.class);

    public static void send(final String sendToEmail, final String subject, final String content) {
        // 执行线程
        ExecutorService service = Executors.newFixedThreadPool(2);
        service.execute(new Runnable() {

            @Override
            public void run() {
                Properties p = new Properties();
                // 开启debug调试
                p.setProperty("mail.debug", "true");
                // 发送服务器需要身份验证
                p.setProperty("mail.smtp.auth", "true");
                // 设置邮件服务器主机名
                p.setProperty("mail.host", "smtp.exmail.qq.com");
                // 发送邮件协议名称
                p.setProperty("mail.transport.protocol", "smtp");

                // 设置环境信息
                Session session = Session.getInstance(p);

                // 创建邮件对象
                Message msg = new MimeMessage(session);

                try {
                    msg.setSubject(subject);
                    // 设置邮件内容
                    msg.setContent(content, "text/html;charset=UTF-8");
                    // 设置发件人
                    msg.setFrom(new InternetAddress("test@denghb.com"));

                    Transport transport = session.getTransport();
                    // 连接邮件服务器
                    transport.connect("test@denghb.com", "Test20");
                    // 发送邮件到指定邮箱
                    transport.sendMessage(msg, new Address[]{new InternetAddress(sendToEmail)});
                    // 关闭连接
                    transport.close();
                } catch (MessagingException e) {
                    log.error(e.getMessage(), e);
                }

            }
        });
    }

    public static void main(String[] args) {
//       send();
        send("627973917@qq.com", "Test123", "<h1>te</h1>");

    }

}
