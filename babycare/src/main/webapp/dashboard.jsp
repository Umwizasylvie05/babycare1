<%@ page import="java.sql.*" %>
<%
        if (session.getAttribute("username") == null) {
            response.sendRedirect("home.jsp");
            return;
        }
    %>
<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/babycare";
    String jdbcUser = "root";
    String jdbcPass = "";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    int userCount = 0;
    int babyCount = 0;
    int contactCount = 0;

    try {
        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Establish Connection
        conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPass);
        
        // Create Statement
        stmt = conn.createStatement();

        // Count Users
        String sqlUsers = "SELECT COUNT(*) AS user_count FROM users";
        rs = stmt.executeQuery(sqlUsers);
        if (rs.next()) {
            userCount = rs.getInt("user_count");
        }

        // Count Babies
        String sqlBabies = "SELECT COUNT(*) AS baby_count FROM infant_care_services";
        rs = stmt.executeQuery(sqlBabies);
        if (rs.next()) {
            babyCount = rs.getInt("baby_count");
        }

        // Count Contacts
        String sqlContacts = "SELECT COUNT(*) AS contact_count FROM contact-form";
        rs = stmt.executeQuery(sqlContacts);
        if (rs.next()) {
            contactCount = rs.getInt("contact_count");
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources
        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Baby Care Management System</title>
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
        .card {
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border: none;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .card-body {
            padding: 20px;
        }
        .card-title {
            font-size: 18px;
            margin-bottom: 10px;
            color: #343a40;
        }
        .card-text {
            font-size: 24px;
            color: #666;
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
        .btn-primary {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn-primary:hover {
            background-color: #004494;
            border-color: #004494;
        }
        .no-text-decoration {
            text-decoration: none;
            color: white; /* Ensures the link text color matches the button */
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
        <a href="generateReport.jsp#reports"><i class="fas fa-file-alt"></i> Reports</a>
        <a href="setting.jsp#settings"><i class="fas fa-cog"></i> Settings</a>
        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Log Out</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="dashboard-header">
            <h1>Welcome, Admin</h1>
        </div>

        <!-- Overview Section -->
        <section id="overview">
            <h2>Overview</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Total Users</h5>
                            <p class="card-text"><%= userCount %></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Total Babies</h5>
                            <p class="card-text"><%= babyCount %></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Total Contacts</h5>
                            <p class="card-text"><%= contactCount %></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Manage Users Section -->
        <section id="manage-users">
            <h2>Manage Users</h2>
            <button class="btn btn-primary"><a href="manageUsers.jsp" class="no-text-decoration">View All Users</a></button>
        </section>

        <!-- Manage Babies Section -->
        <section id="manage-babies">
            <h2>Manage Babies</h2>
            <button class="btn btn-primary"><a href="manageBabies.jsp" class="no-text-decoration">View All Babies</a></button>
        </section>

        <!-- Reports Section -->
        <section id="reports">
            <h2>Reports</h2>
            <button class="btn btn-primary"><a href="generateReport.jsp" class="no-text-decoration">Generate Report</a></button>
        </section>

        <!-- Settings Section -->
        <section id="settings">
            <h2>Settings</h2>
            <button class="btn btn-primary"><a href="setting.jsp" class="no-text-decoration">Update Settings</a></button>
        </section>
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
