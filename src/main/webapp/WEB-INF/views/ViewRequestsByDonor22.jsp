<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="ElderMeds_Models.requests" %>
<%@ page import="ElderMeds_Models.Medicine" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Requests</title>
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
            background-color: #f8f9fa;
            color: #333;
            padding: 30px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            padding: 30px;
        }

        h2 {
            color: #3b2667;
            margin-bottom: 25px;
            padding-bottom: 10px;
            border-bottom: 2px solid #f0f0f0;
            font-size: 24px;
            display: flex;
            align-items: center;
        }

        h2 i {
            margin-right: 10px;
            font-size: 22px;
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

        .status-form {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        select {
            padding: 8px 12px;
            border-radius: 4px;
            border: 1px solid #ddd;
            background-color: white;
            font-size: 14px;
            min-width: 120px;
        }

        .btn {
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
            font-size: 14px;
        }

        .btn-primary {
            background-color: #3b2667;
            color: white;
        }

        .btn-primary:hover {
            background-color: #4d3790;
            transform: translateY(-2px);
            box-shadow: 0 3px 8px rgba(59, 38, 103, 0.3);
        }

        .btn-back {
            background-color: #6b73ff;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            margin-top: 20px;
        }

        .btn-back:hover {
            background-color: #7d84ff;
            transform: translateY(-2px);
        }

        .btn-back i {
            margin-right: 8px;
        }

        .empty-message {
            text-align: center;
            padding: 30px;
            color: #666;
            font-style: italic;
        }

        .warning {
            color: #e74c3c;
            font-weight: 500;
        }

        .status-pending {
            color: #f39c12;
            font-weight: 500;
        }

        .status-approved {
            color: #27ae60;
            font-weight: 500;
        }

        .status-rejected {
            color: #e74c3c;
            font-weight: 500;
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
            
            .status-form {
                flex-direction: column;
                align-items: flex-start;
                gap: 8px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><i class="fas fa-hand-holding-medical"></i> Medicine Requests for Your Donations</h2>

        <%
            List<requests> requestList = (List<requests>) request.getAttribute("requests");
            List<Medicine> medicineList = (List<Medicine>) request.getAttribute("medicines");
            String dcontact = (String) request.getAttribute("dcontact");
            boolean found = false;
        %>

        <%
        if (requestList != null && medicineList != null && dcontact != null) {
        %>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Request ID</th>
                        <th>Medicine Name</th>
                        <th>Requested Qty</th>
                        <th>Request Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (requests req : requestList) {
                            for (Medicine med : medicineList) {
                                if (req.getMedicineId() == med.getId() && dcontact.equals(med.getDonorContactId())) {
                                    found = true;
                                    int donatedQty = Integer.parseInt(med.getQuantity());
                                    int requestedQty = Integer.parseInt(req.getQuantityRequested());
                                    boolean insufficientQty = requestedQty > donatedQty;
                    %>
                    <tr>
                        <td><%= req.getId() %></td>
                        <td><%= req.getMedicineName() %></td>
                        <td class="<%= insufficientQty ? "warning" : "" %>">
                            <%= req.getQuantityRequested() %>
                            <% if (insufficientQty) { %>
                                <i class="fas fa-exclamation-circle"></i>
                            <% } %>
                        </td>
                        <td><%= req.getRequestDate() %></td>
                        <td class="status-<%= req.getStatus().toLowerCase() %>">
                            <%= req.getStatus() %>
                        </td>
                        <td>
                            <form action="updateRequestStatus" method="post" class="status-form">
                                <input type="hidden" name="requestId" value="<%= req.getId() %>">
                                <input type="hidden" name="dcontact" value="<%= dcontact %>">
                               
                                <select name="newStatus">
                                    <option value="Pending" <%= req.getStatus().equalsIgnoreCase("Pending") ? "selected" : "" %>>Pending</option>
                                    <option value="Approved" <%= req.getStatus().equalsIgnoreCase("Approved") ? "selected" : "" %>>Approved</option>
                                    <option value="Rejected" <%= req.getStatus().equalsIgnoreCase("Rejected") ? "selected" : "" %>>Rejected</option>
                                </select>
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>
                        </td>
                    </tr>
                    <%
                                }
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
        <%
            }
        %>

        <%
            if (!found) {
        %>
            <div class="empty-message">
                <p>No requests found for your donated medicines.</p>
                <p>Check back later or consider donating more medicines.</p>
            </div>
        <%
            }
        %>

        <a href="Donor_Dashboard22" class="btn btn-back">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>
    </div>
</body>
</html>