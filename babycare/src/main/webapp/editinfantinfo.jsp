<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Your Information</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
</head>
<body>
    <h1>Edit Your Information</h1>
    <form action="InfantServlet" method="post">
        <label for="infantName">Infant Name:</label>
        <input type="text" id="infantName" name="infantName" value="<%= request.getAttribute("infantName") %>" required><br><br>

        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob" value="<%= request.getAttribute("dob") %>" required><br><br>

        <label for="gender">Gender:</label>
        <select id="gender" name="gender" required>
            <option value="Male" <%= "Male".equals(request.getAttribute("gender")) ? "selected" : "" %>>Male</option>
            <option value="Female" <%= "Female".equals(request.getAttribute("gender")) ? "selected" : "" %>>Female</option>
            <option value="Other" <%= "Other".equals(request.getAttribute("gender")) ? "selected" : "" %>>Other</option>
        </select><br><br>

        <label for="parentName">Parent Name:</label>
        <input type="text" id="parentName" name="parentName" value="<%= request.getAttribute("parentName") %>" required><br><br>

        <label for="contactNumber">Contact Number:</label>
        <input type="text" id="contactNumber" name="contactNumber" value="<%= request.getAttribute("contactNumber") %>" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= request.getAttribute("email") %>" required><br><br>

        <label for="weight">Weight:</label>
        <input type="text" id="weight" name="weight" value="<%= request.getAttribute("weight") %>" required><br><br>

        <label for="height">Height:</label>
        <input type="text" id="height" name="height" value="<%= request.getAttribute("height") %>" required><br><br>

        <label for="allergies">Allergies:</label>
        <input type="text" id="allergies" name="allergies" value="<%= request.getAttribute("allergies") %>"><br><br>

        <label for="medicalConditions">Medical Conditions:</label>
        <input type="text" id="medicalConditions" name="medicalConditions" value="<%= request.getAttribute("medicalConditions") %>"><br><br>

        <label for="serviceType">Service Type:</label>
        <input type="text" id="serviceType" name="serviceType" value="<%= request.getAttribute("serviceType") %>" required><br><br>

        <label for="serviceDate">Service Date:</label>
        <input type="date" id="serviceDate" name="serviceDate" value="<%= request.getAttribute("serviceDate") %>" required><br><br>

        <label for="preferredTime">Preferred Time:</label>
        <input type="time" id="preferredTime" name="preferredTime" value="<%= request.getAttribute("preferredTime") %>" required><br><br>

        <label for="specialInstructions">Special Instructions:</label>
        <textarea id="specialInstructions" name="specialInstructions"><%= request.getAttribute("specialInstructions") %></textarea><br><br>

        <!-- Hidden field to handle form submission -->
        <input type="hidden" name="action" value="Confirm">

        <input type="submit" value="Confirm">
    </form>

    <a href="reviewinfant.jsp">Back to Review Page</a>
</body>
</html>
