<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medicine Donations | ElderMeds Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2c5f8b;
            --secondary-color: #3a7ca5;
            --accent-color: #4c9bd4;
            --danger-color: #d64045;
            --success-color: #4caf50;
            --warning-color: #ff9800;
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

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            flex-wrap: wrap;
            gap: 20px;
        }

        h1 {
            color: var(--primary-color);
            font-weight: 500;
            margin: 0;
            font-size: 1.8rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .card {
            background: var(--white);
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            padding: 25px;
            margin-bottom: 40px;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.95rem;
            min-width: 800px;
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

        .status-expired {
            background-color: rgba(214, 64, 69, 0.1);
            color: var(--danger-color);
        }

        .status-warning {
            background-color: rgba(255, 152, 0, 0.1);
            color: var(--warning-color);
        }

        .search-filter {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .search-box {
            flex: 1;
            min-width: 250px;
            position: relative;
        }

        .search-box input {
            width: 100%;
            padding: 10px 15px 10px 40px;
            border: 1px solid var(--medium-gray);
            border-radius: 4px;
            font-size: 0.95rem;
        }

        .search-box i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--dark-gray);
        }

        @media (max-width: 768px) {
            .container {
                padding: 0 15px;
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
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><i class="fas fa-pills"></i> Medicine Donations</h1>
        </div>

        <div class="card">
            <div class="search-filter">
                <div class="search-box">
                    <i class="fas fa-search"></i>
                    <input type="text" placeholder="Search donations..." id="searchInput">
                </div>
            </div>

            <table id="donationsTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Donor Contact</th>
                        <th>Medicine Name</th>
                        <th>Quantity</th>
                        <th>Expiry Date</th>
                        <th>Donation Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="m" items="${medicines}">
                        <tr>
                            <td>${m.id}</td>
                            <td>${m.donorContactId}</td>
                            <td>${m.medicineName}</td>
                            <td>${m.quantity}</td>
                            <td>${m.expiryDate}</td>
                            <td>${m.donationDate}</td>
                            <td>
                                <span class="status-badge 
                                    <c:choose>
                                        <c:when test="${m.expiryDate < currentDate}">status-expired</c:when>
                                        <c:when test="${m.expiryDate < warningDate}">status-warning</c:when>
                                        <c:otherwise>status-active</c:otherwise>
                                    </c:choose>">
                                    <c:choose>
                                        <c:when test="${m.expiryDate < currentDate}">Expired</c:when>
                                        <c:when test="${m.expiryDate < warningDate}">Expiring Soon</c:when>
                                        <c:otherwise>Active</c:otherwise>
                                    </c:choose>
                                </span>
                            </td>
                            <td>
                                <form action="deleteDonorMedicine" method="post" style="display:inline;">
                                    <input type="hidden" name="medicineId" value="${m.id}" />
                                    <button type="submit" class="action-btn" onclick="return confirmDelete('${m.medicineName}')">
                                        <i class="fas fa-trash-alt"></i> Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty medicines}">
                        <tr>
                            <td colspan="8" class="no-data">No medicine donations found</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>

        <a href="Admin_Dashboard11" class="back-btn">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>
    </div>

    <script>
        // Enhanced delete confirmation
        function confirmDelete(medicineName) {
            return confirm(`Are you sure you want to delete the donation of ${medicineName}? This action cannot be undone.`);
        }

        // Search functionality
        document.getElementById('searchInput').addEventListener('input', function() {
            const searchValue = this.value.toLowerCase();
            const rows = document.querySelectorAll('#donationsTable tbody tr');
            
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(searchValue) ? '' : 'none';
            });
        });

        // Sort by expiry date (example functionality)
        function sortByExpiry() {
            // Implementation would go here
            console.log('Sorting by expiry date');
        }
    </script>
</body>
</html>