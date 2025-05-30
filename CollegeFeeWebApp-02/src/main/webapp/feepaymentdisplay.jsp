<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="View all fee payments in the College Fee Payment System">
    <meta name="author" content="College Fee System Team">
    <title>View Fee Payments</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f3f4f6;
            color: #333;
            margin: 0;
            min-height: 100vh;
            display: flex;
            transition: background 0.3s, color 0.3s;
        }
        body.dark-mode {
            background-color: #1f2937;
            color: #e5e7eb;
        }
        .split-container {
            display: flex;
            width: 100%;
            min-height: 100vh;
        }
        .left-panel {
            flex: 1;
            background: linear-gradient(to bottom, #10b981, #059669);
            color: #fff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 2rem;
            animation: slideInLeft 0.8s ease;
        }
        .left-panel img {
            width: 100px;
            height: 100px;
            margin-bottom: 2rem;
        }
        .left-panel h2 {
            font-size: 2rem;
            font-weight: 700;
            text-align: center;
        }
        .left-panel p {
            font-size: 1rem;
            text-align: center;
            opacity: 0.9;
        }
        .right-panel {
            flex: 2;
            background: #ffffff;
            padding: 3rem;
            display: flex;
            flex-direction: column;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            animation: slideInRight 0.8s ease;
        }
        body.dark-mode .right-panel {
            background: #374151;
        }
        @keyframes slideInLeft {
            0% { transform: translateX(-100%); opacity: 0; }
            100% { transform: translateX(0); opacity: 1; }
        }
        @keyframes slideInRight {
            0% { transform: translateX(100%); opacity: 0; }
            100% { transform: translateX(0); opacity: 1; }
        }
        .header {
            display: flex;
          justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }
        h1 {
            color: #10b981;
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 0;
            position: relative;
        }
        h1::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 60px;
            height: 3px;
            background: #eab308;
        }
        .btn-primary {
            background-color: #10b981;
            border: none;
            padding: 0.8rem 1.5rem;
            font-size: 1rem;
            font-weight: 600;
            border-radius: 8px;
            color: #fff;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: background 0.3s ease, transform 0.3s;
        }
        .btn-primary:hover {
            background-color: #eab308;
            transform: translateY(-2px);
        }
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 8px;
            overflow: hidden;
            background: #ffffff;
            margin-top: 1rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        body.dark-mode table {
            background: #2d3748;
        }
        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #e5e7eb;
        }
        body.dark-mode th, body.dark-mode td {
            border-bottom: 1px solid #4b5563;
        }
        th {
            background: #222222;
            color: #fff;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
            position: sticky;
            top: 0;
        }
        th:hover {
            background: #eab308;
        }
        tr:nth-child(even) {
            background: #f9fafb;
        }
        body.dark-mode tr:nth-child(even) {
            background: #2f3f50;
        }
        tr:hover {
            background: #e5e7eb;
        }
        body.dark-mode tr:hover {
            background: #4b5563;
        }
        .status {
            padding: 0.4rem 0.8rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
            text-align: center;
            display: inline-block;
        }
        .status-paid {
            background: rgba(16, 185, 129, 0.1);
            color: #10b981;
        }
        .status-unpaid {
            background: rgba(234, 179, 8, 0.1);
            color: #eab308;
        }
        .status-overdue {
            background: rgba(239, 68, 68, 0.1);
            color: #ef4444;
        }
        .amount {
            font-weight: 500;
        }
        .no-data {
            text-align: center;
            padding: 2rem;
            color: #6b7280;
            font-size: 1rem;
        }
        .back-link {
            display: block;
            margin-top: 2rem;
            color: #10b981;
            font-weight: 600;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .back-link:hover {
            color: #eab308;
        }
        .theme-toggle {
            position: fixed;
            top: 20px;
            right: 20px;
            background: none;
            border: none;
            font-size: 1.5rem;
            color: #10b981;
            cursor: pointer;
            z-index: 1000;
            transition: color 0.3s;
        }
        .theme-toggle:hover {
            color: #eab308;
        }
        body.dark-mode .theme-toggle {
            color: #eab308;
        }
        @media (max-width: 768px) {
            .split-container {
                flex-direction: column;
            }
            .left-panel {
                padding: 2rem;
                min-height: 200px;
            }
            .right-panel {
                padding: 2rem;
            }
            h1 {
                font-size: 1.5rem;
            }
            table {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }
            .header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
        }
    </style>
</head>
<body>
    
    <div class="split-container">
        <div class="left-panel">
            <h2>Fee System</h2>
            <p>Effortlessly manage student fee payments.</p>
        </div>
        <div class="right-panel">
            <div class="header">
                <h1>Fee Payment Records</h1>
                <a href="feepaymentadd.jsp" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Add Payment
                </a>
            </div>
            <%
                String url = "jdbc:mysql://localhost:3306/fee_db";
                String username = "root";
                String password = "";
                boolean hasRecords = false;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(url, username, password);
                    Statement stmt = conn.createStatement();
              //      String sql = "SELECT PaymentID, StudentID, StudentName, PaymentDate, Amount, Status " +
                //                 "FROM feepayments p JOIN students s ON p.student_id = s.student_id";
              String sql="SELECT * FROM feepayments";
                    ResultSet rs = stmt.executeQuery(sql);
            %>
            <table id="paymentsTable">
                <thead>
                    <tr>
                        <th onclick="sortTable(0)">Payment ID <i class="fas fa-sort"></i></th>
                        <th onclick="sortTable(1)">Student ID <i class="fas fa-sort"></i></th>
                        <th onclick="sortTable(2)">Student Name <i class="fas fa-sort"></i></th>
                        <th onclick="sortTable(3)">Payment Date <i class="fas fa-sort"></i></th>
                        <th onclick="sortTable(4)">Amount <i class="fas fa-sort"></i></th>
                        <th onclick="sortTable(5)">Status <i class="fas fa-sort"></i></th>
                    </tr>
                </thead>
                <tbody id="payments-tbody">
                    <%
                        while (rs.next()) {
                            hasRecords = true;
                            String statusClass = rs.getString("status").equals("Paid") ? "status-paid" :
                                                rs.getString("status").equals("Unpaid") ? "status-unpaid" : "status-overdue";
                    %>
                    <tr>
                        <td><%= rs.getInt("paymentid") %></td>
                        <td><%= rs.getInt("studentid") %></td>
                        <td><%= rs.getString("studentname") %></td>
                        <td><%= rs.getDate("paymentdate") %></td>
                        <td class="amount">₹<%= String.format("%.2f", rs.getDouble("amount")) %></td>
                        <td><span class="status <%= statusClass %>"><%= rs.getString("status") %></span></td>
                    </tr>
                    <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    %>
                </tbody>
            </table>
            <%
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                }
                if (!hasRecords) {
            %>
            <div class="no-data">No fee payments found.</div>
            <%
                }
            %>
            <a href="index.jsp" class="back-link">← Return to Dashboard</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function toggleTheme() {
            document.body.classList.toggle('dark-mode');
            localStorage.setItem('theme', document.body.classList.contains('dark-mode') ? 'dark-mode' : 'light-mode');
        }

        window.onload = function() {
            const savedTheme = localStorage.getItem('theme');
            if (savedTheme === 'dark-mode') {
                document.body.classList.add('dark-mode');
            }
        };

        function sortTable(n) {
            const table = document.getElementById("paymentsTable");
            let rows, switching = true, i, x, y, shouldSwitch, dir = "asc", switchcount = 0;
            while (switching) {
                switching = false;
                rows = table.rows;
                for (i = 1; i < (rows.length - 1); i++) {
                    shouldSwitch = false;
                    x = rows[i].getElementsByTagName("TD")[n];
                    y = rows[i + 1].getElementsByTagName("TD")[n];
                    let xVal = x.innerHTML.toLowerCase();
                    let yVal = y.innerHTML.toLowerCase();
                    if (n === 0 || n === 1 || n === 4) { // Payment ID, Student ID, Amount
                        xVal = parseFloat(xVal.replace('₹', '')) || 0;
                        yVal = parseFloat(yVal.replace('₹', '')) || 0;
                    } else if (n === 3) { // Payment Date
                        xVal = new Date(xVal);
                        yVal = new Date(yVal);
                    }
                    if (dir === "asc") {
                        if (xVal > yVal) {
                            shouldSwitch = true;
                            break;
                        }
                    } else if (dir === "desc") {
                        if (xVal < yVal) {
                            shouldSwitch = true;
                            break;
                        }
                    }
                }
                if (shouldSwitch) {
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    switching = true;
                    switchcount++;
                } else if (switchcount === 0 && dir === "asc") {
                    dir = "desc";
                    switching = true;
                }
            }
        }
    </script>
</body>
</html>