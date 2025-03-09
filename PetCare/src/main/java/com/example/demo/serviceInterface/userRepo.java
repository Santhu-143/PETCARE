package com.example.demo.serviceInterface;

import java.util.List;

import com.example.demo.Model.User;

public interface userRepo {
	
	public User saveUser(User user);
	public boolean UserExists(String u,String p);
	public List<User> findAll();
	public boolean sendMail(String name,String mail,String otp);
	public boolean isEmailExist(String email);
	public boolean isUnExist(String un);
	public User findByID(int n);
}
