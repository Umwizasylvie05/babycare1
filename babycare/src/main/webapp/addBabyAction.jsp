<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String infantName = request.getParameter("infantName");
    String dob = request.getParameter("dob");
    String gender = request.getParameter("gender");
    String parentName = request.getParameter("parentName");
    String contactNumber = request.getParameter("contactNumber");
    String email = request.getParameter("email");

    Connection conn = null;
    PreparedStatement pstmt = null;
    String insertSQL = "INSERT INTO infant_care_services (infant_name, dob, gender, parent_name, contact_number, email) VALUES (?, ?, ?, ?, ?, ?)";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/babycare", "root", "");
        pstmt = conn.prepareStatement(insertSQL);
        pstmt.setString(1, infantName);
        pstmt.setDate(2, java.sql.Date.valueOf(dob));
        pstmt.setString(3, gender);
        pstmt.setString(4, parentName);
        pstmt.setString(5, contactNumber);
        pstmt.setString(6, email);

        int rowsAffected = pstmt.executeUpdate();
        if (rowsAffected > 0) {
            response.sendRedirect("manageBabies.jsp");
        } else {
            out.println("Error adding baby. Please try again.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
