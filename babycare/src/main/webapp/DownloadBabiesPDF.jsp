<%@ page import="java.sql.*" %>
<%@ page import="com.itextpdf.text.*" %>
<%@ page import="com.itextpdf.text.pdf.*" %>
<%
    // Set the content type for PDF download
    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition", "attachment;filename=babies_list.pdf");

    Document document = new Document();
    try {
        PdfWriter.getInstance(document, response.getOutputStream());
        document.open();

        // Add title to the PDF
        document.add(new Paragraph("Babies List"));
        document.add(new Paragraph(" ")); // Add an empty line

        // Create a table with 7 columns (for each data field)
        PdfPTable table = new PdfPTable(7);
        table.setWidthPercentage(100);

        // Add table headers
        table.addCell("ID");
        table.addCell("Name");
        table.addCell("DOB");
        table.addCell("Gender");
        table.addCell("Parent Name");
        table.addCell("Contact Number");
        table.addCell("Email");

        // Database connection and data retrieval
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/babycare", "root", "");
            stmt = conn.createStatement();
            String sql = "SELECT id, infant_name, dob, gender, parent_name, contact_number, email FROM infant_care_services";
            rs = stmt.executeQuery(sql);

            // Loop through the result set and add data to the table
            while (rs.next()) {
                table.addCell(String.valueOf(rs.getInt("id")));
                table.addCell(rs.getString("infant_name"));
                table.addCell(rs.getString("dob"));
                table.addCell(rs.getString("gender"));
                table.addCell(rs.getString("parent_name"));
                table.addCell(rs.getString("contact_number"));
                table.addCell(rs.getString("email"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }

        // Add the table to the PDF document
        document.add(table);
        document.close();

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (document.isOpen()) {
            document.close();
        }
    }
%>
