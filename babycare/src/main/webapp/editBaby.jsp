<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Baby - Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Update Baby Details</h1>

        <%
            // Declare necessary variables
            String infantName = "";
            String dob = "";
            String gender = "";
            String parentName = "";
            String contactNumber = "";
            String email = "";
            String message = "";
            int baby_id = 0;

            // Check if this is a GET request (to fetch the current details)
            if (request.getMethod().equalsIgnoreCase("GET")) {
                baby_id = Integer.parseInt(request.getParameter("id"));
                try {
                    // Establish database connection
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/babycare", "root", "");

                    // Prepare SQL select statement to fetch the baby's details
                    String sql = "SELECT * FROM infant_care_services WHERE id=?";
                    PreparedStatement stmt = conn.prepareStatement(sql);
                    stmt.setInt(1, baby_id);

                    ResultSet rs = stmt.executeQuery();

                    if (rs.next()) {
                        infantName = rs.getString("infant_name");
                        dob = rs.getString("dob");
                        gender = rs.getString("gender");
                        parentName = rs.getString("parent_name");
                        contactNumber = rs.getString("contact_number");
                        email = rs.getString("email");
                    } else {
                        message = "Baby not found.";
                    }

                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    message = "Error: " + e.getMessage();
                }
            }
        %>

        <%
            if (!message.isEmpty()) {
        %>
            <div class="alert alert-danger text-center">
                <%= message %>
            </div>
        <%
            }
        %>

        <form action="editBaby.jsp" method="post">
            <input type="hidden" name="id" value="<%= baby_id %>" />
            <div class="form-group">
                <label for="infantName">Baby Name:</label>
                <input type="text" class="form-control" id="infantName" name="infant_name" required value="<%= infantName %>">
            </div>
            <div class="form-group">
                <label for="dob">Date of Birth:</label>
                <input type="date" class="form-control" id="dob" name="dob" required value="<%= dob %>">
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <select class="form-control" id="gender" name="gender" required>
                    <option value="Male" <%= gender.equals("Male") ? "selected" : "" %>>Male</option>
                    <option value="Female" <%= gender.equals("Female") ? "selected" : "" %>>Female</option>
                </select>
            </div>
            <div class="form-group">
                <label for="parentName">Parent Name:</label>
                <input type="text" class="form-control" id="parentName" name="parent_name" required value="<%= parentName %>">
            </div>
            <div class="form-group">
                <label for="contactNumber">Contact Number:</label>
                <input type="text" class="form-control" id="contactNumber" name="contact_number" required value="<%= contactNumber %>">
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required value="<%= email %>">
            </div>
            <button type="submit" class="btn btn-primary">Update Baby</button>
        </form>

        <%
            // Handle POST request to update the baby details
            if (request.getMethod().equalsIgnoreCase("POST")) {
                baby_id = Integer.parseInt(request.getParameter("id"));
                infantName = request.getParameter("infant_name");
                dob = request.getParameter("dob");
                gender = request.getParameter("gender");
                parentName = request.getParameter("parent_name");
                contactNumber = request.getParameter("contact_number");
                email = request.getParameter("email");

                if (infantName == null || infantName.trim().isEmpty() ||
                    dob == null || dob.trim().isEmpty() ||
                    gender == null || gender.trim().isEmpty() ||
                    parentName == null || parentName.trim().isEmpty() ||
                    contactNumber == null || contactNumber.trim().isEmpty() ||
                    email == null || email.trim().isEmpty()) {
                    message = "All fields are required.";
                } else {
                    try {
                        // Establish the database connection again
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/babycare", "root", "");

                        // Prepare SQL update statement
                        String sql = "UPDATE infant_care_services SET infant_name=?, dob=?, gender=?, parent_name=?, contact_number=?, email=? WHERE id=?";
                        PreparedStatement stmt = conn.prepareStatement(sql);
                        stmt.setString(1, infantName);
                        stmt.setString(2, dob);
                        stmt.setString(3, gender);
                        stmt.setString(4, parentName);
                        stmt.setString(5, contactNumber);
                        stmt.setString(6, email);
                        stmt.setInt(7, baby_id);

                        int rowsUpdated = stmt.executeUpdate();

                        if (rowsUpdated > 0) {
                            message = "Baby details updated successfully.";
                        } else {
                            message = "Baby update failed.";
                        }

                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                        message = "Error: " + e.getMessage();
                    }
                }
        %>
            <div class="alert alert-info text-center">
                <%= message %>
            </div>
        <%
            }
        %>

        <div class="text-center">
            <a href="manageBabies.jsp" class="btn btn-primary">Back to Manage Babies</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
