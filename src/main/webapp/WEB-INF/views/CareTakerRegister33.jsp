<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>CareTaker Registration</title>
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
            background: linear-gradient(135deg, #f5f7fa 0%, #e2e8f0 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .register-container {
            width: 100%;
            max-width: 500px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            padding: 40px;
            position: relative;
            z-index: 1;
            overflow: hidden;
        }

        .register-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 8px;
            background: linear-gradient(90deg, #4f46e5, #7c3aed);
        }

        h3 {
            color: #1e293b;
            text-align: center;
            margin-bottom: 30px;
            font-size: 24px;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        h3 i {
            margin-right: 10px;
            color: #4f46e5;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #1e293b;
            font-weight: 500;
            font-size: 14px;
        }

        input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s ease;
            background-color: #f8fafc;
        }

        input:focus {
            border-color: #4f46e5;
            outline: none;
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.2);
            background-color: white;
        }

        .btn-group {
            display: flex;
            gap: 15px;
            margin-top: 25px;
        }

        .btn {
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .btn-primary {
            background: linear-gradient(135deg, #4f46e5, #7c3aed);
            color: white;
            flex: 1;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(79, 70, 229, 0.3);
        }

        .btn-secondary {
            background: #f1f5f9;
            color: #1e293b;
            text-decoration: none;
        }

        .btn-secondary:hover {
            background: #e2e8f0;
            transform: translateY(-2px);
        }

        .btn-back {
            background: #f1f5f9;
            color: #1e293b;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            margin-top: 15px;
            width: 100%;
            justify-content: center;
        }

        .btn i {
            margin-right: 8px;
            font-size: 16px;
        }

        .blob {
            position: absolute;
            border-radius: 50%;
            opacity: 0.1;
            filter: blur(40px);
            z-index: 0;
        }

        .blob-1 {
            width: 300px;
            height: 300px;
            background: #4f46e5;
            top: -100px;
            right: -100px;
        }

        .blob-2 {
            width: 250px;
            height: 250px;
            background: #7c3aed;
            bottom: -80px;
            left: -80px;
        }

        @media (max-width: 480px) {
            .register-container {
                width: 90%;
                padding: 30px 20px;
            }
            
            .btn-group {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="blob blob-1"></div>
    <div class="blob blob-2"></div>

    <div class="register-container">
        <h3><i class="fas fa-user-plus"></i> Caretaker Registration</h3>

        <form action="caretakerregister" method="post">
            <div class="form-group">
                <label for="cname">Full Name</label>
                <input type="text" id="cname" name="cname" placeholder="Enter your full name" required>
            </div>

            <div class="form-group">
                <label for="cemail">Email Address</label>
                <input type="email" id="cemail" name="cemail" placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                <label for="ccontact">Contact Number</label>
                <input type="tel" id="ccontact" name="ccontact" placeholder="Enter your contact number" required>
            </div>

            <div class="form-group">
                <label for="homeName">Home Name</label>
                <input type="text" id="homeName" name="homeName" placeholder="Enter the home name you work for" required>
            </div>

            <div class="form-group">
                <label for="cpassword">Password</label>
                <input type="password" id="cpassword" name="cpassword" placeholder="Create a password" required>
            </div>

            <div class="btn-group">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-user-plus"></i> Register
                </button>
                <button type="reset" class="btn btn-secondary">
                    <i class="fas fa-undo"></i> Clear
                </button>
            </div>

            <a href="index" class="btn btn-back">
                <i class="fas fa-arrow-left"></i> Back to Home
            </a>
        </form>
    </div>
</body>
</html>