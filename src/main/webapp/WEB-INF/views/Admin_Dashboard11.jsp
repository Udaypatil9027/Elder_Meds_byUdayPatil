<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard | ElderMeds</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    :root {
        --primary: #007B5E;
        --primary-dark: #00573e;
        --secondary: #6c757d;
        --light: #f8f9fa;
        --dark: #343a40;
        --danger: #dc3545;
    }
    
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f5f5f5;
        display: flex;
        min-height: 100vh;
        overflow-x: hidden;
    }
    
    /* Sidebar Styles */
    .sidebar {
        width: 250px;
        background: white;
        box-shadow: 2px 0 10px rgba(0,0,0,0.1);
        height: 100vh;
        position: fixed;
        padding: 20px 0;
        transition: all 0.3s;
        z-index: 100;
    }
    
    .sidebar-header {
        padding: 0 20px 20px;
        border-bottom: 1px solid #eee;
        text-align: center;
    }
    
    .sidebar-header h2 {
        color: var(--primary);
        font-size: 1.5rem;
    }
    
    .sidebar-menu {
        padding: 20px 0;
    }
    
    .menu-item {
        display: flex;
        align-items: center;
        padding: 12px 20px;
        color: var(--dark);
        text-decoration: none;
        transition: all 0.3s;
        margin: 5px 0;
    }
    
    .menu-item i {
        margin-right: 10px;
        font-size: 1.1rem;
        color: var(--primary);
    }
    
    .menu-item:hover {
        background-color: rgba(0,123,94,0.1);
        color: var(--primary-dark);
        transform: translateX(5px);
    }
    
    .menu-item.active {
        background-color: rgba(0,123,94,0.1);
        border-left: 4px solid var(--primary);
        color: var(--primary-dark);
        font-weight: 500;
    }
    
    .logout-btn {
        margin-top: 20px;
        padding: 12px 20px;
        color: var(--danger);
    }
    
    .logout-btn i {
        color: var(--danger);
    }
    
    /* Main Content Area */
    .main-content {
        margin-left: 250px;
        flex: 1;
        padding: 30px;
        transition: all 0.3s;
    }
    
    .dashboard-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
        padding-bottom: 20px;
        border-bottom: 1px solid #eee;
    }
    
    .dashboard-header h1 {
        color: var(--dark);
        font-size: 1.8rem;
    }
    
    .content-area {
        background: white;
        border-radius: 8px;
        padding: 25px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        min-height: calc(100vh - 150px);
    }
    
    .welcome-message {
        text-align: center;
        padding: 50px 0;
    }
    
    .welcome-message h2 {
        color: var(--primary);
        margin-bottom: 15px;
    }
    
    .welcome-message p {
        color: var(--secondary);
        max-width: 600px;
        margin: 0 auto;
    }
    
    /* Responsive Design */
    @media (max-width: 768px) {
        .sidebar {
            width: 70px;
            overflow: hidden;
        }
        
        .sidebar-header h2, .menu-item span {
            display: none;
        }
        
        .menu-item {
            justify-content: center;
            padding: 15px 0;
        }
        
        .menu-item i {
            margin-right: 0;
            font-size: 1.3rem;
        }
        
        .main-content {
            margin-left: 70px;
        }
    }
    
    @media (max-width: 576px) {
        .sidebar {
            transform: translateX(-100%);
            position: fixed;
        }
        
        .sidebar.active {
            transform: translateX(0);
        }
        
        .main-content {
            margin-left: 0;
        }
        
        .menu-toggle {
            display: block;
        }
    }
</style>
</head>
<body>
    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h2>ElderMeds Admin</h2>
        </div>
        
        <div class="sidebar-menu">
            <a href="#" class="menu-item active">
                <i class="fas fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
            
            <a href="Add_Donor11" class="menu-item">
                <i class="fas fa-user-plus"></i>
                <span>Add Donor</span>
            </a>
            
            <a href="Add_Caretaker11" class="menu-item">
                <i class="fas fa-user-nurse"></i>
                <span>Add Caretaker</span>
            </a>
            
            <a href="View_DonorsandCaretaker" class="menu-item">
                <i class="fas fa-users"></i>
                <span>View Donors & Caretakers</span>
            </a>
            
            <a href="View_MedicinDonation11" class="menu-item">
                <i class="fas fa-pills"></i>
                <span>Medicine Donations</span>
            </a>
            
            <a href="View_AllRequests_Admin" class="menu-item">
                <i class="fas fa-clipboard-list"></i>
                <span>View All Requests</span>
            </a>
            
            <a href="Admin_login11" class="menu-item logout-btn">
                <i class="fas fa-sign-out-alt"></i>
                <span>Logout</span>
            </a>
        </div>
    </div>
    
    <!-- Main Content Area -->
    <div class="main-content">
        <div class="dashboard-header">
            <h1>Admin Dashboard</h1>
        </div>
        
        <div class="content-area">
            <div class="welcome-message">
                <h2>Welcome to ElderMeds Admin Panel</h2>
                <p>Manage donors, caretakers, medicine donations, and requests from this centralized dashboard. 
                Select an option from the sidebar to get started.</p>
            </div>
            
            <!-- Content will be loaded here dynamically -->
            <div id="dynamic-content"></div>
        </div>
    </div>

<script>
    // This script handles loading content dynamically
    document.querySelectorAll('.menu-item:not(.logout-btn)').forEach(item => {
        item.addEventListener('click', function(e) {
            e.preventDefault();
            
            // Remove active class from all menu items
            document.querySelectorAll('.menu-item').forEach(i => {
                i.classList.remove('active');
            });
            
            // Add active class to clicked item
            this.classList.add('active');
            
            // Load content dynamically (you'll need to implement this)
            const url = this.getAttribute('href');
            loadContent(url);
        });
    });
    
    function loadContent(url) {
        // You'll need to implement AJAX to load content
        // For now, we'll just redirect
        window.location.href = url;
    }
</script>
</body>
</html>