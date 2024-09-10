<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration Process</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Internal CSS -->
    <style>
        /* Add any custom styling here */
    </style>
</head>
<body>
    <% 
    String username = request.getParameter("username");
    String role = request.getParameter("role");  // Include this line
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String created_at = request.getParameter("time");
    String password = request.getParameter("password");

    Connection con = null;
    PreparedStatement pst = null;

    try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/babycare?serverTimezone=UTC", "root", "");

        // SQL query to insert user data
        String sql = "INSERT INTO users (username, role, email, phone, created_at, password) VALUES (?, ?, ?, ?, ?, ?)";
        pst = con.prepareStatement(sql);
        pst.setString(1, username);
        pst.setString(2, role);  // Include this line
        pst.setString(3, email);
        pst.setString(4, phone);
        pst.setString(5, created_at);
        pst.setString(6, password);

        // Execute the query
        int rowsAffected = pst.executeUpdate();

        if (rowsAffected > 0) {
            // Redirect to home.jsp on successful registration
            response.sendRedirect("home.jsp");
        } else {
    %>
            <div class="alert alert-danger" role="alert">
                Registration failed. Please try again later.
            </div>
    <% 
        }
    } catch (ClassNotFoundException | SQLException e) {
        getServletContext().log("An error occurred during the registration process", e);
    %>
        <div class="alert alert-danger" role="alert">
            Error: <%= e.getMessage() %>
        </div>
    <% 
    } finally {
        try {
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            getServletContext().log("An error occurred while closing resources", e);
        }
    }
    %>
</body>
</html>
