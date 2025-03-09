package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Model.User;
import com.example.demo.Others.EmailUtil;
import com.example.demo.Repository.UserRepository;
import com.example.demo.serviceInterface.userRepo;

@Service
public class userService implements userRepo{
	
	@Autowired
	private UserRepository repo;
	
	public User saveUser(User user)
	{
		System.out.println("3..");
		return repo.save(user);
	}
	public boolean UserExists(String u,String p)
	{
		if((repo.findByUserNameAndPassword(u,p)).size()==1)
			return true;
		return false;
	}
	public List<User> findAll()
	{
		return repo.findAll();
	}
	
	public boolean sendMail(String name,String email,String otp)
	{
		String text="Hi "+name+" Your Otp is : "+otp+".It will expire in 60sec. Thank you!";
		return new EmailUtil().send(email,"","","PETCARE OTP Validation",text);
	}
	public boolean isEmailExist(String email)
	{
		return repo.findByEmail(email).size()>=1;
	}
	public boolean isUnExist(String un)
	{
		try {
			if(repo.findByUserName(un).size()==1)
				return true;
		} catch (Exception e) {
			System.out.println("Error at Username validation : "+e);
			// TODO: handle exception
		}
		return false;
	}
	public User findByID(int n)
	{
		Optional<User> o= repo.findById(n);
		if(o.isPresent()) return (User)o.get();
		return null;
	}
}
