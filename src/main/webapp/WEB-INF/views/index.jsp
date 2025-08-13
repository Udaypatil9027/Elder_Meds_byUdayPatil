<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>ElderMeds | Medicine Donation System</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

  <style>
    :root {
      --saffron: #FF9933;
      --white: #FFFFFF;
      --green: #138808;
      --dark-green: #007B5E;
      --darker-green: #005c44;
      --light-gray: #f4f4f4;
      --medium-gray: #ccc;
      --dark-gray: #333;
      --text-dark: #2c3e50;
      --text-light: #ffffff;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background-color: var(--light-gray);
      color: var(--dark-gray);
      min-height: 100vh;
      display: flex;
      overflow-x: hidden;
    }

    /* Enhanced Animated Background */
    .gradient-bg {
      position: fixed;
      width: 200%;
      height: 200%;
      top: -50%;
      left: -50%;
      z-index: -1;
      background: linear-gradient(
        45deg,
        #FF9933 0%,
        #FFC266 20%,
        #FFFFFF 40%,
        #8BC34A 60%,
        #138808 80%,
        #0A5C00 100%
      );
      background-size: 400% 400%;
      animation: gradientAnimation 15s ease infinite;
      opacity: 0.2;
    }

    @keyframes gradientAnimation {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    /* Floating color accents */
    .color-accent {
      position: fixed;
      border-radius: 50%;
      filter: blur(80px);
      z-index: -1;
      opacity: 0.15;
    }

    .accent-1 {
      width: 500px;
      height: 500px;
      background: var(--saffron);
      top: -100px;
      left: -100px;
      animation: float 20s infinite alternate ease-in-out;
    }

    .accent-2 {
      width: 600px;
      height: 600px;
      background: var(--green);
      bottom: -150px;
      right: -150px;
      animation: float 25s 5s infinite alternate ease-in-out;
    }

    @keyframes float {
      0% { transform: translate(0, 0) rotate(0deg); }
      50% { transform: translate(50px, 50px) rotate(5deg); }
      100% { transform: translate(-50px, -50px) rotate(-5deg); }
    }

    .app-container {
      display: flex;
      width: 100%;
      min-height: 100vh;
    }

    .sidebar {
      width: 280px;
      background: rgba(255, 255, 255, 0.95);
      padding: 2rem 1.5rem;
      box-shadow: 5px 0 15px rgba(0, 0, 0, 0.05);
      display: flex;
      flex-direction: column;
      border-right: 1px solid var(--medium-gray);
      backdrop-filter: blur(5px);
    }

    .logo-container {
      display: flex;
      align-items: center;
      margin-bottom: 2.5rem;
      padding-bottom: 1.5rem;
      border-bottom: 1px solid rgba(0,0,0,0.1);
    }

    .logo-icon {
      font-size: 2rem;
      color: var(--dark-green);
      margin-right: 0.75rem;
    }

    .logo-text {
      font-size: 1.5rem;
      font-weight: 600;
      color: var(--text-dark);
    }

    .nav-title {
      font-size: 0.85rem;
      text-transform: uppercase;
      letter-spacing: 1px;
      color: #6c757d;
      margin: 1.5rem 0 0.75rem;
      padding-left: 0.5rem;
    }

    .nav-btn {
      display: flex;
      align-items: center;
      width: 100%;
      padding: 0.85rem 1rem;
      margin: 0.5rem 0;
      border-radius: 8px;
      color: var(--text-dark);
      text-decoration: none;
      font-weight: 500;
      transition: all 0.3s ease;
      background: transparent;
      border: none;
      cursor: pointer;
      text-align: left;
      position: relative;
      overflow: hidden;
    }

    .nav-btn i {
      margin-right: 0.75rem;
      font-size: 1.1rem;
      color: var(--dark-green);
      transition: all 0.3s ease;
    }

    .nav-btn::before {
      content: '';
      position: absolute;
      left: 0;
      top: 0;
      width: 4px;
      height: 100%;
      background: var(--dark-green);
      transform: scaleY(0);
      transition: transform 0.3s ease;
    }

    .nav-btn:hover {
      background: rgba(0, 123, 94, 0.05);
      transform: translateX(5px);
    }

    .nav-btn:hover::before {
      transform: scaleY(1);
    }

    .nav-btn:hover i {
      color: var(--green);
      transform: scale(1.1);
    }

    .nav-btn.active {
      background: rgba(0, 123, 94, 0.1);
      font-weight: 600;
    }

    .nav-btn.active::before {
      transform: scaleY(1);
    }

    .main-content {
      flex: 1;
      padding: 3rem;
      display: flex;
      flex-direction: column;
    }

    .content-card {
      background: rgba(255, 255, 255, 0.95);
      border-radius: 12px;
      padding: 2.5rem;
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
      border: 1px solid rgba(0, 0, 0, 0.05);
      max-width: 900px;
      margin: 0 auto;
      width: 100%;
      backdrop-filter: blur(5px);
    }

    .welcome-title {
      font-size: 2.5rem;
      font-weight: 700;
      color: var(--dark-green);
      margin-bottom: 1rem;
      line-height: 1.2;
      position: relative;
      display: inline-block;
    }

    .welcome-title::after {
      content: '';
      position: absolute;
      bottom: -10px;
      left: 0;
      width: 60px;
      height: 4px;
      background: linear-gradient(to right, var(--saffron), var(--green));
      border-radius: 2px;
    }

    .welcome-subtitle {
      font-size: 1.1rem;
      color: #6c757d;
      margin-bottom: 2rem;
      font-weight: 400;
    }

    .section-title {
      font-size: 1.5rem;
      font-weight: 600;
      color: var(--text-dark);
      margin: 2rem 0 1rem;
      position: relative;
    }

    .section-title::after {
      content: '';
      position: absolute;
      bottom: -8px;
      left: 0;
      width: 50px;
      height: 3px;
      background: var(--dark-green);
      border-radius: 3px;
    }

    .description {
      font-size: 1rem;
      color: #495057;
      line-height: 1.7;
      margin-bottom: 1.5rem;
    }

    .benefits-list {
      margin: 1.5rem 0;
      padding-left: 1.5rem;
    }

    .benefits-list li {
      margin-bottom: 0.75rem;
      position: relative;
      list-style-type: none;
      padding-left: 1.75rem;
    }

    .benefits-list li::before {
      content: '';
      position: absolute;
      left: 0;
      top: 0.6em;
      width: 12px;
      height: 12px;
      background: var(--green);
      border-radius: 50%;
    }

    footer {
      text-align: center;
      margin-top: auto;
      padding: 1.5rem;
      color: #6c757d;
      font-size: 0.9rem;
    }

    @media (max-width: 992px) {
      .app-container {
        flex-direction: column;
      }

      .sidebar {
        width: 100%;
        flex-direction: row;
        flex-wrap: wrap;
        justify-content: center;
        padding: 1.5rem;
        border-right: none;
        border-bottom: 1px solid rgba(0, 0, 0, 0.05);
      }

      .logo-container {
        width: 100%;
        justify-content: center;
        margin-bottom: 1.5rem;
      }

      .nav-title {
        display: none;
      }

      .nav-btn {
        width: auto;
        margin: 0.25rem;
        padding: 0.75rem 1rem;
      }

      .main-content {
        padding: 2rem;
      }

      .content-card {
        padding: 1.5rem;
      }

      .welcome-title {
        font-size: 2rem;
      }
    }

    @media (max-width: 576px) {
      .main-content {
        padding: 1.5rem;
      }

      .content-card {
        padding: 1.25rem;
      }

      .welcome-title {
        font-size: 1.75rem;
      }
    }
  </style>
</head>
<body>

  <!-- Enhanced Background Elements -->
  <div class="gradient-bg"></div>
  <div class="color-accent accent-1"></div>
  <div class="color-accent accent-2"></div>

  <div class="app-container">
    <!-- Sidebar -->
    <div class="sidebar">
      <div class="logo-container">
        <i class="fas fa-pills logo-icon"></i>
        <span class="logo-text">ElderMeds</span>
      </div>

      <div class="nav-title">Main Navigation</div>
      <a href="Admin_login11" class="nav-btn active">
        <i class="fas fa-user-shield"></i>
        Admin Login
      </a>
      <a href="Donor_login22" class="nav-btn">
        <i class="fas fa-hand-holding-heart"></i>
        Donor Portal
      </a>
      <a href="Caretaker_login33" class="nav-btn">
        <i class="fas fa-user-nurse"></i>
        Caretaker Portal
      </a>
    </div>

    <!-- Content -->
    <div class="main-content">
      <div class="content-card">
        <h1 class="welcome-title">Welcome to ElderMeds</h1>
        <p class="welcome-subtitle">Connecting medicine donors with elderly care facilities for better senior healthcare</p>

        <h2 class="section-title">Our Mission</h2>
        <p class="description">
          ElderMeds bridges the critical gap between surplus medications and elderly individuals in need. 
          Our platform creates a secure, efficient connection between donors and care providers, 
          ensuring medications reach those who need them most while reducing pharmaceutical waste.
        </p>

        <h2 class="section-title">Key Benefits</h2>
        <ul class="benefits-list">
          <li><strong>Improved Senior Healthcare:</strong> Ensures consistent access to essential medications</li>
          <li><strong>Reduced Medical Waste:</strong> Prevents usable medications from being discarded</li>
          <li><strong>Cost Savings:</strong> Lowers healthcare expenses for care facilities and families</li>
          <li><strong>Verified Safety:</strong> All donations are carefully screened and verified</li>
          <li><strong>Easy Tracking:</strong> Complete transparency in the donation process</li>
          <li><strong>Community Impact:</strong> Strengthens community bonds through compassionate sharing</li>
        </ul>
      </div>

      <footer>
        © 2025 ElderMeds By ~ Uday Patil | Empowering communities through compassionate healthcare solutions
      </footer>
    </div>
  </div>
</body>
</html>