package com.example.demo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import com.example.demo.Model.Posts;
import com.example.demo.Model.User;
import com.example.demo.Others.saveImage;
import com.example.demo.serviceInterface.postServiceInter;
import com.example.demo.serviceInterface.userRepo;

import jakarta.servlet.http.HttpSession;

@RestController
public class PostController {
 
	@Autowired
	private postServiceInter repo;
	@Autowired
	private userRepo repo1;
	@PostMapping("uploadPost")
	public RedirectView post(@RequestParam(required=false)  String petName,@RequestParam(required=false)  String petType,
							 @RequestParam(required=false)  String petBreed,@RequestParam(required=false)  String description,
							 @RequestParam(required=false)  String location,
					         @RequestParam(required=false) MultipartFile image,HttpSession session
					         )
	{
		Posts p=new Posts();
		p.setPetName(petName);
		p.setPetType(petType);
		p.setPetBreed(petBreed);
		p.setDescription(description);
		p.setLocation(location);
		int uid=(int) session.getAttribute("u_ID");
		User u=repo1.findByID(uid);
		p.setUser(u);
		
		String url="null";
			try {
				p=repo.savePost(p);
				System.out.println("url checking..... - "+image);
				if(image!=null)
					url=saveImage.save(image,p.getPostId()+"");
				System.out.println("url : "+url);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println(e);
			}
		p.setImageUrl(url);
		if(p!=null)
			p=repo.savePost(p);
		if(p==null)
			System.out.println("post failed "+p);
		return new RedirectView("/home");
	}
	
	@ResponseBody
	@GetMapping("getPosts")
	public ResponseEntity<?> getPosts(@RequestParam("pageNo") Integer pageNo)
	{
		System.out.println("page No : "+pageNo);
		try
		{
			 List<Posts> l=repo.getPosts(pageNo).getContent();
			 System.out.println(l);
			 return new ResponseEntity<>(l, HttpStatusCode.valueOf(200));
		}
	   catch(Exception e)
		{
			return new ResponseEntity<String>("failed "+e, HttpStatusCode.valueOf(500));
		}
	}
}
