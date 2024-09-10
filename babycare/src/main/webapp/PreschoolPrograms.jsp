<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Preschool Programs - Baby Care Management System</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            padding-top: 70px;
        }

        nav img {
            width: 90px;
            height: 90px;
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
            color: #ff6f61 !important;
        }

        .content-section {
            padding: 50px 15px;
            background-color: #fff;
            border-radius: 10px;
            margin-bottom: 30px;
        }

        .content-section h2 {
            font-size: 28px;
            color: #343a40;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .content-section p {
            font-size: 16px;
            color: #666;
            margin-bottom: 15px;
            line-height: 1.6;
        }

        .content-section ul {
            font-size: 16px;
            color: #666;
            line-height: 1.6;
            list-style-type: disc;
            padding-left: 20px;
        }

        .content-section ul li {
            margin-bottom: 10px;
        }

        footer {
            background-color: #343a40;
            color: #fff;
            padding: 15px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
        }

        footer p {
            margin: 0;
            font-size: 16px;
        }

        @media (max-width: 768px) {
            .content-section h2 {
                font-size: 24px;
            }

            .content-section p, .content-section ul {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <img src="lg.jpeg" alt="Logo">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="index.jsp">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="about.jsp">About Us</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="services.jsp">Services <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="contact.jsp">Contact Us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="home.jsp">LogOut</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Preschool Programs Content -->
<div class="container my-5">
    <div class="content-section">
        <h2 class="text-center">Preschool Programs</h2>
        <p>
            Our Preschool Programs are designed to provide a nurturing and stimulating environment that fosters early learning, social skills, and physical development. We aim to ensure that children are well-prepared for kindergarten by offering a curriculum that covers essential areas of growth.
        </p>
        <h4>Key Features:</h4>
        <ul>
            <li>Structured Learning Activities: Our programs include a variety of activities that promote cognitive, emotional, and social development.</li>
            <li>Experienced Educators: Our educators are trained professionals who are passionate about early childhood education and are dedicated to each child’s success.</li>
            <li>Interactive Play: We incorporate play-based learning methods to make learning fun and engaging for young children.</li>
            <li>Safe Environment: Safety is our top priority. We maintain a secure environment where children can explore and learn with confidence.</li>
            <li>Parent Involvement: We believe in a collaborative approach and encourage parents to be actively involved in their child’s education and development.</li>
        </ul>
        <p>
            Our Preschool Programs focus on building a strong foundation for future learning, ensuring that each child develops the necessary skills and confidence to succeed in their academic journey.
        </p>
        <p>
            For more information or to enroll your child in our Preschool Programs, please <a href="contact.jsp">contact us</a>.
        </p>
    </div>
</div>

<!-- Footer -->
<footer class="text-center">
    <p>&copy; 2024 Baby Care Management System. All rights reserved.</p>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
