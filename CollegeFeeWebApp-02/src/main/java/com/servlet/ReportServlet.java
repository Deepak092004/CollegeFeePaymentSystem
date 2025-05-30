	package com.servlet;
	
	import com.dao.FeePaymentDAO;
	import com.model.FeePayment;
	import java.io.IOException;
	import java.text.ParseException;
	import java.text.SimpleDateFormat;
	import java.util.Date;
	import java.util.List;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	
	@WebServlet("/generateReport")
	public class ReportServlet extends HttpServlet {
	    private static final long serialVersionUID = 1L;
	    private FeePaymentDAO feePaymentDAO;
	
	    public void init() {
	        feePaymentDAO = new FeePaymentDAO();
	    }
	
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        String reportType = request.getParameter("reportType");
	        
	        try {
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	            
	            if ("overdue".equals(reportType)) {
	                List<FeePayment> overduePayments = feePaymentDAO.selectOverduePayments();
	                request.setAttribute("reportData", overduePayments);
	                request.setAttribute("reportTitle", "Students with Overdue Payments");
	            } 
	            else if ("unpaid".equals(reportType)) {
	                Date startDate = sdf.parse(request.getParameter("startDate"));
	                Date endDate = sdf.parse(request.getParameter("endDate"));
	                
	                List<FeePayment> unpaidStudents = feePaymentDAO.selectUnpaidStudents(
	                    new java.sql.Date(startDate.getTime()),
	                    new java.sql.Date(endDate.getTime())
	                );
	                
	                request.setAttribute("reportData", unpaidStudents);
	                request.setAttribute("reportTitle", "Students Who Haven't Paid");
	                request.setAttribute("startDate", sdf.format(startDate));
	                request.setAttribute("endDate", sdf.format(endDate));
	            } 
	       /*     else if ("collections".equals(reportType)) {
	                Date startDate = sdf.parse(request.getParameter("startDate"));
	                Date endDate = sdf.parse(request.getParameter("endDate"));
	                
	                double totalCollections = feePaymentDAO.getTotalCollections(
	                    new java.sql.Date(startDate.getTime()),
	                    new java.sql.Date(endDate.getTime())
	                );
	                
	                request.setAttribute("totalCollections", totalCollections);
	                request.setAttribute("reportTitle", "Total Fee Collections");
	                request.setAttribute("startDate", sdf.format(startDate));
	                request.setAttribute("endDate", sdf.format(endDate));
	            }  */
	            else if ("collections".equals(reportType)) {
	                Date startDate = sdf.parse(request.getParameter("startDate"));
	                Date endDate = sdf.parse(request.getParameter("endDate"));
	                
	                double totalCollections = feePaymentDAO.getTotalCollections(
	                    new java.sql.Date(startDate.getTime()),
	                    new java.sql.Date(endDate.getTime())
	                );

	                int totalPayments = feePaymentDAO.getTotalPaymentsCount(
	                    new java.sql.Date(startDate.getTime()),
	                    new java.sql.Date(endDate.getTime())
	                );

	                int paidStudents = feePaymentDAO.getPaidStudentsCount(
	                    new java.sql.Date(startDate.getTime()),
	                    new java.sql.Date(endDate.getTime())
	                );

	                double averagePayment = (totalPayments > 0) ? totalCollections / totalPayments : 0.0;

	                request.setAttribute("totalCollections", totalCollections);
	                request.setAttribute("totalPayments", totalPayments);
	                request.setAttribute("paidStudents", paidStudents);
	                request.setAttribute("averagePayment", averagePayment);

	                request.setAttribute("reportTitle", "Total Fee Collections");
	                request.setAttribute("startDate", sdf.format(startDate));
	                request.setAttribute("endDate", sdf.format(endDate));
	            }

	            
	            request.setAttribute("reportType", reportType);
	            request.getRequestDispatcher("report_result.jsp").forward(request, response);
	            
	        } catch (ParseException e) {
	            e.printStackTrace();
	            response.sendRedirect("report_form.jsp?error=1&reportType=" + reportType);
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("reports.jsp?error=1");
	        }
	    }
	}