package com.example.demo.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Model.EmailOtp;

public interface EmailOtpReposiotory extends JpaRepository<EmailOtp, String>{
	public List<EmailOtp> findByEmailAndOtp(String mail,String otp);
}
