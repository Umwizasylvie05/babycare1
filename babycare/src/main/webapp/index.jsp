<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Baby Care Management System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #fce4ec; /* Soft pink background color */
        }

        nav {
            background-color: #333; /* Dark background for the navbar */
            padding: 20px; /* Increased padding for more height */
        }

        nav img {
            width: 120px; /* Increased size of the logo */
            height: auto;
        }

        .navbar-light .navbar-brand {
            color: #fff; /* White text for brand */
            font-weight: bold;
        }

        .navbar-light .navbar-nav .nav-link {
            color: #f8f9fa; /* Light color for menu items */
            font-size: 1.2rem; /* Larger font size */
            padding: 10px 20px; /* Increased padding for menu items */
            transition: color 0.3s ease;
        }

        .navbar-light .navbar-nav .nav-link:hover {
            color: #ff8a80; /* Highlight color on hover */
            background-color: #444; /* Darker background on hover */
            border-radius: 5px; /* Rounded corners for hover effect */
        }

        .hero {
            background: url('4.jpeg') no-repeat center center/cover;
            height: 80vh;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            background-color: rgba(0, 0, 0, 0.6); /* Darker overlay */
            background-blend-mode: darken; /* Darken the background image */
        }

        .hero h1 {
            font-size: 4rem;
            font-weight: bold;
            margin-bottom: 1rem;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.6);
        }

        .hero p {
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.6);
        }

        .hero .btn {
            font-size: 1.5rem;
            padding: 10px 20px;
            background-color: #ff8a80;
            border: none;
            transition: background-color 0.3s ease;
        }

        .hero .btn:hover {
            background-color: #ff5252;
        }

        section {
            padding: 60px 0;
        }

        section h2 {
            margin-bottom: 30px;
            font-size: 2.5rem;
            color: #d32f2f;
        }

        section p {
            font-size: 1.2rem;
            color: #666;
        }

        footer {
            background: #d32f2f;
            color: #fff;
            text-align: center;
            padding: 1rem 0;
        }

        footer p {
            margin: 0;
        }

        .text-center h4 {
            color: #ff8a80;
            margin-top: 10px;
        }

        .col-md-4 i {
            color: #ff8a80;
            margin-bottom: 20px;
        }

        form .form-control {
            margin-bottom: 1rem;
        }

        .btn-primary {
            background-color: #ff8a80;
            border-color: #ff8a80;
        }

        .btn-primary:hover {
            background-color: #ff5252;
            border-color: #ff5252;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light">
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
                <li class="nav-item">
                    <a class="nav-link" href="services.jsp">Services</a>
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

    <!-- Hero Section -->
    <header class="hero">
        <div class="container">
            <h1>Welcome to BabyCare Management System</h1>
            <p>Your partner in managing your baby's care routine effortlessly.</p>
            <a href="#about" class="btn btn-primary">Learn More</a>
        </div>
    </header>

    <!-- About Us Section -->
    <section id="about" class="py-5">
        <div class="container">
            <h2 class="text-center">About Us</h2>
            <p class="text-center">BabyCare Management System is designed to help parents and caregivers track and manage the health and care routines of their babies efficiently.</p>
            <div class="row">
                <div class="col-md-6">
                    <p>Our system allows you to record daily activities, track health metrics, maintain vaccination schedules, and set reminders for important tasks. We aim to make baby care easier and more organized for you.</p>
                </div>
                <div class="col-md-6">
                    <p>With a user-friendly interface and comprehensive features, BabyCare ensures that you have all the necessary tools at your fingertips to ensure the well-being of your baby.</p>
                    <a href="about.jsp" class="btn btn-primary">Learn More</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Services Section -->
    <section id="services" class="bg-light py-5">
        <div class="container">
            <h2 class="text-center">Our Services</h2>
            <div class="row text-center">
                <div class="col-md-4">
                    <i class="fas fa-baby fa-3x"></i>
                    <h4>Daily Activity Tracking</h4>
                    <p>Record feeding times, sleep patterns, and diaper changes to monitor your baby's daily routine.</p>
                </div>
                <div class="col-md-4">
                    <i class="fas fa-chart-line fa-3x"></i>
                    <h4>Health Metrics Recording</h4>
                    <p>Track weight, height, and temperature to keep a close eye on your baby's growth and health.</p>
                </div>
                <div class="col-md-4">
                    <i class="fas fa-syringe fa-3x"></i>
                    <h4>Vaccination Schedule Management</h4>
                    <p>Maintain vaccination records and get reminders for upcoming vaccinations.</p>
                </div>
                <a href="services.jsp" class="btn btn-primary mt-4">Learn More</a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3">
        <p>&copy; 2024 BabyCare. All rights reserved.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
