package com.example.demo.Others;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import jakarta.mail.internet.MimeMessage;

@Component
public class EmailUtil {
	
	@Autowired
	public JavaMailSender sender;
	public boolean send(String to,String cc,String bcc,String subject,String text)
	{
		try
		{
			System.out.println("jjjjjj ");
			MimeMessage message=sender.createMimeMessage();
			MimeMessageHelper helper= new MimeMessageHelper(message,false);
			helper.setFrom("mia@afaxaa.com");
			if(to!=null) helper.setTo(to);
			if(cc!=null) helper.setCc(cc);
			if(bcc!=null) helper.setBcc(bcc);
			if(subject!=null) helper.setSubject(subject);
			if(text!=null) helper.setText(text);
			//if(file!=null) helper.addAttachment(file.getFilename(), file);
			sender.send(message);
			System.out.println("jcekwj lv ");
			return true;
		}
		catch(Exception e)
		{
			System.out.println("error at mail : "+e);
		}
		return false;
	}
}
