<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Update a fee payment in the College Fee Payment System">
    <meta name="author" content="College Fee System Team">
    <title>Update Fee Payment</title>
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
            justify-content: center;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
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
        h1 {
            color: #10b981;
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 2rem;
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
        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }
        .form-group label {
            font-weight: 600;
            font-size: 0.9rem;
            margin-bottom: 0.5rem;
            display: block;
            color: #333;
        }
        body.dark-mode .form-group label {
            color: #e5e7eb;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 0.8rem;
            border: 2px solid #d1d5db;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: #ffffff;
            color: #333;
        }
        body.dark-mode .form-group input, body.dark-mode .form-group select {
            background: #4b5563;
            color: #e5e7eb;
            border-color: #6b7280;
        }
        .form-group input:focus, .form-group select:focus {
            border-color: #10b981;
            outline: none;
            box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.2);
        }
        .btn-primary {
            background-color: #10b981;
            border: none;
            padding: 1rem 2rem;
            font-size: 1rem;
            font-weight: 600;
            border-radius: 8px;
            color: #fff;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        .btn-primary:hover {
            background-color: #eab308;
            transform: translateY(-2px);
        }
        .alert {
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        .alert-success {
            background-color: rgba(16, 185, 129, 0.1);
            color: #10b981;
        }
        .alert-danger {
            background-color: rgba(239, 68, 68, 0.1);
            color: #ef4444;
        }
        .back-link {
            display: block;
            margin-top: 1.5rem;
            color: #10b981;
            font-weight: 600;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .back-link:hover {
            color: #eab308;
        }
        .theme-toggle {
            position: absolute;
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
            <h1>Update Fee Payment</h1>
            <% if (request.getParameter("success") != null) { %>
                <div class="alert alert-success">
                    <i class="fas fa-check-circle"></i> Payment updated successfully!
                </div>
            <% } %>
            <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-danger">
                    <i class="fas fa-exclamation-circle"></i> Failed to update payment. Please try again.
                </div>
            <% } %>
            <form action="updateFeePayment" method="post">
                <div class="form-group">
                    <label for="paymentID">Payment ID</label>
                    <input type="number" class="form-control" id="paymentID" name="paymentId" required placeholder="Enter payment ID" aria-describedby="paymentIDHelp">
                    <div id="paymentIDHelp" class="form-text">Enter the unique Payment ID to update.</div>
                </div>
                <div class="form-group">
                    <label for="studentID">Student ID</label>
                    <input type="number" class="form-control" id="studentID" name="studentId" required placeholder="Enter student ID" aria-describedby="studentIDHelp">
                    <div id="studentIDHelp" class="form-text">Enter the unique student ID.</div>
                </div>
                <div class="form-group">
                    <label for="studentName">Student Name</label>
                    <input type="text" class="form-control" id="studentName" name="studentName" required placeholder="Enter student name" aria-describedby="studentNameHelp">
                    <div id="studentNameHelp" class="form-text">Enter the full name of the student.</div>
                </div>
                <div class="form-group">
                    <label for="paymentDate">Payment Date</label>
                    <input type="date" class="form-control" id="paymentDate" name="paymentDate" required aria-describedby="paymentDateHelp">
                    <div id="paymentDateHelp" class="form-text">Select the date of the payment.</div>
                </div>
                <div class="form-group">
                    <label for="amount">Amount (₹)</label>
                    <input type="number" step="0.01" class="form-control" id="amount" name="amount" required placeholder="0.00" aria-describedby="amountHelp">
                    <div id="amountHelp" class="form-text">Enter the payment amount (e.g., 1500.00).</div>
                </div>
                <div class="form-group">
                    <label for="status">Payment Status</label>
                    <select class="form-control" id="status" name="status" required aria-describedby="statusHelp">
                        <option value="" disabled selected>Select status</option>
                        <option value="Paid">Paid</option>
                        <option value="Overdue">Overdue</option>
                    </select>
                    <div id="statusHelp" class="form-text">Select the payment status.</div>
                </div>
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Update Payment
                </button>
            </form>
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
    </script>
</body>
</html>