<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Process</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Load the database driver and establish a connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/babycare", "root", "");

        // Check credentials in the `admin` table first
        String sql = "SELECT * FROM admin WHERE username = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // Admin credentials found
            String storedPassword = rs.getString("password");
            if (password.equals(storedPassword)) {
                session.setAttribute("username", username);
                response.sendRedirect("dashboard.jsp");
            } else {
                // Password does not match
                request.setAttribute("errorMessage", "Invalid username or password.");
                request.getRequestDispatcher("home.jsp").forward(request, response);
            }
        } else {
            // Check credentials in the `users` table
            sql = "SELECT * FROM users WHERE username = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // User credentials found
                String storedPassword = rs.getString("password");
                if (password.equals(storedPassword)) {
                    session.setAttribute("username", username);
                    response.sendRedirect("index.jsp");
                } else {
                    // Password does not match
                    request.setAttribute("errorMessage", "Invalid username or password.");
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                }
            } else {
                // User not found
                request.setAttribute("errorMessage", "Username not found.");
                request.getRequestDispatcher("home.jsp").forward(request, response);
            }
        }
    } catch (Exception e) {
        // Handle any errors
        request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
        request.getRequestDispatcher("home.jsp").forward(request, response);
    } finally {
        // Close resources
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
</body>
</html>
