package com.example.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Model.Posts;

public interface postRepository extends JpaRepository<Posts, Integer> {

}
