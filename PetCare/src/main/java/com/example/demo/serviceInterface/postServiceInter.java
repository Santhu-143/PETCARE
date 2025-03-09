package com.example.demo.serviceInterface;

import org.springframework.data.domain.Page;

import com.example.demo.Model.Posts;

public interface postServiceInter {

	public Posts savePost(Posts p);
	public Page<Posts> getPosts(int pageNo);
}
