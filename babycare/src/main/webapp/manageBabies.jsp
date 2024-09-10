<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Babies - Baby Care Management System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
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
        }
        .dashboard-header {
            background-color: #45786e;
            color: #fff;
            padding: 15px 20px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .table thead th {
            background-color: #45786e;
            color: #fff;
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
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
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
        .table-responsive {
            margin-top: 20px;
        }
        .btn {
            margin-right: 5px;
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
            <h1>Manage Babies</h1>
            <p>Here you can view, add, edit, and delete baby records.</p>
        </div>

        <!-- Add Baby Button and Search Form -->
        <div class="mb-3">
            <a href="addBaby.jsp" class="btn btn-primary">Add New Baby</a>
            <a href="DownloadBabiesPDF.jsp" class="btn btn-primary">Download Users Data (PDF)</a>
            
            <!-- Search Form -->
            <form method="get" class="float-right" style="display: inline-block;">
                <input type="text" name="search" placeholder="Search by Name" class="form-control" style="display: inline-block; width: auto;">
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
        </div>

        <!-- Babies Table -->
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>DOB</th>
                        <th>Gender</th>
                        <th>Parent Name</th>
                        <th>Contact Number</th>
                        <th>Email</th>
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
                        
                        // Get search query from the form
                        String searchQuery = request.getParameter("search");
                        String sql = "SELECT id, infant_name, dob, gender, parent_name, contact_number, email FROM infant_care_services";
                        
                        // Modify the SQL query if there is a search input
                        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                            sql += " WHERE infant_name LIKE '%" + searchQuery + "%'";
                        }
                        
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String infantName = rs.getString("infant_name");
                            String dob = rs.getString("dob");
                            String gender = rs.getString("gender");
                            String parentName = rs.getString("parent_name");
                            String contactNumber = rs.getString("contact_number");
                            String email = rs.getString("email");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= infantName %></td>
                    <td><%= dob %></td>
                    <td><%= gender %></td>
                    <td><%= parentName %></td>
                    <td><%= contactNumber %></td>
                    <td><%= email %></td>
                    <td>
                        <a href="editBaby.jsp?id=<%= id %>" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i> Edit</a>
                        <a href="deleteBaby.jsp?id=<%= id %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this baby record?');"><i class="fas fa-trash-alt"></i> Delete</a>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
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

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
