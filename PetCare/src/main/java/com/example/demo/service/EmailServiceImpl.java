package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Model.EmailOtp;
import com.example.demo.Repository.EmailOtpReposiotory;
import com.example.demo.serviceInterface.EmailServiceInter;

@Service
public class EmailServiceImpl implements EmailServiceInter{

	@Autowired
	private EmailOtpReposiotory repo;
	
	@Override
	public boolean saveOtp(EmailOtp o) {
		try
		{
			repo.save(o);
			return true;
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("Email Otp service : "+e);
		}
		return false;
	}
	public boolean validateMail(String mail,String otp,long time)
	{
		try {
			List<EmailOtp> l= repo.findByEmailAndOtp(mail,otp);
			if(l.size()==1)
			{
				long k=l.get(0).getTimestamp();
				if(k-time<=1)
					return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
}
