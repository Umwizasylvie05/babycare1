<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User - Admin Dashboard</title>
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
        <h1 class="text-center">Update User</h1>
        
        <%
            String message = "";
            String username = "";
            String email = "";
            String role = "";
            int user_id = -1;

            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                // Check if user_id parameter is present
                String userIdStr = request.getParameter("user_id");
                
                if (userIdStr == null || userIdStr.trim().isEmpty()) {
                    message = "User ID is missing or invalid.";
                } else {
                    // Parse user_id
                    user_id = Integer.parseInt(userIdStr);

                    // Load the JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish the database connection
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/babycare", "root", "");

                    // Fetch current user details to pre-populate the form
                    String selectSQL = "SELECT username, email, role FROM users WHERE user_id=?";
                    stmt = conn.prepareStatement(selectSQL);
                    stmt.setInt(1, user_id);
                    rs = stmt.executeQuery();

                    if (rs.next()) {
                        username = rs.getString("username");
                        email = rs.getString("email");
                        role = rs.getString("role");
                    } else {
                        message = "User not found.";
                    }
                }

            } catch (NumberFormatException e) {
                message = "Invalid user ID format.";
            } catch (Exception e) {
                e.printStackTrace();
                message = "Error: " + e.getMessage();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        %>

        <%
            if (!message.isEmpty()) {
        %>
            <div class="alert alert-danger text-center">
                <%= message %>
            </div>
        <%
            } else {
        %>
            <form action="editUser.jsp" method="post">
                <input type="hidden" name="user_id" value="<%= user_id %>" />
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" class="form-control" id="username" name="username" required value="<%= username %>">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" required value="<%= email %>">
                </div>
                <div class="form-group">
                    <label for="role">Role:</label>
                    <input type="text" class="form-control" id="role" name="role" required value="<%= role %>">
                </div>
                <div class="form-group">
                    <label for="password">Password (Leave blank to keep current):</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>
                <button type="submit" class="btn btn-primary">Update User</button>
            </form>
        <%
            }
        %>

        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                try {
                    // Get form parameters
                    username = request.getParameter("username");
                    email = request.getParameter("email");
                    role = request.getParameter("role");
                    String password = request.getParameter("password");

                    // Check if essential parameters are present
                    if (username == null || username.trim().isEmpty() ||
                        email == null || email.trim().isEmpty() ||
                        role == null || role.trim().isEmpty()) {
                        message = "Username, email, and role are required.";
                    } else {
                        // Establish the database connection again
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/babycare", "root", "");

                        // Prepare SQL update statement
                        StringBuilder sql = new StringBuilder("UPDATE users SET username=?, email=?, role=?");
                        if (password != null && !password.trim().isEmpty()) {
                            sql.append(", password=?");
                        }
                        sql.append(" WHERE user_id=?");

                        stmt = conn.prepareStatement(sql.toString());
                        stmt.setString(1, username);
                        stmt.setString(2, email);
                        stmt.setString(3, role);

                        if (password != null && !password.trim().isEmpty()) {
                            stmt.setString(4, password); // Adjust index
                            stmt.setInt(5, user_id);
                        } else {
                            stmt.setInt(4, user_id);
                        }

                        int rowsUpdated = stmt.executeUpdate();

                        if (rowsUpdated > 0) {
                            message = "User updated successfully.";
                        } else {
                            message = "User update failed.";
                        }
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
        <%
            }
        %>

        <div class="text-center">
            <a href="manageUsers.jsp" class="btn btn-primary">Back to User Management</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
