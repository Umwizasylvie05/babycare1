<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users - Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
        }
        .sidebar {
            width: 250px;
            background-color: #343a40;
            padding: 20px;
            color: #fff;
            position: fixed;
            height: 100%;
        }
        .sidebar h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .sidebar a {
            color: #fff;
            display: block;
            padding: 10px;
            text-decoration: none;
            margin-bottom: 10px;
            border-radius: 4px;
        }
        .sidebar a:hover {
            background-color: #495057;
            text-decoration: none;
        }
        .main-content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
            background-color: #fff;
        }
        .dashboard-header {
            background-color: #45786e;
            color: #fff;
            padding: 15px 20px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .table-responsive {
            margin-top: 20px;
        }
        .footer {
            background: #333;
            color: #fff;
            text-align: center;
            padding: 1rem 0;
            position: fixed;
            bottom: 0;
            width: 100%;
            margin-left: 250px;
        }
        .btn-primary {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn-primary:hover {
            background-color: #004494;
            border-color: #004494;
        }
        .btn-danger {
            background-color: #d9534f;
            border-color: #d43f3a;
        }
        .btn-danger:hover {
            background-color: #c9302c;
            border-color: #ac2925;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Dashboard</h2>
        <a href="dashboard.jsp#overview"><i class="fas fa-tachometer-alt"></i> Overview</a>
        <a href="manageUsers.jsp#manage-users"><i class="fas fa-users"></i> Manage Users</a>
        <a href="manageBabies.jsp"><i class="fas fa-baby"></i> Manage Babies</a>
        <a href="generateReport.jsp"><i class="fas fa-file-alt"></i> Reports</a>
        <a href="setting.jsp"><i class="fas fa-cog"></i> Settings</a>
        <a href="home.jsp"><i class="fas fa-sign-out-alt"></i> Log Out</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
    
        <div class="dashboard-header">
            <h1>Manage Users</h1>
            <p>Here you can view and manage all registered users.</p>
        </div>
          
        <!-- Search Bar -->
        <input type="text" id="searchInput" class="form-control mb-3" placeholder="Search users...">
          
        <!-- Button to Add User -->
        <a href="addUser.jsp" class="btn btn-primary">Add New User</a>
        <a href="DownloadUser.jsp" class="btn btn-primary">Download Users Data (PDF)</a>
        
        <!-- User List Table -->
        <table class="table table-bordered">
            <thead>        
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="userTableBody">
                <% 
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/babycare", "root", "");
                        stmt = conn.createStatement();
                        String sql = "SELECT * FROM users";
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            int user_id = rs.getInt("user_id");
                            String username = rs.getString("username");
                            String email = rs.getString("email");
                            String role = rs.getString("role");
                %>
                <tr>
                    <td><%= user_id %></td>
                    <td><%= username %></td>
                    <td><%= email %></td>
                    <td><%= role %></td>
                    <td>
                        <a href="editUser.jsp?user_id=<%= user_id %>" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i>Edit</a>
                        <a href="deleteUser.jsp?user_id=<%= user_id %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this user?');"><i class="fas fa-trash-alt"></i>Delete</a>
                    </td>
                </tr>
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
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
            </tbody>
        </table>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 BabyCare. All rights reserved.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <!-- JavaScript for Search Functionality -->
    <script>
        document.getElementById('searchInput').addEventListener('keyup', function() {
            var input = this.value.toLowerCase();
            var rows = document.querySelectorAll('#userTableBody tr');

            rows.forEach(function(row) {
                var userName = row.cells[1].textContent.toLowerCase();
                var userEmail = row.cells[2].textContent.toLowerCase();
                var userRole = row.cells[3].textContent.toLowerCase();
                
                if (userName.indexOf(input) > -1 || userEmail.indexOf(input) > -1 || userRole.indexOf(input) > -1) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    </script>
</body>
</html>
