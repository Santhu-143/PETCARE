package com.example.demo.serviceInterface;

import com.example.demo.Model.EmailOtp;

public interface EmailServiceInter {
		public boolean saveOtp(EmailOtp o);
		public boolean validateMail(String mail,String otp,long k);
}
