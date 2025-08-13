<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, ElderMeds_Models.requests" %>
<%
    List<requests> requestList = (List<requests>) request.getAttribute("allRequests");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Caretaker Requests</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #a1c4fd, #c2e9fb);
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 95%;
            margin: 40px auto;
            padding: 20px 30px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            overflow: hidden;
            border-radius: 10px;
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: #34495e;
            color: #ecf0f1;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .status-pending {
            color: #f39c12;
            font-weight: bold;
        }

        .status-approved {
            color: #27ae60;
            font-weight: bold;
        }

        .status-rejected {
            color: #e74c3c;
            font-weight: bold;
        }

        .no-data {
            text-align: center;
            font-size: 16px;
            padding: 20px;
            color: #7f8c8d;
        }

        .back-button {
            display: flex;
            justify-content: center;
            margin-top: 40px;
        }

        .back-button button {
            background-color: #2980b9;
            color: white;
            padding: 12px 30px;
            font-size: 15px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .back-button button:hover {
            background-color: #1c5980;
        }

        @media (max-width: 768px) {
            table, th, td {
                font-size: 13px;
                padding: 10px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>All Requests from Caretakers</h2>

    <table>
        <tr>
            <th>Request ID</th>
            <th>Caretaker Contact</th>
            <th>Medicine Name</th>
            <th>Quantity</th>
            <th>Request Date</th>
            <th>Status</th>
        </tr>

        <%
            if (requestList != null && !requestList.isEmpty()) {
                for (requests req : requestList) {
        %>
        <tr>
            <td><%= req.getId() %></td>
            <td><%= req.getCaretakerContactId() %></td>
            <td><%= req.getMedicineName() %></td>
            <td><%= req.getQuantityRequested() %></td>
            <td><%= req.getRequestDate() %></td>
            <td class="status-<%= req.getStatus().toLowerCase() %>">
                <%= req.getStatus() %>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="6" class="no-data">No requests found.</td>
        </tr>
        <%
            }
        %>
    </table>

    <div class="back-button">
        <a href="Admin_Dashboard11">
            <button type="button">← Back to Dashboard</button>
        </a>
    </div>
</div>

</body>
</html>
