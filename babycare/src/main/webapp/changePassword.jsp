<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession Session = request.getSession();
    String username = (String) session.getAttribute("username");
    String currentPassword = request.getParameter("currentPassword");
    String newPassword = request.getParameter("newPassword");
    String confirmPassword = request.getParameter("confirmPassword");

    String jdbcUrl = "jdbc:mysql://localhost:3306/babycare";
    String jdbcUser = "root";
    String jdbcPass = "";

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    boolean passwordUpdated = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPass);

        // Check current password
        String sql = "SELECT password FROM admin WHERE username = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        rs = stmt.executeQuery();

        if (rs.next() && rs.getString("password").equals(currentPassword)) {
            // Update password if new passwords match
            if (newPassword.equals(confirmPassword)) {
                sql = "UPDATE admin SET password = ? WHERE username = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, newPassword);
                stmt.setString(2, username);

                int rowsAffected = stmt.executeUpdate();
                passwordUpdated = rowsAffected > 0;
            } else {
                out.println("<p>New passwords do not match.</p>");
            }
        } else {
            out.println("<p>Current password is incorrect.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error occurred: " + e.getMessage() + "</p>");
    } finally {
        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }

    if (passwordUpdated) {
        out.println("<p>Password changed successfully!</p>");
    }
%>
<a href="setting.jsp">Back to Settings</a>
