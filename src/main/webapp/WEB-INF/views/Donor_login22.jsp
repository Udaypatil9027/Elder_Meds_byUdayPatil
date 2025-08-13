<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Donor Login</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }

    body {
        height: 100vh;
        background: linear-gradient(135deg, #3b2667, #bc78ec, #6b73ff, #000c40);
        background-size: 400% 400%;
        animation: gradientBG 20s ease infinite;
        overflow: hidden;
        position: relative;
    }

    @keyframes gradientBG {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }

    .blob {
        position: absolute;
        border-radius: 50%;
        opacity: 0.45;
        animation: float 18s ease-in-out infinite;
        z-index: 0;
        filter: blur(50px);
    }

    .blob1 {
        width: 420px;
        height: 420px;
        background: rgba(111, 0, 255, 0.5);
        top: -120px;
        left: -120px;
    }

    .blob2 {
        width: 320px;
        height: 320px;
        background: rgba(255, 87, 136, 0.5);
        bottom: -100px;
        right: -120px;
        animation-delay: 6s;
    }

    .blob3 {
        width: 280px;
        height: 280px;
        background: rgba(0, 212, 255, 0.4);
        top: 40%;
        left: 30%;
        animation-delay: 3s;
    }

    @keyframes float {
        0% { transform: translate(0, 0) rotate(0deg); }
        25% { transform: translate(40px, 30px) rotate(90deg); }
        50% { transform: translate(80px, 0) rotate(180deg); }
        75% { transform: translate(40px, -30px) rotate(270deg); }
        100% { transform: translate(0, 0) rotate(360deg); }
    }

    .login-container {
        position: relative;
        z-index: 1;
        width: 380px;
        margin: 100px auto;
        background: rgba(255, 255, 255, 0.95);
        padding: 40px 30px;
        border-radius: 20px;
        box-shadow: 0 25px 60px rgba(0, 0, 0, 0.3);
        text-align: center;
        backdrop-filter: blur(8px);
        transition: transform 0.3s ease;
    }

    .login-container:hover {
        transform: translateY(-5px);
    }

    .login-container h3 {
        margin-bottom: 25px;
        color: #2c3e50;
    }

    .login-container label {
        display: block;
        text-align: left;
        margin-bottom: 6px;
        font-weight: 600;
        color: #2c3e50;
    }

    .login-container input {
        width: 100%;
        padding: 10px;
        margin-bottom: 18px;
        border: 1px solid #ccc;
        border-radius: 10px;
        transition: all 0.3s ease;
        background: rgba(255, 255, 255, 0.85);
    }

    .login-container input:focus {
        border-color: #6b73ff;
        outline: none;
        box-shadow: 0 0 0 3px rgba(107, 115, 255, 0.3);
    }

    .login-container button {
        padding: 10px 25px;
        border: none;
        border-radius: 8px;
        margin: 10px 8px;
        font-size: 15px;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .login-btn {
        background-color: #6b73ff;
        color: white;
    }

    .login-btn:hover {
        background-color: #3b4cca;
        transform: translateY(-2px);
    }

    .nav-btn {
        background-color: #dcdde1;
        color: #2c3e50;
    }

    .nav-btn:hover {
        background-color: #bdc3c7;
        transform: translateY(-2px);
    }

    .error-message {
        color: #e74c3c;
        font-size: 12px;
        margin-top: -15px;
        margin-bottom: 15px;
        text-align: left;
        display: none;
    }

    @media (max-width: 450px) {
        .login-container {
            width: 90%;
            margin-top: 60px;
        }
    }
</style>
</head>
<body>

<div class="blob blob1"></div>
<div class="blob blob2"></div>
<div class="blob blob3"></div>

<div class="login-container">
    <h3>Donor Login Portal</h3>

    <form action="donorlogin" method="post" onsubmit="return validateForm()">
        <label for="dcontact">Donor Contact</label>
        <input type="text" id="dcontact" name="dcontact" placeholder="Enter 10-digit number" maxlength="10" required>
        <div id="contactError" class="error-message">Please enter a valid 10-digit phone number</div>

        <label for="dpassword">Password</label>
        <input type="password" id="dpassword" name="dpassword" placeholder="Enter Password" required>

        <button type="submit" class="login-btn">Login</button>

        <a href="DonorRegister22">
            <button type="button" class="nav-btn">Register</button>
        </a>

        <a href="index">
            <button type="button" class="nav-btn">Back</button>
        </a>
    </form>
</div>

<script>
    function validateForm() {
        const contactInput = document.getElementById('dcontact');
        const contactError = document.getElementById('contactError');
        const phoneRegex = /^\d{10}$/;
        
        if (!phoneRegex.test(contactInput.value)) {
            contactError.style.display = 'block';
            contactInput.style.borderColor = '#e74c3c';
            return false;
        } else {
            contactError.style.display = 'none';
            contactInput.style.borderColor = '#ccc';
            return true;
        }
    }

    // Real-time validation as user types
    document.getElementById('dcontact').addEventListener('input', function() {
        const contactError = document.getElementById('contactError');
        const phoneRegex = /^\d{0,10}$/;
        
        if (!phoneRegex.test(this.value)) {
            // If input contains non-digit characters or is longer than 10 digits
            this.value = this.value.replace(/\D/g, '').substring(0, 10);
        }
        
        if (this.value.length === 10) {
            contactError.style.display = 'none';
            this.style.borderColor = '#ccc';
        } else {
            contactError.style.display = 'none'; // Hide until submit
        }
    });
</script>

</body>
</html>