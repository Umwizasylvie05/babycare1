<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String driver = "com.mysql.cj.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/babycare?serverTimezone=UTC";
  
    String userid = "root";
    String password = "";

    int user_id = Integer.parseInt(request.getParameter("user_id"));
    String username = "username";
    String role = "role";
    String email = "email";
    String phone = "phone";
    String created_at = "created_at";
   

    try {
        Class.forName(driver);
        Connection connection = DriverManager.getConnection(connectionUrl, userid, password);
        String sql = "SELECT * FROM users WHERE user_id = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, user_id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            username = rs.getString("username");
            role = rs.getString("role");
            email = rs.getString("email");
            phone = rs.getString("phone");
            created_at = rs.getString("created_at");
            password = rs.getString("password");
        }

        connection.close();
    } catch (Exception e) {
        out.println("Database connection error: " + e.getMessage());
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update BabyCare Registration</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="text-center">Update BabyCare Registration</h1>
        <form action="updatesevelet.jsp" method="post">
            <input type="hidden" name="user_id" value="<%= user_id %>">
            <div class="form-group">
                <label for="username">User Name</label>
                <input type="text" class="form-control" id="name" name="username" value="<%= username %>" required>
            </div>
            <div class="form-group">
                <label for="role">Role</label>
                <input type="text" class="form-control" id="role" name="role" value="<%= role %>" required>
            </div>
            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="number" class="form-control" id="phone" name="phone" value="<%= phone %>" required>
            </div>
            <div class="form-group">
                <label for="created_at">Created At</label>
                <input type="date" class="form-control" id="created_at" name="created_at" value="<%= created_at %>" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" value="<%= password %>" required>
            </div>
            <button type="submit" class="btn btn-success">Update</button>
        </form>
    </div>
</body>
</html>