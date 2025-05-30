package com.servlet;

import com.dao.FeePaymentDAO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteFeePayment")
public class DeleteFeePaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FeePaymentDAO feePaymentDAO;

    public void init() {
        feePaymentDAO = new FeePaymentDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int paymentId = Integer.parseInt(request.getParameter("paymentId"));
            feePaymentDAO.deletePayment(paymentId);
            response.sendRedirect("displayPayments");
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("deletepayment.jsp?error=1");
        }
    }
}
