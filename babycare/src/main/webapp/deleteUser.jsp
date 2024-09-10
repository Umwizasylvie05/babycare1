<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete User - Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Delete User</h1>
        <%
            int user_id = Integer.parseInt(request.getParameter("user_id"));
            Connection conn = null;
            PreparedStatement stmt = null;
            String message = "";

            try {
                // Load the JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                // Establish the database connection
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/babycare", "root", "");

                // Prepare SQL delete statement
                String sql = "DELETE FROM users WHERE user_id=?";
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, user_id);

                // Execute the delete statement
                int rowsAffected = stmt.executeUpdate();
                
                if (rowsAffected > 0) {
                    message = "User deleted successfully.";
                } else {
                    message = "User not found.";
                }
            } catch (Exception e) {
                e.printStackTrace();
                message = "Error: " + e.getMessage();
            } finally {
                try {
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        %>
        <div class="alert alert-info text-center">
            <%= message %>
        </div>
        <div class="text-center">
            <a href="manageUsers.jsp" class="btn btn-primary">Back to User Management</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
