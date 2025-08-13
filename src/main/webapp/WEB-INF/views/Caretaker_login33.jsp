<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Caretaker Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            height: 100vh;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .login-container {
            width: 100%;
            max-width: 400px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
            padding: 40px;
            position: relative;
            z-index: 1;
            overflow: hidden;
        }

        .login-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 8px;
            background: linear-gradient(90deg, #4b6cb7, #182848);
        }

        h3 {
            color: #182848;
            text-align: center;
            margin-bottom: 30px;
            font-size: 24px;
            font-weight: 600;
        }

        h3 i {
            margin-right: 10px;
            color: #4b6cb7;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #182848;
            font-weight: 500;
            font-size: 14px;
        }

        input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s ease;
            background-color: #f9fafc;
        }

        input:focus {
            border-color: #4b6cb7;
            outline: none;
            box-shadow: 0 0 0 3px rgba(75, 108, 183, 0.2);
            background-color: white;
        }

        .btn-group {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-top: 30px;
        }

        .btn {
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-login {
            background: linear-gradient(135deg, #4b6cb7, #182848);
            color: white;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(75, 108, 183, 0.4);
        }

        .btn-secondary {
            background: #f1f3f9;
            color: #182848;
            text-decoration: none;
        }

        .btn-secondary:hover {
            background: #e4e8f0;
            transform: translateY(-2px);
        }

        .btn i {
            margin-right: 8px;
            font-size: 16px;
        }

        .blob {
            position: absolute;
            border-radius: 50%;
            opacity: 0.15;
            filter: blur(40px);
            z-index: 0;
        }

        .blob-1 {
            width: 300px;
            height: 300px;
            background: #4b6cb7;
            top: -100px;
            right: -100px;
        }

        .blob-2 {
            width: 250px;
            height: 250px;
            background: #182848;
            bottom: -80px;
            left: -80px;
        }

        @media (max-width: 480px) {
            .login-container {
                width: 90%;
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="blob blob-1"></div>
    <div class="blob blob-2"></div>

    <div class="login-container">
        <h3><i class="fas fa-user-nurse"></i> Caretaker Login Portal</h3>

        <form action="caretakerlogin" method="post">
            <div class="form-group">
                <label for="contact">Caretaker Contact</label>
                <input type="text" id="contact" name="contact" placeholder="Enter your contact number" required>
            </div>

            <div class="form-group">
                <label for="cpass">Password</label>
                <input type="password" id="cpass" name="cpass" placeholder="Enter your password" required>
            </div>

            <div class="btn-group">
                <button type="submit" class="btn btn-login">
                    <i class="fas fa-sign-in-alt"></i> Login
                </button>

                <a href="CareTakerRegister33" class="btn btn-secondary">
                    <i class="fas fa-user-plus"></i> Caretaker Register
                </a>

                <a href="index" class="btn btn-secondary">
                    <i class="fas fa-arrow-left"></i> Back to Home
                </a>
            </div>
        </form>
    </div>
</body>
</html>