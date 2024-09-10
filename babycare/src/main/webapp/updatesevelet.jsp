<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #000;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .success-message {
            color: #4CAF50;
            font-size: 18px;
            text-align: center;
        }

        .error-message {
            color: #f00;
            font-size: 18px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update User</h2>
        <%
            String jdbcURL = "jdbc:mysql://localhost:3306/babycare?serverTimezone=UTC";
            String dbUser = "root";
            String dbPassword = "";
            Connection conn = null;
            PreparedStatement statement = null;
            String user_id = request.getParameter("user_id");
            String username = request.getParameter("username");
            String role = request.getParameter("role");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String created_at = request.getParameter("created_at");
            String password = request.getParameter("password");
           

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                
                String sql = "UPDATE users SET username=?, role=?, email=?, phone=?, created_at=?, password=? WHERE user_id=?";
                statement = conn.prepareStatement(sql);
                statement.setString(1, username);
                statement.setString(2, role);
                statement.setString(3, email);
                statement.setString(4, phone);
                statement.setString(5, created_at);
                statement.setString(6, password);
                
                statement.setInt(7, Integer.parseInt(user_id));
                
                int rowsUpdated = statement.executeUpdate();
                if (rowsUpdated > 0) {
                	response.sendRedirect("displayinsert.jsp?message=User+updated+successfully");
                } else {
                    out.println("<div class='error-message'>Failed to update user.</div>");
                }
            } catch (SQLException | ClassNotFoundException e) {
                out.println("<div class='error-message'>An error occurred: " + e.getMessage() + "</div>");
                e.printStackTrace();
            } finally {
                if (statement != null) {
                    try {
                        statement.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </div>
    
</body>
</html>