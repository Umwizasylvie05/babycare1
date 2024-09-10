<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Review Your Information</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
</head>
<body>
    <h1>Review Your Information</h1>
    <form action="InfantServlet" method="post">
        <p><strong>Infant Name:</strong> <%= request.getAttribute("infantName") %></p>
        <p><strong>Date of Birth:</strong> <%= request.getAttribute("dob") %></p>
        <p><strong>Gender:</strong> <%= request.getAttribute("gender") %></p>
        <p><strong>Parent Name:</strong> <%= request.getAttribute("parentName") %></p>
        <p><strong>Contact Number:</strong> <%= request.getAttribute("contactNumber") %></p>
        <p><strong>Email:</strong> <%= request.getAttribute("email") %></p>
        <p><strong>Weight:</strong> <%= request.getAttribute("weight") %></p>
        <p><strong>Height:</strong> <%= request.getAttribute("height") %></p>
        <p><strong>Allergies:</strong> <%= request.getAttribute("allergies") %></p>
        <p><strong>Medical Conditions:</strong> <%= request.getAttribute("medicalConditions") %></p>
        <p><strong>Service Type:</strong> <%= request.getAttribute("serviceType") %></p>
        <p><strong>Service Date:</strong> <%= request.getAttribute("serviceDate") %></p>
        <p><strong>Preferred Time:</strong> <%= request.getAttribute("preferredTime") %></p>
        <p><strong>Special Instructions:</strong> <%= request.getAttribute("specialInstructions") %></p>
        
        <!-- Hidden field to handle form submission -->
        <input type="hidden" name="infantName" value="<%= request.getAttribute("infantName") %>">
        <input type="hidden" name="dob" value="<%= request.getAttribute("dob") %>">
        <input type="hidden" name="gender" value="<%= request.getAttribute("gender") %>">
        <input type="hidden" name="parentName" value="<%= request.getAttribute("parentName") %>">
        <input type="hidden" name="contactNumber" value="<%= request.getAttribute("contactNumber") %>">
        <input type="hidden" name="email" value="<%= request.getAttribute("email") %>">
        <input type="hidden" name="weight" value="<%= request.getAttribute("weight") %>">
        <input type="hidden" name="height" value="<%= request.getAttribute("height") %>">
        <input type="hidden" name="allergies" value="<%= request.getAttribute("allergies") %>">
        <input type="hidden" name="medicalConditions" value="<%= request.getAttribute("medicalConditions") %>">
        <input type="hidden" name="serviceType" value="<%= request.getAttribute("serviceType") %>">
        <input type="hidden" name="serviceDate" value="<%= request.getAttribute("serviceDate") %>">
        <input type="hidden" name="preferredTime" value="<%= request.getAttribute("preferredTime") %>">
        <input type="hidden" name="specialInstructions" value="<%= request.getAttribute("specialInstructions") %>">

        <input type="submit" name="action" value="Edit">
        <input type="submit" name="action" value="Confirm">
    </form>

    <a href="infantcare.jsp">Back to Form</a>
</body>
</html>
