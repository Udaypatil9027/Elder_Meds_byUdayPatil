<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Caretaker</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
            height: 100vh;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            overflow: auto;
            position: relative;
        }

        .bg-elements {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: 0;
            overflow: hidden;
        }

        .bg-element {
            position: absolute;
            border-radius: 50%;
            opacity: 0.6;
            filter: blur(60px);
            animation: float 20s infinite ease-in-out;
        }

        .bg-element:nth-child(1) {
            width: 400px; height: 400px; background: rgba(104, 109, 224, 0.6); top: 10%; left: 10%;
        }

        .bg-element:nth-child(2) {
            width: 300px; height: 300px; background: rgba(255, 107, 107, 0.6); top: 60%; left: 70%;
            animation-delay: 2s;
        }

        .bg-element:nth-child(3) {
            width: 500px; height: 500px; background: rgba(78, 205, 196, 0.6); top: 30%; left: 50%;
            animation-delay: 4s;
        }

        .bg-element:nth-child(4) {
            width: 350px; height: 350px; background: rgba(247, 183, 51, 0.6); top: 70%; left: 20%;
            animation-delay: 6s;
        }

        @keyframes float {
            0% { transform: translate(0, 0) rotate(0deg); }
            50% { transform: translate(50px, -50px) rotate(180deg); }
            100% { transform: translate(0, 0) rotate(360deg); }
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.95);
            width: 450px;
            max-width: 95%;
            margin: 60px auto;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 1;
            backdrop-filter: blur(6px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .form-container h3 {
            text-align: center;
            margin-bottom: 25px;
            color: #2b2d42;
            font-size: 24px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            background-color: rgba(255, 255, 255, 0.8);
            transition: border 0.3s ease, box-shadow 0.3s ease;
        }

        input:focus {
            border-color: #3a86ff;
            box-shadow: 0 0 0 2px rgba(58, 134, 255, 0.3);
        }

        input.invalid {
            border-color: #ff4d4d !important;
            animation: shake 0.3s;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-4px); }
            50% { transform: translateX(4px); }
            75% { transform: translateX(-4px); }
        }

        .error-message {
            color: #ff4d4d;
            font-size: 12px;
            margin-top: 4px;
            min-height: 14px;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            margin-top: 25px;
            gap: 15px;
        }

        button {
            padding: 12px 20px;
            background-color: #3a86ff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease;
            flex: 1;
        }

        button:hover {
            background-color: #265df2;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.12);
        }

        .back-btn {
            display: block;
            margin-top: 30px;
            text-align: center;
        }

        .back-btn a button {
            background-color: #ff6b6b;
        }

        .back-btn a button:hover {
            background-color: #e05555;
        }

        @media (max-width: 500px) {
            .form-container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>

<div class="bg-elements">
    <div class="bg-element"></div>
    <div class="bg-element"></div>
    <div class="bg-element"></div>
    <div class="bg-element"></div>
</div>

<div class="form-container">
    <h3>Add Caretaker</h3>
    <form id="caretakerForm" action="submitcaretaker" method="post" onsubmit="return validateForm()">
        <label>Enter Caretaker Name:</label>
        <input type="text" id="cname" name="cname" required>
        <div class="error-message" id="nameError"></div>

        <label>Caretaker Email:</label>
        <input type="text" id="cemail" name="cemail" title="Enter valid email like user@example.com" required>
        <div class="error-message" id="emailError"></div>

        <label>Caretaker Contact:</label>
        <input type="text" id="ccontact" name="ccontact" maxlength="10" title="Enter 10-digit mobile number" required>
        <div class="error-message" id="contactError"></div>

        <label>Caretaker Home Name:</label>
        <input type="text" id="homeName" name="homeName" required>
        <div class="error-message" id="homeError"></div>

        <label>Password:</label>
        <input type="password" id="cpassword" name="cpassword" required>
        <div class="error-message" id="passwordError"></div>

        <div class="btn-group">
            <button type="submit">Add</button>
            <button type="reset" onclick="clearErrors()">Clear</button>
        </div>
    </form>

    <div class="back-btn">
        <a href="Admin_Dashboard11">
            <button type="button">Back to Dashboard</button>
        </a>
    </div>
</div>

<script>
    const emailField = document.getElementById("cemail");
    const contactField = document.getElementById("ccontact");
    const nameField = document.getElementById("cname");
    const homeField = document.getElementById("homeName");
    const passwordField = document.getElementById("cpassword");

    emailField.addEventListener("input", () => validateField("email"));
    contactField.addEventListener("input", () => validateField("contact"));
    nameField.addEventListener("input", () => validateField("name"));
    homeField.addEventListener("input", () => validateField("home"));
    passwordField.addEventListener("input", () => validateField("password"));

    function validateField(type) {
        if (type === "email") {
            const email = emailField.value.trim();
            const pattern = /^[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/;
            const emailError = document.getElementById("emailError");

            if (!pattern.test(email)) {
                emailField.classList.add("invalid");
                emailError.innerText = "Invalid email format";
            } else {
                emailField.classList.remove("invalid");
                emailError.innerText = "";
            }
        }

        if (type === "contact") {
            const contact = contactField.value.trim();
            const pattern = /^[0-9]{10}$/;
            const contactError = document.getElementById("contactError");

            if (!pattern.test(contact)) {
                contactField.classList.add("invalid");
                contactError.innerText = "Contact must be 10 digits";
            } else {
                contactField.classList.remove("invalid");
                contactError.innerText = "";
            }
        }

        if (type === "name") {
            const name = nameField.value.trim();
            const nameError = document.getElementById("nameError");

            if (name === "") {
                nameField.classList.add("invalid");
                nameError.innerText = "Please enter caretaker name";
            } else {
                nameField.classList.remove("invalid");
                nameError.innerText = "";
            }
        }

        if (type === "home") {
            const home = homeField.value.trim();
            const homeError = document.getElementById("homeError");

            if (home === "") {
                homeField.classList.add("invalid");
                homeError.innerText = "Please enter home name";
            } else {
                homeField.classList.remove("invalid");
                homeError.innerText = "";
            }
        }

        if (type === "password") {
            const password = passwordField.value.trim();
            const passwordError = document.getElementById("passwordError");

            if (password === "") {
                passwordField.classList.add("invalid");
                passwordError.innerText = "Please enter password";
            } else if (password.length < 6) {
                passwordField.classList.add("invalid");
                passwordError.innerText = "Password must be at least 6 characters";
            } else {
                passwordField.classList.remove("invalid");
                passwordError.innerText = "";
            }
        }
    }

    function validateForm() {
        validateField("name");
        validateField("email");
        validateField("contact");
        validateField("home");
        validateField("password");

        const invalidFields = document.querySelectorAll(".invalid");
        if (invalidFields.length > 0) {
            invalidFields[0].focus();
            return false;
        }

        return true;
    }

    function clearErrors() {
        const errorMessages = document.querySelectorAll(".error-message");
        errorMessages.forEach(error => error.innerText = "");
        
        const invalidFields = document.querySelectorAll(".invalid");
        invalidFields.forEach(field => field.classList.remove("invalid"));
    }
</script>

</body>
</html>