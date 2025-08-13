<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Donor Registration</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
/* General resets & fonts */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	height: 100vh;
	background: linear-gradient(-45deg, #3b2667, #bc78ec, #6b73ff, #000c40);
	background-size: 400% 400%;
	animation: gradientBG 15s ease infinite;
	overflow: hidden;
	display: flex;
	justify-content: center;
	align-items: center;
}

@
keyframes gradientBG { 0% {
	background-position: 0% 50%;
}

50%
{
background-position
:
 
100%
50%;
}
100%
{
background-position
:
 
0%
50%;
}
}
.register-container {
	width: 450px;
	background: rgba(255, 255, 255, 0.9);
	padding: 40px 30px;
	border-radius: 20px;
	box-shadow: 0 25px 60px rgba(0, 0, 0, 0.3);
	backdrop-filter: blur(10px);
	position: relative;
	z-index: 2;
}

.register-container h2 {
	color: #2c3e50;
	font-size: 26px;
	text-align: center;
	margin-bottom: 25px;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	font-weight: 500;
	color: #2c3e50;
	margin-bottom: 6px;
}

.form-group input {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 10px;
	transition: 0.3s;
	background-color: #fdfdfd;
	font-size: 15px;
}

.form-group input:focus {
	border-color: #6b73ff;
	box-shadow: 0 0 0 3px rgba(107, 115, 255, 0.2);
}

.error-message {
	font-size: 12px;
	color: red;
	margin-top: 4px;
	display: none;
}

.success-message {
	font-size: 12px;
	color: green;
	margin-top: 4px;
	display: none;
}

.password-container {
	position: relative;
}

.toggle-password {
	position: absolute;
	right: 15px;
	top: 42px;
	cursor: pointer;
	color: #555;
}

.password-strength {
	height: 4px;
	background: #e0e0e0;
	margin-top: 8px;
	border-radius: 2px;
}

.strength-meter {
	height: 100%;
	width: 0%;
	transition: 0.3s;
}

.btn-group {
	display: flex;
	gap: 12px;
	justify-content: center;
	margin-top: 20px;
}

button {
	padding: 12px 25px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	font-size: 14px;
	transition: 0.3s;
}

.submit-btn {
	background-color: #6b73ff;
	color: white;
}

.submit-btn:hover {
	background-color: #4b59d7;
	transform: translateY(-2px);
}

.reset-btn {
	background-color: #dcdde1;
	color: #333;
}

.reset-btn:hover {
	background-color: #b2bec3;
	transform: translateY(-2px);
}

.nav-buttons {
	margin-top: 25px;
	display: flex;
	flex-direction: column;
	gap: 12px;
}

.nav-buttons button {
	width: 100%;
	background-color: #ecf0f1;
	color: #2c3e50;
}

.nav-buttons button:hover {
	background-color: #bdc3c7;
}

.terms {
	text-align: center;
	font-size: 12px;
	margin-top: 18px;
	color: #7f8c8d;
}

.terms a {
	color: #6b73ff;
	text-decoration: none;
}

.terms a:hover {
	text-decoration: underline;
}

@media screen and (max-width: 480px) {
	.register-container {
		width: 90%;
		padding: 30px 20px;
	}
	.btn-group {
		flex-direction: column;
	}
}
</style>
</head>
<body>

	<div class="register-container">
		<h2>Donor Registration</h2>
		<form id="registrationForm" action="registerdonor" method="post"
			onsubmit="return validateForm()">

			<div class="form-group">
				<label for="dname">Full Name</label> <input type="text" id="dname"
					name="dname" placeholder="Enter your full name" required>
				<div id="nameError" class="error-message">Name must be at
					least 3 characters</div>
			</div>

			<div class="form-group">
				<label for="dcontact">Phone Number</label> <input type="text"
					id="dcontact" name="dcontact"
					placeholder="Enter 10-digit phone number" required>
				<div id="contactError" class="error-message">Enter a valid
					10-digit phone number</div>
			</div>

			<div class="form-group">
				<label for="demail">Email</label> <input type="email" id="demail"
					name="demail" placeholder="Enter your email" required>
				<div id="emailError" class="error-message">Enter a valid email</div>
			</div>

			<div class="form-group password-container">
				<label for="dpassword">Password</label> <input type="password"
					id="dpassword" name="dpassword" placeholder="Enter password"
					required> <i class="fas fa-eye toggle-password"
					onclick="togglePasswordVisibility()"></i>
			</div>

			<div class="terms">
				By registering, you agree to our <a href="#">Terms</a> and <a
					href="#">Privacy Policy</a>.
			</div>

			<div class="btn-group">
				<button type="submit" class="submit-btn">Register</button>
				<button type="reset" class="reset-btn">Reset</button>
			</div>

			<div class="nav-buttons">
				<a href="Donor_login22"><button type="button">Already
						Registered? Login</button></a> <a href="index"><button type="button">Back
						to Homepage</button></a>
			</div>

		</form>
	</div>

	<script>
		function togglePasswordVisibility() {
			const
			pwd = document.getElementById("dpassword");
			const
			icon = document.querySelector(".toggle-password");
			if (pwd.type === "password") {
				pwd.type = "text";
				icon.classList.remove("fa-eye");
				icon.classList.add("fa-eye-slash");
			} else {
				pwd.type = "password";
				icon.classList.remove("fa-eye-slash");
				icon.classList.add("fa-eye");
			}
		}

		document.getElementById("dpassword").addEventListener("input",
				function() {
					const
					pwd = this.value;
					const
					meter = document.getElementById("strengthMeter");
					const
					error = document.getElementById("passwordError");
					const
					success = document.getElementById("passwordSuccess");

					error.style.display = "none";
					success.style.display = "none";

					let
					strength = 0;
					if (pwd.length >= 8)
						strength += 25;
					if (/[A-Z]/.test(pwd))
						strength += 25;
					if (/[0-9]/.test(pwd))
						strength += 25;
					if (/[^A-Za-z0-9]/.test(pwd))
						strength += 25;

					meter.style.width = strength + "%";

					if (strength < 50) {
						meter.style.backgroundColor = "#e74c3c";
					} else if (strength < 75) {
						meter.style.backgroundColor = "#f39c12";
					} else {
						meter.style.backgroundColor = "#27ae60";
						success.style.display = "block";
					}
				});

		function validateForm() {
			let
			valid = true;

			const
			name = document.getElementById("dname").value.trim();
			const
			phone = document.getElementById("dcontact").value.trim();
			const
			email = document.getElementById("demail").value.trim();
			const
			password = document.getElementById("dpassword").value;

			document.getElementById("nameError").style.display = name.length >= 3 ? "none"
					: "block";
			document.getElementById("contactError").style.display = /^\d{10}$/
					.test(phone) ? "none" : "block";
			document.getElementById("emailError").style.display = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
					.test(email) ? "none" : "block";
			document.getElementById("passwordError").style.display = password.length >= 8 ? "none"
					: "block";

			if (name.length < 3 || !/^\d{10}$/.test(phone)
					|| !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
					|| password.length < 8) {
				valid = false;
			}

			return valid;
		}

		// Restrict to numbers only for phone
		document.getElementById("dcontact")
				.addEventListener(
						"input",
						function() {
							this.value = this.value.replace(/\D/g, '')
									.substring(0, 10);
						});
	</script>

</body>
</html>
