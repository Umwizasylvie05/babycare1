<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // Obtain the session without creating a new one
    HttpSession Session = request.getSession(false);
    
    // Check if the session exists
    if (session == null) {
        out.println("<p>No active session found. Please log in again.</p>");
        return;
    }

    // Retrieve username from the session
    String username = (String) session.getAttribute("username");
    
    // Check if the username exists in the session
    if (username == null) {
        out.println("<p>Username not found in session. Please log in again.</p>");
        return;
    }

    // Retrieve form parameters
    String newEmail = request.getParameter("email");
    boolean notifications = Boolean.parseBoolean(request.getParameter("notifications"));

    // Database connection parameters
    String jdbcUrl = "jdbc:mysql://localhost:3306/babycare";
    String jdbcUser = "root";
    String jdbcPass = "";

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Load MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        // Establish the database connection
        conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPass);

        // SQL query to update admin settings
        String sql = "UPDATE admin SET email = ?, notifications = ? WHERE username = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, newEmail);
        stmt.setBoolean(2, notifications);
        stmt.setString(3, username);

        // Execute the update
        int rowsAffected = stmt.executeUpdate();
        if (rowsAffected > 0) {
            out.println("<p>Profile updated successfully!</p>");
        } else {
            out.println("<p>Failed to update profile.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error occurred: " + e.getMessage() + "</p>");
    } finally {
        // Close database resources
        try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
<a href="setting.jsp">Back to Settings</a>
