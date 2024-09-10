<%@ page import="java.io.*, java.sql.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>
<%
    // Set the content type to application/pdf
    response.setContentType("application/pdf");
    // Set the response header to trigger download dialog
    response.setHeader("Content-Disposition", "attachment; filename=Report.pdf");

    // Define the report type and date range parameters
    String reportType = request.getParameter("reportType");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    // Create PDF document
    Document document = new Document();
    try {
        PdfWriter.getInstance(document, response.getOutputStream());
        document.open();

        // Add metadata to the PDF
        document.addTitle("Generated Report");
        document.addAuthor("BabyCare Management System");

        // Add a title to the document
        document.add(new Paragraph("Generated Report"));
        document.add(new Paragraph(""));
        if (!"services".equals(reportType)) {
            document.add(new Paragraph(""));
        }
        document.add(new Paragraph(" "));
        
        // Connect to the database
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

        // Add a table to the PDF
        PdfPTable table = new PdfPTable(4); // 4 columns
        table.addCell("ID");
        table.addCell("Name");
        table.addCell("Date");
        table.addCell("Description");

        // Add rows to the table
        while (rs.next()) {
            table.addCell(String.valueOf(rs.getInt("id")));
            table.addCell(rs.getString("name"));
            table.addCell(rs.getDate("date") != null ? rs.getDate("date").toString() : "N/A");
            table.addCell(rs.getString("description"));
        }

        // Add the table to the document
        document.add(table);
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

    // Close the document
    document.close();
%>
