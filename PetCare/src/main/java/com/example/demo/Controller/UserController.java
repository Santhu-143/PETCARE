package com.example.demo.Controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.Model.EmailOtp;
import com.example.demo.Model.User;
import com.example.demo.Others.GenerateOTP;
import com.example.demo.service.EmailServiceImpl;
import com.example.demo.serviceInterface.EmailServiceInter;
import com.example.demo.serviceInterface.userRepo;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private userRepo repo;
	@Autowired
	private EmailServiceInter repo1;
	
	@GetMapping("/")
	public String login()
	{
		return "login";
	}
	
	@GetMapping("registration")
	public String registerPage()
	{
		System.out.println("1.......");
		return "register";
	}
	@PostMapping("register")
	public String Register(@ModelAttribute User user,HttpSession s)
	{
		System.out.println("2...");
		try
		{
			User o=repo.saveUser(user);
			if(o!=null)
			{
				
				User u=repo.saveUser(user);
				if(u!=null) s.setAttribute("u_ID", u.getId());
			//	List<User> l=repo.findAll();
//				for(User u:l)
//					 System.out.println("-- "+u.getUserName());
				return "home";
			}
				
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:/";
	}
	
	@ResponseBody
	@PostMapping("Generateotp")
	public ResponseEntity<String> generateOtp(@RequestParam("mail") String email)
	{
		try {
		    if(repo.isEmailExist(email))
		    {
		    	return new ResponseEntity<String>("AlreadyExist", HttpStatusCode.valueOf(200));
		    }
			String s=new GenerateOTP().generateOtp();
			long k=System.currentTimeMillis()/(1000*60);
			//String mail=o.getEmail();
		//	System.out.println("Mail : "+mail);
//			repo.sendMail(o.getName(),mail,s);
//			user.setOtp(s);
//			user.setOtpTimeStamp(k);
			System.out.println("Email : "+email);
			System.out.println("OTP : "+s);
			System.out.println("Current time : "+k);
			EmailOtp o=new EmailOtp();
			o.setEmail(email);
			o.setOtp(s);
			o.setTimestamp(k);
			repo1.saveOtp(o);
			System.out.println("Inserted ... ");
			return new ResponseEntity<String>("true", HttpStatusCode.valueOf(200));
			
		} catch (Exception e) {
			// TODO: handle exception
			
			System.out.println("At generateOtp Method : "+e);
		}
		return new ResponseEntity<String>("false", HttpStatusCode.valueOf(200));
	}
	@ResponseBody
	@PostMapping("checkOtp")
	public ResponseEntity<String> checkOtp(@RequestParam("mail") String mail,@RequestParam("otp") String otp)
	{
		System.out.println("user entered otp : "+otp);
		if(repo1.validateMail(mail,otp,System.currentTimeMillis()/(1000*60)))
			return new ResponseEntity<String>("true", HttpStatusCode.valueOf(200));
		else 
			return new ResponseEntity<String>("false",HttpStatusCode.valueOf(200));
	}
	
	@PostMapping("/login")
	public String loginCheck(@RequestParam("username") String un,@RequestParam("password") String pwd,HttpSession s)
	{
		System.out.println("hjh");
		List<User> l=repo.findAll();
		for(User u:l) System.out.println(u.getUserName()+" "+u.getPassword());
		if(repo.UserExists(un,pwd))
			{
				s.setAttribute("u_ID", l.get(0).getId());
				return "home";
			}
		return "login";
	}
	
	@ResponseBody
	@PostMapping("/validateUsername")
	public ResponseEntity<String> validateUn(@RequestParam("un") String un)
	{
		System.out.println("user : "+un);
		//List<User> l=repo.findAll();
//		for(User u:l)
//			 System.out.println("-- "+u.getUserName());
		if(repo.isUnExist(un))
			return new ResponseEntity<String>("false",HttpStatusCode.valueOf(200));
		return new ResponseEntity<String>("true",HttpStatusCode.valueOf(200));
	}
	
	@GetMapping("findall")
	public String printAll()
	{
		List<User> l=repo.findAll();
		System.out.println("Users : ");
		for(User u : l) System.out.println(u.getId()+" "+u.getName()+" "+u.getEmail()+" "+u.getUserName());
		return "home";
	}
	@GetMapping("home")
	public String HomePage()
	{
		return "home";
	}
}
