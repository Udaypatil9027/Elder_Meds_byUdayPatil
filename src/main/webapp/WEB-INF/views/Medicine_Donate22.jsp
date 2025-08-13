<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Donate Medicine</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .donation-container {
            width: 100%;
            max-width: 600px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 40px;
            position: relative;
            overflow: hidden;
        }

        .donation-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 8px;
            background: linear-gradient(90deg, #3b2667, #6b73ff);
        }

        h2 {
            color: #3b2667;
            margin-bottom: 30px;
            font-size: 28px;
            text-align: center;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #3b2667;
            font-weight: 500;
            font-size: 15px;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        input[type="hidden"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s ease;
            background-color: #f9fafc;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="date"]:focus {
            border-color: #6b73ff;
            outline: none;
            box-shadow: 0 0 0 3px rgba(107, 115, 255, 0.2);
            background-color: white;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
            gap: 15px;
        }

        .btn {
            padding: 12px 25px;
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

        .btn-submit {
            background: linear-gradient(135deg, #3b2667, #6b73ff);
            color: white;
            flex: 1;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(59, 38, 103, 0.3);
        }

        .btn-back {
            background: #f1f3f9;
            color: #3b2667;
            text-decoration: none;
        }

        .btn-back:hover {
            background: #e4e8f0;
            transform: translateY(-2px);
        }

        .icon {
            margin-right: 8px;
            font-size: 16px;
        }

        .info-text {
            color: #666;
            font-size: 14px;
            margin-top: 5px;
        }

        @media (max-width: 600px) {
            .donation-container {
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
    <div class="donation-container">
        <h2><i class="fas fa-pills icon"></i> Donate Medicine</h2>
        
        <form action="medicinedonate" method="post">
            <!-- Pass contact as hidden input -->
            <input type="hidden" name="dcontact" value="<%= session.getAttribute("dcontact") %>">
            
            <div class="form-group">
                <label for="mname">Medicine Name</label>
                <input type="text" id="mname" name="mname" placeholder="Enter medicine name" required>
                <p class="info-text">Please enter the full name of the medicine</p>
            </div>
            
            <div class="form-group">
                <label for="quantity">Quantity</label>
                <input type="number" id="quantity" name="quantity" min="1" placeholder="Number of units" required>
                <p class="info-text">Enter the total number of units you're donating</p>
            </div>
            
            <div class="form-group">
                <label for="expiryDate">Expiry Date</label>
                <input type="date" id="expiryDate" name="expiryDate" required>
                <p class="info-text">Select the expiry date of the medicine</p>
            </div>
            
            <div class="form-group">
                <label for="donationDate">Donation Date</label>
                <input type="date" id="donationDate" name="donationDate" required>
                <p class="info-text">Select today's date or when you'll donate</p>
            </div>
            
            <div class="btn-group">
                <button type="submit" class="btn btn-submit">
                    <i class="fas fa-hand-holding-medical icon"></i> Donate Medicine
                </button>
                
                <a href="Donor_Dashboard22" class="btn btn-back">
                    <i class="fas fa-arrow-left icon"></i> Back to Dashboard
                </a>
            </div>
        </form>
    </div>

    <script>
        // Set default donation date to today
        document.addEventListener('DOMContentLoaded', function() {
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('donationDate').value = today;
            document.getElementById('donationDate').min = today;
            
            // Set minimum expiry date to tomorrow
            const tomorrow = new Date();
            tomorrow.setDate(tomorrow.getDate() + 1);
            document.getElementById('expiryDate').min = tomorrow.toISOString().split('T')[0];
        });
    </script>
</body>
</html>