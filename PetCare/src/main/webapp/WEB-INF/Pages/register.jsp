<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registration Page</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f7f7f7;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      margin: 0;
    }
    .registration-container {
      background-color: white;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      max-width: 400px;
      width: 100%;
    }
    h2 {
      text-align: center;
    }
    form {
      display: flex;
      flex-direction: column;
    }
    label {
      margin-top: 10px;
    }
    input[type="text"],
    input[type="email"],
    input[type="password"] {
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
      margin-top: 5px;
    }
    .button-group {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 15px;
    }
    button {
      padding: 10px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    .submit-button {
      background-color: #28a745;
      color: white;
    }
    .otp-button {
      background-color: #007bff;
      color: white;
    }
    .login-link {
      text-align: center;
      margin-top: 15px;
    }
    .login-link a {
      text-decoration: none;
      color: #007bff;
    }
    </style>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
  let s=false;
  function ss()
  {
      // alert("ggggg");
        var k = $("<input type='text' id='otp' placeholder='Enter OTP'>");
      var b = $("<button id='submitotp' name='submitotp'>Submit OTP</button>");
      $("#enterotp").append(k);
      $("#enterotp").append(b);
      $("#otpbutt").prop("disabled", true);

      $.ajax({
        type: "POST",
        url: "Generateotp",
        data: { mail: $("#email").val() },
        success: function (data) {
        //	alert(data);
         if(data=="AlreadyExist")
        	 {
        	  alert("Email already exists... please login");
        	  location.reload();
        	 }
         
         if(data=="true") 
        	{
        	  alert("Otp generated... ");
        	}
          $("#submitotp").click(function () {
            if ($("#otp").val() == null || $("#otp").val() === "") {
              alert("Please enter OTP");
            } else {
              $.ajax({
                type: "POST",
                url: "checkOtp",
                data: { mail: $("#email").val(),otp: $("#otp").val()},
                success: function (data) {
                  if (data=="true") {
                	$("#enterotp").prop("disabled",true);
                	alert("Success! Email verified..");
                	$("#submitotp").prop("disabled",true);
                	s=true;
                	
                	//alert(k);
                    //$("#submit-button").prop("disabled", false);
                    
                  } else {
                	$("#otp").val("");
                    alert("Entered OTP is incorrect! Please enter again... ");
                  }
                },
              });
            }
          });
        },
      });
  }
  
  function myFunction()
  {
	 // alert("1.")
	  $.ajax({
	   		 type:"POST",
	   		 url:"validateUsername",
	   		 data:{ un: $("#userName").val() },
	   		 success: function(data)
	   		 { 
	   			//alert(data);
	   			 if(data=="true")
	   			  {
	   				$("#checkun").text("Valid");
	   				$("#submit-button").prop("disabled", false);
	   				
	   				// document.getElementById('checkun').innerText("Valid")
	   			  }
	   			 else{
	   				$("#checkun").text("Invalid");
	   			//	document.getElementById('checkun').innerText("Invalid")
	   				 $("#submit-button").prop("disabled", true);
	   			 }
	   		 }
	   	 });
  }
  function final()
  {
	  alert("Registration Success !!");
	  return s;
  }
  
</script>
    
</head>
<body>
  <div class="registration-container">
    <h2>Register</h2>
    <form id="registration-form" Method=POST modelattribute="User" onsubmit="return final()" action="register">
      <label name="name">Name:</label>
      <input type="text" id="name" name="name" placeholder="Enter your full name" required>

      <label name="mobile">Mobile:</label>
      <input type="text" id="mobile" name="mobile" placeholder="Enter your mobile number" required>

      <label name="email">Email:</label>
      <div class="emmail">
      <input type="email" id="email" name="email" placeholder="Enter your email address" required>
      <button id="otpbutt" onclick="ss()">send OTP</button>
      </div>
        <p id="enterotp" name="enterotp"></p>
      <label name="address">Address:</label>
      <input type="text" id="address" name="address" placeholder="Enter your address" required>
	  
	  <label name="userName">Username:</label>
	  <div class="unnn1" >
      <input type="text" onkeyup="myFunction()" onkeydown="myFunction()" id="userName" name="userName" placeholder="Choose a username" required>
	  <span id="checkun" name="checkun"></span>
	  </div>
      
      <label name="password">Password:</label>
      <input type="password" id="password" name="password" placeholder="Enter a password" required>

		<label name="CPassword">Confirm Password:</label>
      <input type="password" id="Cpassword" name="Cpassword" placeholder="Enter a password" required>
		
      <div class="button-group">
        <button type="submit" disabled class="submit-button" name="submit-button" id="submit-button">Register</button>
      </div>
    </form>
    
    <div class="login-link">
      <p>Already have an account? <a href="/">Login here</a></p>
    </div>
  </div>

</body>
</html>
