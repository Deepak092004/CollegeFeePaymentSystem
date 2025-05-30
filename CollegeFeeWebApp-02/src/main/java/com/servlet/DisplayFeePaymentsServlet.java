package com.servlet;

import com.dao.FeePaymentDAO;
import com.model.FeePayment;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/displayPayments")
public class DisplayFeePaymentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FeePaymentDAO feePaymentDAO;

    public void init() {
        feePaymentDAO = new FeePaymentDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<FeePayment> payments = feePaymentDAO.selectAllPayments();
            request.setAttribute("payments", payments);
            RequestDispatcher dispatcher = request.getRequestDispatcher("feepaymentdisplay.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=1");
        }
    }
}