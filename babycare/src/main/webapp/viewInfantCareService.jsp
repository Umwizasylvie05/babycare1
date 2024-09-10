<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Infant Care Service - Baby Care Management System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .container {
            margin-top: 50px;
        }
        .table {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Infant Care Service Details</h2>
        <%
            String idParam = request.getParameter("id");
            if (idParam == null || idParam.isEmpty()) {
                out.println("<div class='alert alert-danger'>No ID provided.</div>");
            } else {
                try {
                    int id = Integer.parseInt(idParam);
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/babycare", "root", "");
                        String sql = "SELECT * FROM infant_care_services WHERE id = ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setInt(1, id);
                        rs = pstmt.executeQuery();

                        if (rs.next()) {
                            String infantName = rs.getString("infant_name");
                            Date dob = rs.getDate("dob");
                            String gender = rs.getString("gender");
                            String parentName = rs.getString("parent_name");
                            String contactNumber = rs.getString("contact_number");
                            String email = rs.getString("email");
                            double weight = rs.getDouble("weight");
                            double height = rs.getDouble("height");
                            String allergies = rs.getString("allergies");
                            String medicalConditions = rs.getString("medical_conditions");
                            String serviceType = rs.getString("service_type");
                            Date serviceDate = rs.getDate("service_date");
                            Time preferredTime = rs.getTime("preferred_time");
                            String specialInstructions = rs.getString("special_instructions");
        %>
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <th>ID</th>
                    <td><%= id %></td>
                </tr>
                <tr>
                    <th>Infant Name</th>
                    <td><%= infantName %></td>
                </tr>
                <tr>
                    <th>Date of Birth</th>
                    <td><%= dob %></td>
                </tr>
                <tr>
                    <th>Gender</th>
                    <td><%= gender %></td>
                </tr>
                <tr>
                    <th>Parent Name</th>
                    <td><%= parentName %></td>
                </tr>
                <tr>
                    <th>Contact Number</th>
                    <td><%= contactNumber %></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><%= email %></td>
                </tr>
                <tr>
                    <th>Weight (kg)</th>
                    <td><%= weight %></td>
                </tr>
                <tr>
                    <th>Height (cm)</th>
                    <td><%= height %></td>
                </tr>
                <tr>
                    <th>Allergies</th>
                    <td><%= allergies %></td>
                </tr>
                <tr>
                    <th>Medical Conditions</th>
                    <td><%= medicalConditions %></td>
                </tr>
                <tr>
                    <th>Service Type</th>
                    <td><%= serviceType %></td>
                </tr>
                <tr>
                    <th>Service Date</th>
                    <td><%= serviceDate %></td>
                </tr>
                <tr>
                    <th>Preferred Time</th>
                    <td><%= preferredTime %></td>
                </tr>
                <tr>
                    <th>Special Instructions</th>
                    <td><%= specialInstructions %></td>
                </tr>
            </tbody>
        </table>
        <a href="manageBabies.jsp" class="btn btn-secondary">Back to List</a>
        <%
                        } else {
                            out.println("<div class='alert alert-danger'>No record found for ID: " + id + "</div>");
                        }
                    } catch (SQLException e) {
                        log("SQL Error: " + e.getMessage(), e);
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { log("Error closing ResultSet", e); }
                        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { log("Error closing PreparedStatement", e); }
                        if (conn != null) try { conn.close(); } catch (SQLException e) { log("Error closing Connection", e); }
                    }
                } catch (NumberFormatException e) {
                    out.println("<div class='alert alert-danger'>Invalid ID format.</div>");
                }
            }
        %>
    </div>
</body>
</html>
