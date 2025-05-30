<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="College Fee Management System - Manage student fees efficiently">
    <meta name="author" content="College Fee System Team">
    <title>College Fee Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f5f4;
            color: #333;
            margin: 0;
        }
        .navbar {
            background-color: #4c1d95;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .navbar-brand {
            font-weight: 700;
            color: #fff !important;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .navbar-brand img {
            width: 40px;
            height: 40px;
        }
        .nav-link {
            color: #fff !important;
            font-weight: 400;
            transition: color 0.3s ease;
        }
        .nav-link:hover, .nav-link.active {
            color: #84cc16 !important;
        }
        .hero {
            background: linear-gradient(135deg, #4c1d95, #7c3aed);
            color: #fff;
            text-align: center;
            padding: 4rem 2rem;
            border-radius: 12px;
            margin-bottom: 2rem;
        }
        .hero h1 {
            font-size: 2.5rem;
            font-weight: 700;
        }
        .hero p {
            font-size: 1.2rem;
            max-width: 600px;
            margin: 1rem auto;
        }
        .features {
            display: flex;
            flex-wrap: wrap;
            gap: 2rem;
            justify-content: center;
        }
        .feature-card {
            background: #fff;
            border-radius: 50%;
            width: 200px;
            height: 200px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease;
            padding: 1rem;
        }
        .feature-card:hover {
            transform: scale(1.05);
        }
        .feature-card i {
            font-size: 2rem;
            color: #84cc16;
            margin-bottom: 0.5rem;
        }
        .feature-card h3 {
            font-size: 1rem;
            font-weight: 700;
            color: #4c1d95;
        }
        .feature-card a {
            color: #84cc16;
            text-decoration: none;
            font-size: 0.9rem;
        }
        .btn-primary {
            background-color: #4c1d95;
            border: none;
            padding: 10px 20px;
            font-weight: 600;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #84cc16;
        }
        .footer {
            text-align: center;
            padding: 2rem;
            background-color: #4c1d95;
            color: #fff;
            margin-top: 3rem;
        }
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 1.8rem;
            }
            .hero p {
                font-size: 1rem;
            }
            .feature-card {
                width: 150px;
                height: 150px;
            }
            .feature-card h3 {
                font-size: 0.9rem;
            }
            .navbar-brand img {
                width: 30px;
                height: 30px;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                College Fee Management System
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" href="index.jsp" aria-label="Dashboard">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="feepaymentadd.jsp" aria-label="Add new payment">Add Payment</a></li>
                    <li class="nav-item"><a class="nav-link" href="feepaymentupdate.jsp" aria-label="Update existing payment">Update Payment</a></li>
                    <li class="nav-item"><a class="nav-link" href="feepaymentdelete.jsp" aria-label="Delete payment">Delete Payment</a></li>
                    <li class="nav-item"><a class="nav-link" href="displayPayments" aria-label="View all payments">View Payments</a></li>
                    <li class="nav-item"><a class="nav-link" href="reports.jsp" aria-label="Generate reports">Reports</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="hero">
            <h1>Welcome to College Fee Management System</h1>
            <p>Streamline fee collection and management with our intuitive platform.</p>
            <a href="feepaymentadd.jsp" class="btn btn-primary">Get Started</a>
        </div>
        <div class="features">
            <div class="feature-card">
                <i class="fas fa-user-plus"></i>
                <h3>Add Payment</h3>
                <a href="feepaymentadd.jsp">Access</a>
            </div>
            <div class="feature-card">
                <i class="fas fa-pen-nib"></i>
                <h3>Update Payment</h3>
                <a href="feepaymentupdate.jsp">Access</a>
            </div>
            <div class="feature-card">
                <i class="fas fa-trash-can"></i>
                <h3>Delete Payment</h3>
                <a href="feepaymentdelete.jsp">Access</a>
            </div>
            <div class="feature-card">
                <i class="fas fa-folder-open"></i>
                <h3>View Payments</h3>
                <a href="displayPayments">Access</a>
            </div>
            <div class="feature-card">
                <i class="fas fa-file-alt"></i>
                <h3>Reports</h3>
                <a href="reports.jsp">Access</a>
            </div>
        </div>
    </div>

    <footer class="footer">
        <p> College Fee Management System</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>