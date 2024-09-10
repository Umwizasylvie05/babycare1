<%@ page import="java.io.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*, java.sql.*" %>
<%
    // Set the response headers
    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition", "attachment;filename=UsersData.pdf");

    // Create a Document object
    Document document = new Document();
    PdfWriter.getInstance(document, response.getOutputStream());

    document.open();

    // Add title to the document
    document.add(new Paragraph("Users Data"));
    document.add(new Paragraph(" "));
    
    // Create a table in the PDF document
    PdfPTable table = new PdfPTable(4);
    table.addCell("ID");
    table.addCell("Name");
    table.addCell("Email");
    table.addCell("Role");

    // Database connection
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/babycare", "root", "");
        stmt = conn.createStatement();
        String sql = "SELECT user_id, username, email, role FROM users";
        rs = stmt.executeQuery(sql);

        // Loop through the result set and add each row to the table
        while (rs.next()) {
            table.addCell(Integer.toString(rs.getInt("user_id")));
            table.addCell(rs.getString("username"));
            table.addCell(rs.getString("email"));
            table.addCell(rs.getString("role"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }

    // Add the table to the document
    document.add(table);
    document.close();
%>
