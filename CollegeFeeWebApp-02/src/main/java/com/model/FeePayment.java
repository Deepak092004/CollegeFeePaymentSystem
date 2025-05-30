package com.model;

import java.util.Date;

public class FeePayment {
    private int paymentId;
    private int studentId;
    private String studentName;
    private Date paymentDate;
    private double amount;
    private String status;

    // Constructors
    public FeePayment() {
    }

    public FeePayment(int studentId, String studentName, Date paymentDate, double amount, String status) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.paymentDate = paymentDate;
        this.amount = amount;
        this.status = status;
    }

    // Getters and Setters
    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}