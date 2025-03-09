package com.example.demo.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.Model.User;

public interface UserRepository extends JpaRepository<User, Integer>{

	List<User> findByUserNameAndPassword(String name,String pwd);
	List<User> findByEmail(String email);
	List<User> findByUserName(String un);
}
