<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Donor Dashboard</title>
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
            display: flex;
            min-height: 100vh;
            background-color: #f5f7fa;
            color: #333;
        }

        .sidebar {
            width: 280px;
            background: linear-gradient(135deg, #3b2667, #6b73ff);
            color: white;
            padding: 30px 0;
            height: 100vh;
            position: fixed;
            box-shadow: 2px 0 15px rgba(0, 0, 0, 0.1);
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
            opacity: 0.8;
        }

        .nav-menu {
            margin-top: 30px;
        }

        .nav-item {
            display: flex;
            align-items: center;
            padding: 15px 25px;
            cursor: pointer;
            transition: all 0.3s ease;
            border-left: 4px solid transparent;
            text-decoration: none;
            color: white;
        }

        .nav-item:hover {
            background: rgba(255, 255, 255, 0.1);
            border-left: 4px solid #fff;
        }

        .nav-item i {
            margin-right: 15px;
            font-size: 18px;
            width: 24px;
            text-align: center;
        }

        .main-content {
            flex: 1;
            margin-left: 280px;
            padding: 40px;
        }

        .welcome-section {
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }

        .welcome-section h1 {
            color: #3b2667;
            margin-bottom: 15px;
            font-size: 28px;
        }

        .welcome-section p {
            color: #666;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .action-buttons {
            display: flex;
            gap: 15px;
            margin-top: 25px;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            padding: 12px 25px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            font-size: 15px;
        }

        .btn-primary {
            background: #3b2667;
            color: white;
        }

        .btn-primary:hover {
            background: #4d3790;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(59, 38, 103, 0.2);
        }

        .btn-secondary {
            background: #6b73ff;
            color: white;
        }

        .btn-secondary:hover {
            background: #7d84ff;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(107, 115, 255, 0.2);
        }

        .btn i {
            margin-right: 8px;
            font-size: 16px;
        }

        .inspiration-section {
            background: linear-gradient(135deg, #3b2667, #6b73ff);
            color: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .inspiration-section h2 {
            margin-bottom: 20px;
            font-size: 22px;
        }

        .quote {
            font-style: italic;
            margin-bottom: 20px;
            line-height: 1.6;
        }

        .author {
            text-align: right;
            font-weight: 500;
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
                padding: 20px;
            }
            .action-buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="sidebar-header">
            <h3>Donor Dashboard</h3>
            <p>Welcome back, generous donor!</p>
        </div>
        <div class="nav-menu">
            <a href="Medicine_Donate22?dcontact=${param.dcontact}" class="nav-item">
                <i class="fas fa-pills"></i>
                <span>Donate Medicine</span>
            </a>
            <a href="ViewDonation22?dcontact=${param.dcontact}" class="nav-item">
                <i class="fas fa-history"></i>
                <span>View Donations</span>
            </a>
            <a href="ViewRequestsByDonor22?dcontact=${sessionScope.dcontact}" class="nav-item">
                <i class="fas fa-hand-holding-heart"></i>
                <span>View Requests</span>
            </a>
            <a href="Donor_login22" class="nav-item">
                <i class="fas fa-sign-out-alt"></i>
                <span>Logout</span>
            </a>
        </div>
    </div>

    <div class="main-content">
        <div class="welcome-section">
            <h1>Welcome to Your Donor Dashboard</h1>
            <p>Your generosity has the power to change lives. Every medicine you donate brings hope and healing to those in need. Thank you for being part of this life-saving mission.</p>
            <p>Through this platform, you can easily donate medicines, track your previous donations, and see requests from those who need help the most.</p>
            
            <div class="action-buttons">
                <a href="Medicine_Donate22?dcontact=${param.dcontact}" class="btn btn-primary">
                    <i class="fas fa-pills"></i> Donate Medicine
                </a>
                <a href="ViewRequestsByDonor22?dcontact=${sessionScope.dcontact}" class="btn btn-secondary">
                    <i class="fas fa-hand-holding-heart"></i> View Requests
                </a>
            </div>
        </div>

        <div class="inspiration-section">
            <h2>Your Impact Matters</h2>
            <div class="quote">
                "No one has ever become poor by giving. Your donation of medicine might be the bridge between life and death for someone in need. Every pill counts, every act of kindness reverberates."
            </div>
            <div class="author">- Anonymous Beneficiary</div>
        </div>
    </div>
</body>
</html>