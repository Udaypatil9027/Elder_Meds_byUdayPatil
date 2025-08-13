<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, ElderMeds_Models.Medicine"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View Medicine Donations</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        body {
            background-color: #f8f9fa;
            padding: 30px;
            color: #333;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            padding: 30px;
        }
        
        h2 {
            color: #3b2667;
            margin: 25px 0 15px;
            padding-bottom: 10px;
            border-bottom: 2px solid #f0f0f0;
        }
        
        .table-container {
            overflow-x: auto;
            margin-bottom: 30px;
            border-radius: 8px;
            border: 1px solid #e0e0e0;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }
        
        th {
            background-color: #f5f7fa;
            color: #3b2667;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 13px;
        }
        
        tr:hover {
            background-color: #f9f9f9;
        }
        
        .btn {
            display: inline-block;
            padding: 8px 15px;
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            transition: all 0.3s ease;
        }
        
        .btn:hover {
            background-color: #c0392b;
            transform: translateY(-2px);
        }
        
        .btn-back {
            background-color: #3b2667;
            padding: 10px 20px;
            margin-top: 20px;
            display: inline-block;
        }
        
        .btn-back:hover {
            background-color: #4d3790;
        }
        
        .empty-message {
            text-align: center;
            padding: 20px;
            color: #666;
            font-style: italic;
        }
        
        @media (max-width: 768px) {
            body {
                padding: 15px;
            }
            
            .container {
                padding: 20px;
            }
            
            th, td {
                padding: 10px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Your Donations</h2>
        <%
            List<Medicine> medList = (List<Medicine>) request.getAttribute("medicine");
            String donorContact = (String) request.getAttribute("dcontact");
            boolean hasOwnDonations = false;
        %>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Medicine ID</th>
                        <th>Medicine Name</th>
                        <th>Quantity</th>
                        <th>Expiry Date</th>
                        <th>Donation Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (medList != null && donorContact != null) {
                            for (Medicine m : medList) {
                                if (donorContact.equals(m.getDonorContactId())) {
                                    hasOwnDonations = true;
                    %>
                    <tr>
                        <td><%= m.getId() %></td>
                        <td><%= m.getMedicineName() %></td>
                        <td><%= m.getQuantity() %></td>
                        <td><%= m.getExpiryDate() %></td>
                        <td><%= m.getDonationDate() %></td>
                        <td>
                            <a href="deleteMedicine?medId=<%= m.getId() %>" 
                               onclick="return confirm('Are you sure you want to delete this medicine?');" 
                               class="btn">Delete</a>
                        </td>
                    </tr>
                    <%
                                }
                            }
                        }

                        if (!hasOwnDonations) {
                    %>
                    <tr>
                        <td colspan="6" class="empty-message">You haven't made any donations yet.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <h2>Other Donors' Donations</h2>
        <%
            boolean hasOthersDonations = false;
        %>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Medicine ID</th>
                        <th>Donor Contact</th>
                        <th>Medicine Name</th>
                        <th>Quantity</th>
                        <th>Expiry Date</th>
                        <th>Donation Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (medList != null && donorContact != null) {
                            for (Medicine m : medList) {
                                if (!donorContact.equals(m.getDonorContactId())) {
                                    hasOthersDonations = true;
                    %>
                    <tr>
                        <td><%= m.getId() %></td>
                        <td><%= m.getDonorContactId() %></td>
                        <td><%= m.getMedicineName() %></td>
                        <td><%= m.getQuantity() %></td>
                        <td><%= m.getExpiryDate() %></td>
                        <td><%= m.getDonationDate() %></td>
                    </tr>
                    <%
                                }
                            }
                        }

                        if (!hasOthersDonations) {
                    %>
                    <tr>
                        <td colspan="6" class="empty-message">No donations from other donors.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <a href="Donor_Dashboard22" class="btn btn-back">Back to Dashboard</a>
    </div>
</body>
</html>