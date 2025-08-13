<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, ElderMeds_Models.requests" %>
<%
    Object caretakerObj = session.getAttribute("loggedCareTaker");
    if (caretakerObj == null) {
        response.sendRedirect("careTakerLogin.jsp");
        return;
    }

    List<requests> requestList = (List<requests>) request.getAttribute("myRequests");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Medicine Requests</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #fff8f0;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #e67e22;
        }

        table {
            border-collapse: collapse;
            width: 90%;
            margin: 20px auto;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th {
            background-color: #e67e22;
            color: white;
            padding: 15px;
        }

        td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #fef3e5;
        }

        .status-pending {
            color: #e67e22;
            font-weight: bold;
        }

        .status-approved {
            color: #27ae60;
            font-weight: bold;
        }

        .status-rejected {
            color: #c0392b;
            font-weight: bold;
        }

        .btn-back {
            display: block;
            margin: 30px auto;
            background-color: #e67e22;
            color: white;
            border: none;
            padding: 12px 24px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-back:hover {
            background-color: #d35400;
        }
    </style>
</head>
<body>

<h2>Your Requested Medicines</h2>

<table>
    <tr>
        <th>Medicine Name</th>
        <th>Quantity Requested</th>
        <th>Request Date</th>
        <th>Status</th>
    </tr>

    <%
        if (requestList != null && !requestList.isEmpty()) {
            for (requests req : requestList) {
    %>
    <tr>
        <td><%= req.getMedicineName() %></td>
        <td><%= req.getQuantityRequested() %></td>
        <td><%= req.getRequestDate() %></td>
        <td class="status-<%= req.getStatus().toLowerCase() %>"><%= req.getStatus() %></td>
    </tr>
    <%
            }
        } else {
    %>
    <tr>
        <td colspan="4">No requests found.</td>
    </tr>
    <%
        }
    %>
</table>

<a href="Caretaker_Dashboard33">
    <button class="btn-back">Back to Dashboard</button>
</a>

</body>
</html>
