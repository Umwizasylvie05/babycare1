<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Baby Care Management System</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            color: #333;
            background-color: #f8f9fa;
            padding-top: 56px;
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

        .about-section {
            padding: 80px 0;
            background-color: #fff;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            border-radius: 8px;
        }

        .about-section h2 {
            font-size: 36px;
            color: #6c757d;
            font-weight: 700;
            margin-bottom: 30px;
        }

        .about-section p {
            font-size: 18px;
            line-height: 1.8;
            margin-bottom: 30px;
        }

        .mission {
            margin-top: 40px;
        }

        .mission h3 {
            font-size: 28px;
            color: #343a40;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .team {
            margin-top: 50px;
        }

        .team h3 {
            font-size: 28px;
            color: #343a40;
            font-weight: 600;
            margin-bottom: 40px;
            text-align: center;
        }

        .team-member {
            text-align: center;
            margin-bottom: 40px;
            transition: transform 0.3s ease;
        }

        .team-member img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 15px;
        }

        .team-member h4 {
            font-size: 22px;
            color: #6c757d;
            font-weight: 600;
        }

        .team-member p {
            font-size: 16px;
            color: #666;
            margin-top: 5px;
        }

        .team-member:hover {
            transform: translateY(-10px);
        }

        .contact {
            margin-top: 60px;
            text-align: center;
        }

        .contact h3 {
            font-size: 28px;
            color: #343a40;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .contact p {
            font-size: 18px;
            color: #666;
            margin-bottom: 10px;
        }

        footer {
            background: #343a40;
            color: #fff;
            padding: 15px 0;
            text-align: center;
            margin-top: 50px;
        }

        footer p {
            margin: 0;
            font-size: 16px;
        }

        @media (max-width: 768px) {
            .team-member {
                margin-bottom: 30px;
            }
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
<!-- Navigation Bar -->
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

<!-- About Us Section -->
<section id="about" class="about-section">
    <div class="container">
        <h2>About Us</h2>
        <p>We are dedicated to providing the best baby care management services. Our experienced team ensures the well-being and development of your child with personalized care plans and support.</p>
        
        <!-- Mission Section -->
        <div class="mission">
            <h3>Our Mission</h3>
            <p>Our mission is to offer comprehensive and reliable baby care services that support parents and promote the healthy development of children. We strive to create a safe, nurturing, and stimulating environment for every child.</p>
        </div>

        <!-- Team Section -->
        <div class="team">
            <h3>Our Team</h3>
            <div class="row">
                <div class="col-md-4">
                    <div class="team-member">
                        <img src="mee.JPG" alt="Team Member 1">
                        <h4>UMWIZA Sylvie</h4>
                        <p>CEO & Founder</p>
                        <p>Sylvie has over 15 years of experience in child care and education. She founded Baby Care Management System with a vision to provide top-quality baby care services.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="team-member">
                        <img src="pi.jpeg" alt="Team Member 2">
                        <h4>N Pisco</h4>
                        <p>Chief Pediatrician</p>
                        <p>Pisco is a highly skilled pediatrician with a passion for child health. He ensures that all medical services provided are of the highest standard.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="team-member">
                        <img src="zig.jpeg" alt="Team Member 3">
                        <h4>T Richard</h4>
                        <p>Nutrition Specialist</p>
                        <p>Richard specializes in pediatric nutrition and works with parents to create tailored nutrition plans that support the healthy growth of children.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Contact Section -->
        <div class="contact">
            <h3>Contact Us</h3>
            <p>We would love to hear from you! Please reach out with any questions or to schedule a consultation.</p>
            <p><i class="fas fa-envelope"></i> Email: info@babycare.com</p>
            <p><i class="fas fa-phone"></i> Phone:+250784108487</p>
            <p><i class="fas fa-map-marker-alt"></i> Address: 123 Baby Care Lane, City, State, 12345</p>
        </div>
    </div>
</section>

<!-- Footer -->
<footer>
    <p>&copy; 2024 Baby Care Management System. All rights reserved.</p>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
