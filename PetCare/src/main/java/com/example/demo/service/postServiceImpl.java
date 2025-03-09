package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.example.demo.Model.Posts;
import com.example.demo.Repository.postRepository;
import com.example.demo.serviceInterface.postServiceInter;

@Service
public class postServiceImpl implements postServiceInter{
	
	@Autowired
	private postRepository repo;
	
	public Posts savePost(Posts p)
	{
	   try
	   {
		   p.setTimeStamp(System.currentTimeMillis());
		   p= repo.save(p);
           return p;
	   }
	   catch(Exception e)
	   {
		   System.out.println("Save posts error : "+e);
	   }
	   return null;
	}
	public Page<Posts> getPosts(int p)
	{
		int pageSize=10;
		try
		{
			Page<Posts> l=repo.findAll(PageRequest.of(p,pageSize));
			return l;
		}
		catch (Exception e) {
			System.out.println("Error at get posts : "+e);
		}
	    return null;
	}
	
}
