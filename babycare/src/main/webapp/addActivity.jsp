<%@ page import="java.sql.*" %>
<%
    // Initialize variables
    String message = "";
    Connection conn = null;
    PreparedStatement stmt = null;

    // Process form submission
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String toddlerId = request.getParameter("toddlerId");
        String activityDate = request.getParameter("activityDate");
        String activityName = request.getParameter("activityName");
        String notes = request.getParameter("notes");

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish the database connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/babycare", "root", "");

            // Prepare SQL insert statement
            String sql = "INSERT INTO activities (toddler_id, activity_date, activity_name, notes) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(toddlerId));
            stmt.setDate(2, Date.valueOf(activityDate));
            stmt.setString(3, activityName);
            stmt.setString(4, notes);

            // Execute the insert statement
            stmt.executeUpdate();
            
            // Redirect to the toddlerList.jsp
            response.sendRedirect("toddlerList.jsp");
            return; // Ensure no further code is executed after redirect
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
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Toddler Activity</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Add Toddler Activity</h1>
        <form action="addActivity.jsp" method="post">
            <div class="form-group">
                <label for="toddlerId">Toddler ID:</label>
                <input type="text" class="form-control" id="toddlerId" name="toddlerId" required>
            </div>
            <div class="form-group">
                <label for="activityDate">Activity Date:</label>
                <input type="date" class="form-control" id="activityDate" name="activityDate" required>
            </div>
            <div class="form-group">
                <label for="activityName">Activity Name:</label>
                <input type="text" class="form-control" id="activityName" name="activityName" required>
            </div>
            <div class="form-group">
                <label for="notes">Notes:</label>
                <textarea class="form-control" id="notes" name="notes"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Add Activity</button>
        </form>

        <!-- Display message after form submission -->
        <div class="mt-3">
            <p><%= message %></p>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
