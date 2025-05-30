<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Generate custom reports for the College Fee Payment System">
    <meta name="author" content="College Fee System Team">
    <title>Generate Report</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
        .report-icon {
            font-size: 3rem;
            color: #10b981;
            background: rgba(16, 185, 129, 0.1);
            width: 80px;
            height: 80px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            margin-bottom: 1rem;
        }
        .report-description {
            color: #6b7280;
            font-size: 1rem;
            margin-bottom: 2rem;
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
        .date-input-group {
            position: relative;
        }
        .date-input-group i {
            position: absolute;
            top: 50%;
            right: 15px;
            transform: translateY(-50%);
            color: #6b7280;
            pointer-events: none;
        }
        .btn-primary {
            background-color: #10b981;
            border: none;
            padding: 0.8rem 1.5rem;
            font-size: 1rem;
            font-weight: 600;
            border-radius: 8px;
            color: #fff;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #eab308;
            transform: translateY(-2px);
        }
        .btn-outline {
            background-color: transparent;
            border: 2px solid #10b981;
            padding: 0.8rem 1.5rem;
            font-size: 1rem;
            font-weight: 600;
            border-radius: 8px;
            color: #10b981;
            transition: all 0.3s ease;
        }
        .btn-outline:hover {
            background-color: #eab308;
            border-color: #eab308;
            color: #fff;
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
            <%
                String reportType = request.getParameter("reportType");
                String reportTitle = "";
                String iconClass = "";
                String description = "";

                if ("overdue".equals(reportType)) {
                    reportTitle = "Overdue Payments Report";
                    iconClass = "fas fa-exclamation-triangle";
                    description = "Generate a list of students with overdue fee payments";
                } else if ("unpaid".equals(reportType)) {
                    reportTitle = "Unpaid Fees Report";
                    iconClass = "fas fa-clock";
                    description = "Generate a list of students with pending fee payments";
                } else if ("collections".equals(reportType)) {
                    reportTitle = "Fee Collections Report";
                    iconClass = "fas fa-chart-line";
                    description = "Generate a summary of all fee collections";
                } else {
                    reportTitle = "Generate Report";
                    iconClass = "fas fa-chart-pie";
                    description = "Select a report type to generate";
                }
            %>
            <h1><%= reportTitle %></h1>
            <% if (request.getParameter("success") != null) { %>
                <div class="alert alert-success">
                    <i class="fas fa-check-circle"></i> Report generated successfully!
                </div>
            <% } %>
            <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-danger">
                    <i class="fas fa-exclamation-circle"></i> Failed to generate report. Please try again.
                </div>
            <% } %>
            <div class="text-center">
                <div class="report-icon">
                    <i class="<%= iconClass %>"></i>
                </div>
                <p class="report-description"><%= description %></p>
            </div>
            <form action="generateReport" method="get" class="needs-validation" novalidate>
                <input type="hidden" name="reportType" value="<%= reportType %>">
                <% if (!"overdue".equals(reportType)) { %>
                <div class="row mb-4">
                    <div class="col-md-6 mb-3 mb-md-0">
                        <div class="form-group">
                            <label for="startDate">Start Date</label>
                            <div class="date-input-group">
                                <input type="date" class="form-control" id="startDate" name="startDate" required aria-describedby="startDateHelp">
                                <i class="fas fa-calendar-alt"></i>
                            </div>
                            <div class="form-text" id="startDateHelp">Select the start date for the report.</div>
                            <div class="invalid-feedback">Please select a valid start date.</div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="endDate">End Date</label>
                            <div class="date-input-group">
                                <input type="date" class="form-control" id="endDate" name="endDate" required aria-describedby="endDateHelp">
                                <i class="fas fa-calendar-alt"></i>
                            </div>
                            <div class="form-text" id="endDateHelp">Select the end date for the report.</div>
                            <div class="invalid-feedback">Please select a valid end date.</div>
                        </div>
                    </div>
                </div>
                <% } %>
                <% if ("collections".equals(reportType)) { %>
                <!--
                <div class="form-group mb-4">
                    <label for="reportFormat">Report Format</label>
                    <select class="form-control" id="reportFormat" name="reportFormat" aria-describedby="reportFormatHelp">
                        <option value="pdf" selected>PDF Document</option>
                        <option value="excel">Excel Spreadsheet</option>
                        <option value="csv">CSV File</option>
                    </select>
                    <div class="form-text" id="reportFormatHelp">Choose the format for the report output.</div>
                </div>
                -->
                <% } %>
                <div class="d-flex justify-content-center gap-3">
                    <a href="index.jsp" class="btn btn-outline">
                        <i class="fas fa-times me-2"></i> Cancel
                    </a>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-file-download me-2"></i> Generate Report
                    </button>
                </div>
            </form>
            <a href="index.jsp" class="back-link">← Return to Dashboard</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function toggleTheme() {
            document.body.classList.toggle('dark-mode");
            localStorage.setItem("theme", document.body.classList.contains("dark-mode") ? "dark-mode" : "light-mode");
        }

        window.onload = function () {
            const savedTheme = localStorage.getItem("theme");
            if (savedTheme === "dark-mode") {
                document.body.classList.add("dark-mode");
            }

            // Initialize form validation
            const forms = document.querySelectorAll(".needs-validation");
            forms.forEach((form) => {
                form.addEventListener(
                    "submit",
                    (event) => {
                        if (!form.checkValidity()) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add("was-validated");
                    },
                    false
                );
            });

            // Set default dates
            const today = new Date();
            const firstDay = new Date(today.getFullYear(), today.getMonth(), 1);

            function formatDate(date) {
                const d = new Date(date);
                let month = "" + (d.getMonth() + 1);
                let day = "" + d.getDate();
                const year = d.getFullYear();

                if (month.length < 2) month = "0" + month;
                if (day.length < 2) day = "0" + day;

                return [year, month, day].join("-");
            }

            const startDate = document.getElementById("startDate");
            const endDate = document.getElementById("endDate");

            if (startDate) startDate.value = formatDate(firstDay);
            if (endDate) endDate.value = formatDate(today);

            // Date validation
            if (startDate && endDate) {
                startDate.addEventListener("change", () => {
                    if (endDate.value && startDate.value > endDate.value) {
                        endDate.value = startDate.value;
                    }
                });

                endDate.addEventListener("change", () => {
                    if (startDate.value && endDate.value < startDate.value) {
                        endDate.setCustomValidity("End date must be after start date");
                    } else {
                        endDate.setCustomValidity("");
                    }
                });
            }
        };
    </script>
</body>
</html>