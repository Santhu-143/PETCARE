package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication(scanBasePackages = "com.example")
public class PetCareApplication {

	public static void main(String[] args) {
		SpringApplication.run(PetCareApplication.class, args);
	}

}
