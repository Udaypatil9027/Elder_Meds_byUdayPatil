<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="ElderMeds_Models.Medicine"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="ElderMeds_Models.CareTaker"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Available Medicines</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #ffe5b4, #fff3e0);
        margin: 0;
        padding: 20px;
    }

    h2 {
        color: #d35400;
        text-align: center;
        margin-bottom: 30px;
    }

    table {
        width: 95%;
        margin: auto;
        border-collapse: collapse;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        background: white;
    }

    th {
        background-color: #f39c12;
        color: white;
        padding: 12px;
    }

    td {
        text-align: center;
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }

    tr:nth-child(even) {
        background-color: #fef9f4;
    }

    input[type="number"] {
        padding: 5px;
        width: 90px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    input[type="submit"] {
        background-color: #e67e22;
        color: white;
        border: none;
        padding: 6px 12px;
        cursor: pointer;
        border-radius: 4px;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #ca6f1e;
    }

    .btn-back {
        background-color: #d35400;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 6px;
        font-size: 15px;
        cursor: pointer;
        display: block;
        margin: 40px auto 10px;
        transition: background-color 0.3s ease;
    }

    .btn-back:hover {
        background-color: #b34700;
    }

    .msg {
        text-align: center;
        color: green;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .error {
        text-align: center;
        color: red;
        font-weight: bold;
        margin-bottom: 20px;
    }
</style>
</head>
<body>

	<h2>All Donated Medicines</h2>

	<% if (request.getAttribute("msg") != null) { %>
		<p class="msg"><%= request.getAttribute("msg") %></p>
	<% } %>

	<%
		CareTaker caretaker = (CareTaker) session.getAttribute("loggedCareTaker");
		if (caretaker == null) {
	%>
		<p class="error">No caretaker is logged in.</p>
	<%
		} else {
			List<Medicine> medicines = (List<Medicine>) request.getAttribute("medicines");
			if (medicines != null && !medicines.isEmpty()) {
	%>
	<table>
		<tr>
			<th>ID</th>
			<th>Donor Contact</th>
			<th>Medicine Name</th>
			<th>Quantity</th>
			<th>Expiry Date</th>
			<th>Donation Date</th>
			<th>Request</th>
		</tr>

		<% for (Medicine m : medicines) { %>
		<tr>
			<td><%=m.getId()%></td>
			<td><%=m.getDonorContactId()%></td>
			<td><%=m.getMedicineName()%></td>
			<td><%=m.getQuantity()%></td>
			<td><%=m.getExpiryDate()%></td>
			<td><%=m.getDonationDate()%></td>
			<td>
				<form action="RequestMedicine" method="post">
					<input type="hidden" name="medicineId" value="<%=m.getId()%>" />
					<input type="hidden" name="donorContactId" value="<%=m.getDonorContactId()%>" />
					<input type="hidden" name="medicineName" value="<%=m.getMedicineName()%>" />
					<input type="hidden" name="caretakerContactId" value="<%=caretaker.getContId()%>" />
					<input type="number" name="quantityRequested" placeholder="Quantity" required min="1" max="<%=m.getQuantity()%>" />
					<input type="submit" value="Request" />
				</form>
			</td>
		</tr>
		<% } %>
	</table>
	<%
		} else {
	%>
	<p class="error">No medicines available.</p>
	<%
		}
		}
	%>

	<a href="Caretaker_Dashboard33">
		<button class="btn-back">Back</button>
	</a>

</body>
</html>
