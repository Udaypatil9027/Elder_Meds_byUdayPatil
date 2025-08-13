<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="ElderMeds_Models.CareTaker" %>
<%
    CareTaker ct = (CareTaker) session.getAttribute("loggedCareTaker");
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>CareTaker Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-color: #FF6B35;
            --primary-dark: #E55627;
            --primary-light: #FF9E58;
            --secondary-color: #F7C59F;
            --accent-color: #EFEFD0;
            --text-dark: #292929;
            --text-light: #5A5A5A;
            --bg-light: #F8F8F8;
            --shadow-sm: 0 2px 8px rgba(0, 0, 0, 0.1);
            --shadow-md: 0 4px 12px rgba(0, 0, 0, 0.15);
            --shadow-lg: 0 8px 24px rgba(0, 0, 0, 0.2);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            display: flex;
            min-height: 100vh;
            background-color: var(--bg-light);
            color: var(--text-dark);
        }

        .sidebar {
            width: 280px;
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            color: white;
            padding: 30px 0;
            height: 100vh;
            position: fixed;
            box-shadow: var(--shadow-md);
        }

        .sidebar-header {
            padding: 0 25px 30px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .sidebar-header h3 {
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .sidebar-header p {
            font-size: 14px;
            opacity: 0.9;
        }

        .nav-menu {
            margin-top: 30px;
        }

        .nav-item {
            display: flex;
            align-items: center;
            padding: 15px 25px;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            border-left: 4px solid transparent;
            color: white;
            text-decoration: none;
            position: relative;
            overflow: hidden;
        }

        .nav-item:hover {
            background: rgba(255, 255, 255, 0.15);
            border-left: 4px solid var(--accent-color);
            box-shadow: inset 0 0 15px rgba(255, 255, 255, 0.1);
        }

        .nav-item::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: 0.5s;
        }

        .nav-item:hover::before {
            left: 100%;
        }

        .nav-item i {
            margin-right: 15px;
            font-size: 18px;
            width: 24px;
            text-align: center;
            color: var(--accent-color);
            transition: transform 0.3s ease;
        }

        .nav-item:hover i {
            transform: scale(1.1);
        }

        .main-content {
            flex: 1;
            margin-left: 280px;
            padding: 40px;
        }

        .welcome-section {
            background: white;
            border-radius: 12px;
            padding: 40px;
            box-shadow: var(--shadow-sm);
            margin-bottom: 30px;
            text-align: center;
            border-top: 5px solid var(--primary-color);
            position: relative;
            overflow: hidden;
        }

        .welcome-section::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--primary-color), var(--primary-dark));
        }

        .welcome-section h1 {
            color: var(--primary-dark);
            margin-bottom: 20px;
            font-size: 28px;
            position: relative;
            display: inline-block;
        }

        .welcome-section h1::after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: var(--primary-color);
            border-radius: 3px;
        }

        .welcome-section p {
            color: var(--text-light);
            line-height: 1.7;
            margin-bottom: 20px;
            max-width: 700px;
            margin-left: auto;
            margin-right: auto;
            font-size: 16px;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .action-btn {
            padding: 16px 32px;
            border-radius: 10px;
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
            display: inline-flex;
            align-items: center;
            box-shadow: var(--shadow-md);
            position: relative;
            overflow: hidden;
            border: none;
            cursor: pointer;
            z-index: 1;
        }

        .action-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, var(--primary-light), var(--primary-color));
            opacity: 0;
            transition: opacity 0.4s ease;
            z-index: -1;
        }

        .action-btn:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(255, 107, 53, 0.4);
        }

        .action-btn:hover::before {
            opacity: 1;
        }

        .action-btn:active {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 107, 53, 0.4);
        }

        .action-btn i {
            margin-right: 12px;
            font-size: 18px;
            transition: transform 0.3s ease;
        }

        .action-btn:hover i {
            transform: translateX(5px);
        }

        .inspiration-section {
            background: white;
            border-radius: 12px;
            padding: 35px;
            box-shadow: var(--shadow-sm);
            text-align: center;
            border-left: 5px solid var(--primary-color);
            position: relative;
        }

        .inspiration-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 5px;
            height: 100%;
            background: linear-gradient(to bottom, var(--primary-color), var(--primary-dark));
        }

        .inspiration-section h2 {
            color: var(--primary-dark);
            margin-bottom: 20px;
            font-size: 22px;
        }

        .quote {
            font-style: italic;
            color: var(--text-light);
            line-height: 1.8;
            font-size: 18px;
            max-width: 700px;
            margin: 0 auto 20px;
            position: relative;
            padding: 0 20px;
        }

        .quote::before, .quote::after {
            content: '"';
            font-size: 32px;
            color: var(--primary-light);
            position: absolute;
            opacity: 0.3;
        }

        .quote::before {
            top: -15px;
            left: -5px;
        }

        .quote::after {
            bottom: -25px;
            right: -5px;
        }

        .author {
            color: var(--primary-color);
            font-weight: 600;
            font-size: 16px;
            display: inline-block;
            padding: 5px 15px;
            border-radius: 20px;
            background-color: rgba(255, 107, 53, 0.1);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .welcome-section, .inspiration-section {
            animation: fadeIn 0.8s cubic-bezier(0.22, 1, 0.36, 1) forwards;
            opacity: 0;
        }

        .inspiration-section {
            animation-delay: 0.2s;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
                padding: 20px 0;
            }
            .main-content {
                margin-left: 0;
                padding: 30px 20px;
            }
            .action-buttons {
                flex-direction: column;
                gap: 15px;
            }
            .welcome-section, .inspiration-section {
                padding: 30px 20px;
            }
            .action-btn {
                padding: 14px 24px;
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <div class="sidebar-header">
            <h3>CareTaker Dashboard</h3>
            <p>Welcome back, <%= ct != null ? ct.getName() : "CareTaker" %>!</p>
        </div>
        <div class="nav-menu">
            <a href="View_MedicineCaretaker33" class="nav-item">
                <i class="fas fa-pills"></i>
                <span>View Donations</span>
            </a>
            <a href="ViewMyRequestCaretaker33?ccontact=<%= ct != null ? ct.getContId() : "" %>" class="nav-item">
                <i class="fas fa-hand-holding-heart"></i>
                <span>My Requests</span>
            </a>
            <a href="logout_caretaker" class="nav-item">
                <i class="fas fa-sign-out-alt"></i>
                <span>Logout</span>
            </a>
        </div>
    </div>

    <div class="main-content">
        <div class="welcome-section">
            <h1>Welcome to CareTaker Portal</h1>
            <p>Your compassionate care makes a world of difference. This portal connects you with the resources needed to support your patients' health and wellbeing.</p>
            
            <div class="action-buttons">
                <a href="View_MedicineCaretaker33" class="action-btn">
                    <i class="fas fa-pills"></i> View Available Donations
                </a>
                <a href="ViewMyRequestCaretaker33?ccontact=<%= ct != null ? ct.getContId() : "" %>" class="action-btn">
                    <i class="fas fa-list-ul"></i> Manage My Requests
                </a>
            </div>
        </div>

        <div class="inspiration-section">
            <h2>Today's Inspiration</h2>
            <div class="quote">
                "Caregiving is not just about doing tasks, it's about being present with another human being during their time of need. Your work matters more than you know."
            </div>
            <div class="author">- Anonymous Care Recipient</div>
        </div>
    </div>

    <script>
        // Enhanced animation handling
        document.addEventListener('DOMContentLoaded', function() {
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.style.animationPlayState = 'running';
                        observer.unobserve(entry.target);
                    }
                });
            }, { threshold: 0.1 });
            
            document.querySelectorAll('.welcome-section, .inspiration-section').forEach(el => {
                el.style.opacity = 0;
                observer.observe(el);
            });
        });
    </script>
</body>
</html>