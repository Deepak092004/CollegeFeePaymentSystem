package com.servlet;

import com.dao.FeePaymentDAO;
import com.model.FeePayment;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateFeePayment")
public class UpdateFeePaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FeePaymentDAO feePaymentDAO;

    public void init() {
        feePaymentDAO = new FeePaymentDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int paymentId = Integer.parseInt(request.getParameter("paymentId"));
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            String studentName = request.getParameter("studentName");
            Date paymentDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("paymentDate"));
            double amount = Double.parseDouble(request.getParameter("amount"));
            String status = request.getParameter("status");

            FeePayment payment = new FeePayment(studentId, studentName, paymentDate, amount, status);
            payment.setPaymentId(paymentId);
            feePaymentDAO.updatePayment(payment);
            response.sendRedirect("displayPayments");
        } catch (ParseException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("feepaymentupdate.jsp?error=1");
        }
    }
}