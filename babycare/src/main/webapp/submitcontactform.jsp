<%@ page import="java.sql.*" %>
<%
    // Retrieve form data from the request
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");

    // Initialize the database connection and statement
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the database connection
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/babycare", "root", "");

        // Prepare the SQL insert statement
        String sql = "INSERT INTO `contact-form` (name, email, message) VALUES (?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, name);
        stmt.setString(2, email);
        stmt.setString(3, message);

        // Execute the insert statement
        stmt.executeUpdate();

        // Output a success message
        out.println("<p>Message submitted successfully!</p>");
        
        // Add a button to go back to the home page
        out.println("<button onclick=\"window.location.href='index.jsp';\">Go Back to Home</button>");
    } catch (ClassNotFoundException e) {
        // Print the stack trace and output an error message for driver issues
        e.printStackTrace();
        out.println("Database driver not found.");
    } catch (SQLException e) {
        // Print the stack trace and output an error message for SQL issues
        e.printStackTrace();
        out.println("An error occurred while submitting your message. Please try again later.");
    } catch (Exception e) {
        // Print the stack trace for any other exceptions and output a general error message
        e.printStackTrace();
        out.println("An unexpected error occurred.");
    } finally {
        // Close the statement and connection
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>
