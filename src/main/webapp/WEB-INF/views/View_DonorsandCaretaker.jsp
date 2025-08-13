<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="ElderMeds_Models.Donor" %>
<%@ page import="ElderMeds_Models.CareTaker" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View Donors & Caretakers | ElderMeds Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2c5f8b;
            --secondary-color: #3a7ca5;
            --accent-color: #4c9bd4;
            --danger-color: #d64045;
            --success-color: #4caf50;
            --text-color: #333333;
            --light-gray: #f8f9fa;
            --medium-gray: #e9ecef;
            --dark-gray: #6c757d;
            --white: #ffffff;
        }

        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background-color: var(--light-gray);
            color: var(--text-color);
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 40px;
            color: var(--primary-color);
            font-weight: 500;
            font-size: 2.2rem;
            position: relative;
            padding-bottom: 15px;
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background-color: var(--accent-color);
        }

        .card {
            background: var(--white);
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            padding: 25px;
            margin-bottom: 40px;
            border-top: 4px solid var(--accent-color);
        }

        h2 {
            color: var(--primary-color);
            margin-bottom: 25px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            font-size: 0.95rem;
        }

        th, td {
            padding: 14px 16px;
            text-align: left;
            border-bottom: 1px solid var(--medium-gray);
        }

        th {
            background-color: var(--primary-color);
            color: var(--white);
            font-weight: 500;
            position: sticky;
            top: 0;
        }

        tr:nth-child(even) {
            background-color: var(--light-gray);
        }

        tr:hover {
            background-color: rgba(74, 144, 226, 0.1);
        }

        .action-btn {
            background-color: var(--danger-color);
            color: var(--white);
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            font-size: 0.85rem;
            cursor: pointer;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .action-btn:hover {
            background-color: #c53030;
            transform: translateY(-1px);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .back-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background-color: var(--primary-color);
            color: var(--white);
            padding: 12px 24px;
            border-radius: 4px;
            text-decoration: none;
            transition: all 0.2s ease;
            margin-top: 30px;
            font-size: 0.95rem;
        }

        .back-btn:hover {
            background-color: #234a6d;
            transform: translateY(-1px);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .no-data {
            text-align: center;
            padding: 30px;
            color: var(--dark-gray);
            font-style: italic;
        }

        .status-badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 0.75rem;
            font-weight: 500;
            text-transform: uppercase;
        }

        .status-active {
            background-color: rgba(76, 175, 80, 0.1);
            color: var(--success-color);
        }

        @media (max-width: 768px) {
            .container {
                padding: 0 15px;
            }

            h1 {
                font-size: 1.8rem;
                margin-bottom: 30px;
            }

            .card {
                padding: 20px;
            }

            th, td {
                padding: 10px 12px;
                font-size: 0.85rem;
            }

            .back-btn {
                padding: 10px 20px;
            }
        }

        @media (max-width: 576px) {
            table {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>View Donors & Caretakers</h1>

        <!-- Donors Section -->
        <div class="card">
            <h2><i class="fas fa-hand-holding-heart"></i> Donors</h2>
            <table>
                <thead>
                    <tr>
                        <th>Contact</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Donor> donors = (List<Donor>) request.getAttribute("donors");
                        if (donors != null && !donors.isEmpty()) {
                            for (Donor d : donors) {
                    %>
                    <tr>
                        <td><%= d.getContactId() %></td>
                        <td><%= d.getDname() %></td>
                        <td><%= d.getDemail() %></td>
                        <td>
                            <form action="deletedonor" method="post" onsubmit="return confirm('Are you sure you want to delete this donor?');">
                                <input type="hidden" name="dcontact" value="<%= d.getContactId() %>"/>
                                <button type="submit" class="action-btn">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="4" class="no-data">No donors found in the system</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>

        <!-- Caretakers Section -->
        <div class="card">
            <h2><i class="fas fa-user-nurse"></i> Caretakers</h2>
            <table>
                <thead>
                    <tr>
                        <th>Contact</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Home Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<CareTaker> caretakers = (List<CareTaker>) request.getAttribute("caretakers");
                        if (caretakers != null && !caretakers.isEmpty()) {
                            for (CareTaker c : caretakers) {
                    %>
                    <tr>
                        <td><%= c.getContId() %></td>
                        <td><%= c.getName() %></td>
                        <td><%= c.getCemail() %></td>
                        <td><%= c.getHomeName() %></td>
                        <td>
                            <form action="deletecaretaker" method="post" onsubmit="return confirm('Are you sure you want to delete this caretaker?');">
                                <input type="hidden" name="ccontact" value="<%= c.getContId() %>"/>
                                <button type="submit" class="action-btn">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="5" class="no-data">No caretakers found in the system</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>

        <!-- Back Button -->
        <a href="Admin_Dashboard11" class="back-btn">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>
    </div>

    <script>
        // Enhanced confirmation for delete actions
        document.querySelectorAll('.action-btn').forEach(button => {
            button.addEventListener('click', function(e) {
                const form = this.closest('form');
                const row = this.closest('tr');
                const name = row.querySelector('td:nth-child(2)').textContent;
                
                if (!confirm(`Are you sure you want to delete ${name}? This action cannot be undone.`)) {
                    e.preventDefault();
                }
            });
        });
    </script>
</body>
</html>