package com.example.demo.Others;
import java.util.Random;
public class GenerateOTP {

	public String generateOtp()
	{
		return (new Random().nextInt(9000)+1000)+"";
	}
}
