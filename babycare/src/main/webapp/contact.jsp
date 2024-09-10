<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - BabyCare Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        nav img {
            width: 100px;
            height: 100px;
        }

        .navbar {
            background-color: #343a40;
            padding: 15px 20px;
        }

        .navbar .nav-link {
            color: #fff !important;
            font-weight: 500;
            margin-right: 20px;
        }

        .navbar .nav-link:hover {
            color: #f8f9fa !important;
            background-color: #495057;
            border-radius: 5px;
        }
        
        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            margin-top: 20px; /* Adds space above the heading */
        }
        .contact-info p {
            line-height: 1.6;
            margin-bottom: 15px;
        }
        .contact-form {
            margin-top: 20px;
        }
        .contact-form label {
            display: block;
            margin-bottom: 10px;
        }
        .contact-form input[type="text"],
        .contact-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: vertical;
        }
        .contact-form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
        .contact-form input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<%
        if (session.getAttribute("username") == null) {
            response.sendRedirect("home.jsp");
            return;
        }
    %>
<nav class="navbar navbar-expand-lg navbar-dark">
    <img src="lg.jpeg" alt="Logo">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link" href="index.jsp#home">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="about.jsp#about">About Us</a></li>
            <li class="nav-item"><a class="nav-link" href="services.jsp#services">Services</a></li>
            <li class="nav-item"><a class="nav-link" href="contact.jsp#contact us">Contact Us</a></li>
            <li class="nav-item"><a class="nav-link" href="home.jsp#login">LogOut</a></li>
        </ul>
    </div>
</nav>
    <div class="container">
        <h2>Contact Us - BabyCare Management System</h2>
        <div class="content">
            <div class="contact-info">
                <p><i class="fas fa-envelope"></i> Have questions or need assistance? Reach out to us!</p>
                <p><i class="fas fa-envelope"></i> Email: info@babycaresystem.com</p>
                <p><i class="fas fa-phone"></i> Phone: +250-784-108-487</p>
                <p><i class="fas fa-map-marker-alt"></i> Address: 123 Baby Avenue, Cityville, State, Country</p>
            </div>
            <div class="contact-form">
                <form action="submitcontactform.jsp" method="POST">
                    <div class="form-group">
                        <label for="name"><i class="fas fa-user"></i> Name:</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="email"><i class="fas fa-envelope"></i> Email:</label>
                        <input type="text" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="message"><i class="fas fa-comment-dots"></i> Message:</label>
                        <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-success"><i class="fas fa-paper-plane"></i> Submit</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>