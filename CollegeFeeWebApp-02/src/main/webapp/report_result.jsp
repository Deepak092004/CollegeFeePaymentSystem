<%@ page import="java.util.List, com.model.FeePayment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="View report results for the College Fee Payment System">
    <meta name="author" content="College Fee System Team">
    <title>Report Results | College Fee Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.bootstrap5.min.css" rel="stylesheet">
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
        .report-description {
            color: #6b7280;
            font-size: 1rem;
            margin-bottom: 1rem;
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
        .report-summary {
            background: #f9fafb;
            border-radius: 8px;
            padding: 2rem;
            margin-bottom: 2rem;
            border-left: 4px solid #10b981;
            text-align: center;
        }
        body.dark-mode .report-summary {
            background: #2d3748;
        }
        .total-amount {
            font-size: 2.5rem;
            font-weight: 700;
            color: #10b981;
            margin: 1rem 0;
        }
        .report-period {
            color: #6b7280;
            font-size: 0.875rem;
        }
        .table-responsive {
            overflow-x: auto;
        }
        table.dataTable {
            border-collapse: collapse !important;
            background: #ffffff;
        }
        body.dark-mode table.dataTable {
            background: #2d3748;
        }
        .badge {
            padding: 0.5rem 0.75rem;
            border-radius: 20px;
            font-weight: 500;
            font-size: 0.85rem;
            text-transform: uppercase;
        }
        .badge-paid {
            background: rgba(16, 185, 129, 0.1);
            color: #10b981;
        }
        .badge-unpaid {
            background: rgba(234, 179, 8, 0.1);
            color: #eab308;
        }
        .badge-overdue {
            background: rgba(239, 68, 68, 0.1);
            color: #ef4444;
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
        .alert-info {
            background-color: rgba(59, 130, 246, 0.1);
            color: #3b82f6;
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
        .dt-buttons .btn {
            border-radius: 8px !important;
            padding: 0.5rem 1rem !important;
            font-size: 0.875rem !important;
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
            .header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            .btn-group {
                width: 100%;
                justify-content: flex-end;
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
                <div>
                    <h1>Report Results</h1>
                    <p class="report-description"><%= request.getAttribute("reportTitle") %></p>
                </div>
                <div class="btn-group">
                    <button class="btn btn-outline" onclick="window.print()">
                        <i class="fas fa-print"></i> Print
                    </button>
                    <a href="reports.jsp?reportType=<%= request.getAttribute("reportType") %>" class="btn btn-outline">
                        <i class="fas fa-arrow-left"></i> Back
                    </a>
                    <button class="btn btn-primary" id="exportPdf">
                        <i class="fas fa-file-pdf"></i> PDF
                    </button>
                </div>
            </div>
            <% if ("collections".equals(request.getAttribute("reportType"))) { %>
                <div class="report-summary">
                    <h4>Total Collections Summary</h4>
                    <div class="total-amount">
                        ₹<%= String.format("%.2f", request.getAttribute("totalCollections")) %>
                    </div>
                    <p class="report-period">
                        <i class="fas fa-calendar-alt"></i> 
                        <%= request.getAttribute("startDate") %> to <%= request.getAttribute("endDate") %>
                    </p>
                    <div class="mt-3">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="p-3 bg-light rounded">
                                    <h6>Total Payments</h6>
                                    <h4><%= request.getAttribute("totalPayments") %></h4>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="p-3 bg-light rounded">
                                    <h6>Paid Students</h6>
                                    <h4><%= request.getAttribute("paidStudents") %></h4>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="p-3 bg-light rounded">
                                    <h6>Average Payment</h6>
                                    <h4>₹<%= String.format("%.2f", request.getAttribute("averagePayment")) %></h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <% } else { 
                List<FeePayment> reportData = (List<FeePayment>) request.getAttribute("reportData");
                if (reportData != null && !reportData.isEmpty()) { 
            %>
                <div class="table-responsive">
                    <table id="reportTable" class="table table-striped table-hover" style="width:100%">
                        <thead>
                            <tr>
                                <th>Payment ID</th>
                                <th>Student ID</th>
                                <th>Student Name</th>
                                <th>Payment Date</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (FeePayment payment : reportData) { 
                                String badgeClass = "";
                                if ("Paid".equals(payment.getStatus())) {
                                    badgeClass = "badge-paid";
                                } else if ("Overdue".equals(payment.getStatus())) {
                                    badgeClass = "badge-overdue";
                                }
                            %>
                                <tr>
                                    <td><%= payment.getPaymentId() %></td>
                                    <td><%= payment.getStudentId() %></td>
                                    <td><%= payment.getStudentName() %></td>
                                    <td><%= payment.getPaymentDate() %></td>
                                    <td>₹<%= String.format("%.2f", payment.getAmount()) %></td>
                                    <td><span class="badge <%= badgeClass %>"><%= payment.getStatus() %></span></td>
                                    <td>
                                        <div class="btn-group btn-group-sm">
                                            <a href="feepaymentupdate.jsp?id=<%= payment.getPaymentId() %>" class="btn btn-sm btn-outline-primary" title="Edit">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <a href="feepaymentdelete.jsp?id=<%= payment.getPaymentId() %>" class="btn btn-sm btn-outline-danger" title="Delete">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                        <% if ("overdue".equals(request.getAttribute("reportType"))) { %>
                        <!--
                        <tfoot>
                            <tr>
                                <th colspan="4" class="text-end">Total Outstanding:</th>
                                <th>₹<%= String.format("%.2f", request.getAttribute("totalOutstanding")) %></th>
                                <th colspan="2"></th>
                            </tr>
                        </tfoot>
                        -->
                        <% } %>
                    </table>
                </div>
            <% } else { %>
                <div class="alert alert-info">
                    <i class="fas fa-info-circle"></i> No records found matching your criteria.
                </div>
            <% } 
               } %>
            <div class="mt-4 text-muted text-center">
                <small>
                    <i class="fas fa-clock"></i> Report generated on: <%= new java.util.Date() %> | 
                    <i class="fas fa-user"></i> Generated by: <%= request.getRemoteUser() != null ? request.getRemoteUser() : "System" %>
                </small>
            </div>
            <a href="index.jsp" class="back-link">← Return to Dashboard</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.bootstrap5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.print.min.js"></script>
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
        $(document).ready(function() {
            var table = $('#reportTable').DataTable({
                responsive: true,
                dom: '<"top"Bf>rt<"bottom"lip><"clear">',
                buttons: [
                    {
                        extend: 'copy',
                        className: 'btn btn-sm btn-outline-secondary',
                        text: '<i class="fas fa-copy"></i> Copy'
                    },
                    {
                        extend: 'excel',
                        className: 'btn btn-sm btn-outline-success',
                        text: '<i class="fas fa-file-excel"></i> Excel',
                        title: '<%= request.getAttribute("reportTitle") %>',
                        exportOptions: { columns: ':not(:last-child)' }
                    },
                    {
                        extend: 'csv',
                        className: 'btn btn-sm btn-outline-primary',
                        text: '<i class="fas fa-file-csv"></i> CSV',
                        title: '<%= request.getAttribute("reportTitle") %>',
                        exportOptions: { columns: ':not(:last-child)' }
                    },
                    {
                        extend: 'pdf',
                        className: 'btn btn-sm btn-outline-danger',
                        text: '<i class="fas fa-file-pdf"></i> PDF',
                        title: '<%= request.getAttribute("reportTitle") %>',
                        exportOptions: { columns: ':not(:last-child)' },
                        customize: function(doc) {
                            doc.content[1].table.widths = 
                                Array(doc.content[1].table.body[0].length + 1).join('*').split('');
                            doc.styles.tableHeader.alignment = 'center';
                        }
                    },
                    {
                        extend: 'print',
                        className: 'btn btn-sm btn-outline-info',
                        text: '<i class="fas fa-print"></i> Print',
                        title: '<%= request.getAttribute("reportTitle") %>',
                        exportOptions: { columns: ':not(:last-child)' }
                    }
                ],
                order: [[0, 'desc']],
                language: {
                    search: "_INPUT_",
                    searchPlaceholder: "Search records...",
                    lengthMenu: "Show _MENU_ entries",
                    info: "Showing _START_ to _END_ of _TOTAL_ entries",
                    infoEmpty: "Showing 0 to 0 of 0 entries",
                    infoFiltered: "(filtered from _MAX_ total entries)",
                    paginate: {
                        first: "First",
                        last: "Last",
                        next: "Next",
                        previous: "Previous"
                    }
                }
            });
            $('#exportPdf').click(function() {
                table.button('.buttons-pdf').trigger();
            });
        });
    </script>
</body>
</html>