<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Toddler - Baby Care Management System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Edit Toddler</h1>
        <%
            int toddlerId = Integer.parseInt(request.getParameter("toddler_id"));
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/babycare", "root", "");
                String sql = "SELECT * FROM toddlers WHERE toddler_id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, toddlerId);
                rs = pstmt.executeQuery();

                if (rs.next()) {
        %>
        <form action="updateToddlerServlet" method="post">
            <input type="hidden" name="toddler_id" value="<%= rs.getInt("toddler_id") %>">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" id="name" name="name" value="<%= rs.getString("name") %>" required>
            </div>
            <div class="form-group">
                <label for="age">Age:</label>
                <input type="number" class="form-control" id="age" name="age" value="<%= rs.getInt("age") %>" required>
            </div>
            <div class="form-group">
                <label for="parent_contact">Parent Contact:</label>
                <input type="text" class="form-control" id="parent_contact" name="parent_contact" value="<%= rs.getString("parent_contact") %>" required>
            </div>
            <div class="form-group">
                <label for="health_notes">Health Notes:</label>
                <textarea class="form-control" id="health_notes" name="health_notes" required><%= rs.getString("health_notes") %></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
        <%
                }
            } catch(Exception e) {
                e.printStackTrace();
            } finally {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            }
        %>
    </div>
</body>
</html>
