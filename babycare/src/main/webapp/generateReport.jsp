<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Reports - Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .sidebar {
            width: 250px;
            background-color: #343a40;
            padding: 20px;
            color: #fff;
            position: fixed;
            height: 100%;
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
        }
        .main-content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
            flex: 1;
            display: flex;
            flex-direction: column;
        }
        .report-card {
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 4px;
            padding: 20px;
            background-color: #fff;
            margin-bottom: 20px;
        }
        .report-card h5 {
            font-size: 18px;
            margin-bottom: 10px;
        }
        .btn-primary {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn-primary:hover {
            background-color: #004494;
            border-color: #004494;
        }
        table {
            width: 100%;
            margin-top: 20px;
        }
        table th, table td {
            padding: 10px;
            text-align: left;
        }
        table thead {
            background-color: #f4f4f4;
        }
        table tbody tr:nth-child(odd) {
            background-color: #e9ecef;
        }
        .footer {
            background-color: #343a40;
            color: #fff;
            text-align: center;
            padding: 10px;
            position: relative;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Dashboard</h2>
        <a href="dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Overview</a>
        <a href="manageUsers.jsp"><i class="fas fa-users"></i> Manage Users</a>
        <a href="manageBabies.jsp"><i class="fas fa-baby"></i> Manage Babies</a>
        <a href="generateReport.jsp" class="active"><i class="fas fa-file-alt"></i> Reports</a>
        <a href="setting.jsp"><i class="fas fa-cog"></i> Settings</a>
        <a href="home.jsp"><i class="fas fa-sign-out-alt"></i> Log Out</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h1>Generate Reports</h1>
        <p>Select a report type and date range to generate the report.</p>

        <!-- Report Type Selection -->
        <div class="report-card">
            <h5>Select Report Type</h5>
            <form action="generateReport.jsp" method="post">
                <div class="form-group">
                    <label for="reportType">Report Type:</label>
                    <select class="form-control" id="reportType" name="reportType" required>
                        <option value="activities">Activities Report</option>
                        <option value="infant_care_services">Infant Care Services Report</option>
                        <option value="services">Services Report</option>
                    </select>
                </div>

                <!-- Date Range Selection -->
                <div class="form-group">
                    <label for="startDate">Start Date:</label>
                    <input type="date" class="form-control" id="startDate" name="startDate" required>
                </div>
                <div class="form-group">
                    <label for="endDate">End Date:</label>
                    <input type="date" class="form-control" id="endDate" name="endDate" required>
                </div>

                <button type="submit" class="btn btn-primary">Generate Report</button>
                
            </form>
        </div>

        <!-- Report Display Section -->
        <div class="report-card">
            <h5>Generated Report</h5>
            <%
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String reportType = request.getParameter("reportType");
                    String startDate = request.getParameter("startDate");
                    String endDate = request.getParameter("endDate");

                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/babycare", "root", "");
                        String sql = "";

                        // Generate SQL query based on report type
                        if ("activities".equals(reportType)) {
                            sql = "SELECT activity_id AS id, activity_name AS name, activity_date AS date, notes AS description FROM activities WHERE activity_date BETWEEN ? AND ?";
                        } else if ("infant_care_services".equals(reportType)) {
                            sql = "SELECT id, infant_name AS name, service_date AS date, special_instructions AS description FROM infant_care_services WHERE service_date BETWEEN ? AND ?";
                        } else if ("services".equals(reportType)) {
                            sql = "SELECT id, service_name AS name, category AS description FROM services";
                        }

                        stmt = conn.prepareStatement(sql);
                        if (!"services".equals(reportType)) {
                            stmt.setString(1, startDate);
                            stmt.setString(2, endDate);
                        }
                        rs = stmt.executeQuery();

                        // Display report data
                        if (rs != null && rs.isBeforeFirst()) {
                            %>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Date</th>
                                        <th>Description</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    while (rs.next()) {
                                        %>
                                        <tr>
                                            <td><%= rs.getInt("id") %></td>
                                            <td><%= rs.getString("name") %></td>
                                            <td><%= rs.getDate("date") != null ? rs.getDate("date") : "N/A" %></td>
                                            <td><%= rs.getString("description") %></td>
                                        </tr>
                                        <%
                                    }
                                    %>
                                </tbody>
                            </table>
                            <%
                        } else {
                            %>
                            <p>No records found for the selected date range.</p>
                            <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("Error: " + e.getMessage());
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException se) {
                            se.printStackTrace();
                        }
                    }
                }
            %>
        </div>
    </div>

    <!-- Footer -->


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <footer class="footer">
        <p>&copy; 2024 BabyCare. All rights reserved.</p>
    </footer>
</body>
</html>
