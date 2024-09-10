<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String driver = "com.mysql.cj.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/babycare?serverTimezone=UTC";
  
    String userid = "root";
    String password = "";

    int user_id = Integer.parseInt(request.getParameter("user_id"));

    try {
        Class.forName(driver);
        Connection connection = DriverManager.getConnection(connectionUrl, userid, password);
        String sql = "DELETE FROM users WHERE user_id = ?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, user_id);
        int result = ps.executeUpdate();

        connection.close();

        if (result > 0) {
            out.println("<script>alert('User deleted successfully!'); window.location='displayinsert.jsp';</script>");
        } else {
            out.println("<script>alert('Error deleting user!'); window.location='displayinsert.jsp';</script>");
        }
    } catch (Exception e) {
        out.println("Database connection error: " + e.getMessage());
    }
%>