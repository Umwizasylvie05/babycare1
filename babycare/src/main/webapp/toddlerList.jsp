<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Toddler List - Baby Care Management System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Include the same styles from your dashboard page */
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
        .footer {
            background: #333;
            color: #fff;
            text-align: center;
            padding: 1rem 0;
            position: fixed;
            bottom: 0;
            width: calc(100% - 250px);
            margin-left: 250px;
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
        <a href="toddlerList.jsp"><i class="fas fa-baby"></i> Toddler</a>
        <a href="generateReport.jsp#reports"><i class="fas fa-file-alt"></i> Reports</a>
        <a href="setting.jsp#settings"><i class="fas fa-cog"></i> Settings</a>
        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Log Out</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="dashboard-header">
            <h1>Toddler List</h1>
        </div>

        <div class="container">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Parent Contact</th>
                        <th>Health Notes</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/babycare", "root", "");
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery("SELECT * FROM toddlers");

                            while(rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("toddler_id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getInt("age") %></td>
                        <td><%= rs.getString("parent_contact") %></td>
                        <td><%= rs.getString("health_notes") %></td>
                        <td>
                            <a href="viewToddler.jsp?toddler_id=<%= rs.getInt("toddler_id") %>" class="btn btn-info">View</a>
                            <a href="editToddler.jsp?toddler_id=<%= rs.getInt("toddler_id") %>" class="btn btn-warning">Edit</a>
                            <a href="deleteToddlerServlet?toddler_id=<%= rs.getInt("toddler_id") %>" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                    <%
                            }
                        } catch(Exception e) {
                            e.printStackTrace();
                        } finally {
                            if(rs != null) rs.close();
                            if(stmt != null) stmt.close();
                            if(conn != null) conn.close();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 BabyCare. All rights reserved.</p>
    </footer>

</body>
</html>
