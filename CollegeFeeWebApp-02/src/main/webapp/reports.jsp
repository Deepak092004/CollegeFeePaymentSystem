<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Reports | College Fee System</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
       :root {
    --primary-color: #10b981;       
    --primary-light: #34d399;    
    --primary-dark: #059669;       
    --accent-color: #eab308;        
    --success-color: #10b981;      
    --warning-color: #eab308;    
    --danger-color: #ef4444;       
    --light-color: #ffffff;        
    --dark-color: #333333;        
    --gray-500: #6b7280;          
    --border-radius: 0.5rem;      
}

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #e2e8f0 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            color: var(--dark-color);
            transition: background 0.3s ease, color 0.3s ease;
        }

        .dark-mode {
            background: #1e1e2f;
            color: #f0f0f0;
        }

        .dark-mode .container {
            background: #2c2c3e;
            box-shadow: 0 10px 30px rgba(255, 255, 255, 0.05);
        }

        .dark-mode .report-card {
            background: #34344a;
            border-color: rgba(255, 255, 255, 0.05);
        }

        .container {
            max-width: 1000px;
            margin: 2rem auto;
            padding: 2rem;
            background: white;
            border-radius: var(--border-radius);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
        }

        .theme-toggle {
            position: absolute;
            top: 20px;
            right: 30px;
            font-size: 1.5rem;
            cursor: pointer;
            color: var(--primary-dark);
            z-index: 10;
        }

        .theme-toggle:hover {
            color: var(--primary-light);
        }

        .page-header {
            text-align: center;
            margin-bottom: 3rem;
        }

        .page-title {
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 1rem;
            position: relative;
            display: inline-block;
        }

        .page-title:after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: var(--primary-light);
            border-radius: 2px;
        }

        .page-description {
            color: var(--gray-500);
            max-width: 600px;
            margin: 0 auto;
        }

        .report-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-top: 2rem;
        }

        .report-card {
            background: white;
            border-radius: var(--border-radius);
            padding: 2rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            border: 1px solid rgba(0, 0, 0, 0.05);
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        .report-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            border-color: var(--primary-light);
        }

        .report-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 100%;
            background: var(--primary-color);
            transition: all 0.3s ease;
        }

        .report-card:hover::before {
            width: 6px;
            background: var(--primary-light);
        }

        .report-icon {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            color: var(--primary-color);
        }

        .report-card h3 {
            font-weight: 600;
            margin-bottom: 1rem;
            color: var(--primary-dark);
        }

        .report-card p {
            color: var(--gray-500);
            margin-bottom: 1.5rem;
            font-size: 0.95rem;
            line-height: 1.6;
        }

        .report-link {
            display: inline-flex;
            align-items: center;
            color: var(--primary-color);
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .report-link i {
            margin-left: 0.5rem;
            transition: transform 0.3s ease;
        }

        .report-card:hover .report-link {
            color: var(--primary-light);
        }

        .report-card:hover .report-link i {
            transform: translateX(3px);
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            margin-top: 3rem;
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .back-link:hover {
            color: var(--primary-dark);
            text-decoration: underline;
        }

        .back-link i {
            margin-right: 0.5rem;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1.5rem;
                margin: 1rem;
            }

            .theme-toggle {
                right: 20px;
                top: 15px;
            }

            .report-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <i class="fas fa-moon theme-toggle" id="themeToggle" title="Toggle Theme"></i>

    <div class="container">
        <div class="page-header">
            <h1 class="page-title">
                <i class="fas fa-chart-pie"></i> Generate Reports
            </h1>
            <p class="page-description">
                Select a report type below to generate detailed fee payment reports and analytics
            </p>
        </div>

        <div class="report-grid">
            <div class="report-card" onclick="location.href='reportCriteria?reportType=overdue'">
                <div class="report-icon">
                    <i class="fas fa-exclamation-triangle"></i>
                </div>
                <h3>Overdue Payments</h3>
                <p>
                    Generate a comprehensive list of all students with overdue fee payments, 
                    including payment details and days overdue.
                </p>
                <a href="reportCriteria?reportType=overdue" class="report-link">
                    Generate Report <i class="fas fa-arrow-right"></i>
                </a>
            </div>

            <div class="report-card" onclick="location.href='reportCriteria?reportType=unpaid'">
                <div class="report-icon">
                    <i class="fas fa-clock"></i>
                </div>
                <h3>Pending Payments</h3>
                <p>
                    View all students with unpaid fees within a specific period, 
                    with options to filter by department or payment amount.
                </p>
                <a href="reportCriteria?reportType=unpaid" class="report-link">
                    Generate Report <i class="fas fa-arrow-right"></i>
                </a>
            </div>

            <div class="report-card" onclick="location.href='reportCriteria?reportType=collections'">
                <div class="report-icon">
                    <i class="fas fa-chart-line"></i>
                </div>
                <h3>Fee Collections</h3>
                <p>
                    Analyze total fee collections with breakdowns by department, 
                    payment method, and time period for financial reporting.
                </p>
                <a href="reportCriteria?reportType=collections" class="report-link">
                    Generate Report <i class="fas fa-arrow-right"></i>
                </a>
            </div>
        </div>

        <a href="index.jsp" class="back-link">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>
    </div>

    <script>
        const themeToggle = document.getElementById('themeToggle');
        themeToggle.addEventListener('click', () => {
            document.body.classList.toggle('dark-mode');
            themeToggle.classList.toggle('fa-moon');
            themeToggle.classList.toggle('fa-sun');
        });

        // Optional animation
        document.addEventListener('DOMContentLoaded', () => {
            const cards = document.querySelectorAll('.report-card');
            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                setTimeout(() => {
                    card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 150);
            });
        });
    </script>
</body>
</html>
