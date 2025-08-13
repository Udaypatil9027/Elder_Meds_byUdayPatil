<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login | ElderMeds</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
  body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(270deg, #ff5e62, #ff9966, #6a11cb, #2575fc);
    background-size: 800% 800%;
    animation: moveBg 15s ease infinite;
  }

  @keyframes moveBg {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
  }

  .login-container {
    background: rgba(255, 255, 255, 0.95);
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
    width: 100%;
    max-width: 400px;
    text-align: center;
    animation: fadeIn 0.3s ease-out;
  }

  @keyframes fadeIn {
    from { opacity: 0; transform: translateY(-20px); }
    to { opacity: 1; transform: translateY(0); }
  }

  .login-container h2 {
    margin-bottom: 25px;
    color: #333;
  }

  .error-message {
    color: #d32f2f;
    background-color: #ffebee;
    padding: 10px;
    border-radius: 6px;
    margin-bottom: 20px;
    border-left: 5px solid #d32f2f;
    display: ${param.error != null ? 'block' : 'none'};
    animation: shake 0.25s;
  }

  @keyframes shake {
    0%, 100% { transform: translateX(0); }
    25%, 75% { transform: translateX(-5px); }
    50% { transform: translateX(5px); }
  }

  label {
    display: block;
    text-align: left;
    margin: 12px 0 5px;
    font-weight: 500;
    color: #444;
  }

  input[type="text"],
  input[type="password"] {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 15px;
    transition: border-color 0.2s, box-shadow 0.2s;
    box-sizing: border-box;
  }

  input:focus {
    border-color: #007B5E;
    outline: none;
    box-shadow: 0 0 0 2px rgba(0,123,94,0.2);
  }

  .btn {
    margin-top: 20px;
    padding: 12px 20px;
    width: 100%;
    background-color: #007B5E;
    border: none;
    color: white;
    font-size: 16px;
    font-weight: bold;
    border-radius: 6px;
    cursor: pointer;
    transition: all 0.2s ease;
  }

  .btn:hover {
    background-color: #00573e;
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
  }

  .back-btn {
    margin-top: 15px;
    display: inline-block;
    background-color: #555;
    color: white;
    padding: 10px 20px;
    border-radius: 6px;
    text-decoration: none;
    font-size: 15px;
    transition: all 0.2s;
  }

  .back-btn:hover {
    background-color: #333;
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
  }

  @media (max-width: 500px) {
    .login-container {
      padding: 25px;
      margin: 0 15px;
    }

    h2 {
      font-size: 22px;
    }
  }
</style>
</head>
<body>
  <div class="login-container">
    <h2>Admin Login</h2>

    <!-- Error message display -->
    <div class="error-message" style="${param.error != null ? '' : 'display: none;'}">
      Invalid credentials. Please try again.
    </div>

    <form action="adminlogin" method="post">
      <label for="aemail">Admin Email:</label>
      <input type="text" name="aemail" id="aemail" required value="${param.aemail != null ? param.aemail : ''}">

      <label for="apassword">Admin Password:</label>
      <input type="password" name="apassword" id="apassword" required>

      <button type="submit" class="btn">Login</button>
    </form>
    <a href="index" class="back-btn">Back to Home</a>
  </div>
</body>
</html>
