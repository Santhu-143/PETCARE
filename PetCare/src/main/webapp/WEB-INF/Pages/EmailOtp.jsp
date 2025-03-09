<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>OTP Verification Page</title>
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
    .otp-container {
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
    input[type="number"] {
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
      margin-top: 5px;
      width: calc(100% - 16px);
    }
    button {
      margin-top: 15px;
      padding: 8px 12px;
      background-color: #28a745;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 14px;
    }
    .info-text {
      margin-top: 10px;
      font-size: 14px;
      color: #555;
    }
  </style>
</head>
<body>
  <div class="otp-container">
    <h2>OTP Verification</h2>
    <p class="info-text">Your registered email is: <span id="user-email">example@mail.com</span></p>
    <form id="otp-form">
      <label for="otp">Enter OTP:</label>
      <input type="number" id="otp" name="otp" placeholder="Enter the received OTP" required>
      <button type="submit">Verify OTP</button>
    </form>
  </div>

  <script>
    document.getElementById('otp-form').addEventListener('submit', function(event) {
      event.preventDefault();
      const otp = document.getElementById('otp').value;
      if (!otp) {
        alert('Please enter the OTP.');
        return;
      }
      alert('OTP verified successfully!');
      // Implement the actual OTP verification logic here.
    });
  </script>
</body>
</html>
