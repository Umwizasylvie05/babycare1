<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Services - Baby Care Management System</title>
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

        .service-icon {
            font-size: 3.5rem;
            color: #ff6f61;
        }

        .service-box {
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-bottom: 30px;
        }

        .service-box:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .service-box h3 {
            font-size: 22px;
            color: #343a40;
            font-weight: 600;
            margin-top: 20px;
        }

        .service-box p {
            font-size: 16px;
            color: #666;
            margin-top: 10px;
        }

        .container h1 {
            font-size: 36px;
            font-weight: 700;
            color: #343a40;
            margin-bottom: 50px;
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
            .service-box {
                margin-bottom: 20px;
            }

            .container h1 {
                font-size: 28px;
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

<!-- Services Section -->
<div class="container my-5">
    <h1 class="text-center">Our Services</h1>
    <div class="row">
        <div class="col-md-4">
            <a href="infantcare.jsp">
                <div class="service-box text-center">
                    <i class="fas fa-baby service-icon"></i>
                    <h3>Infant Care</h3>
                    <p>Our trained staff provides comprehensive care for infants, including feeding, diaper changes, and nurturing in a safe and loving environment.</p>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="toddler.jsp">
                <div class="service-box text-center">
                    <i class="fas fa-child service-icon"></i>
                    <h3>Toddler Care</h3>
                    <p>We offer engaging activities and educational programs tailored for toddlers to support their development and prepare them for preschool.</p>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="PreschoolPrograms.jsp">
                <div class="service-box text-center">
                    <i class="fas fa-book-open service-icon"></i>
                    <h3>Preschool Programs</h3>
                    <p>Our preschool programs focus on early learning, social skills, and physical development to ensure children are ready for kindergarten.</p>
                </div>
            </a>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-md-4">
            <a href="#">
                <div class="service-box text-center">
                    <i class="fas fa-utensils service-icon"></i>
                    <h3>Nutrition and Meals</h3>
                    <p>We provide balanced and nutritious meals and snacks to support healthy growth and development for all children in our care.</p>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="#">
                <div class="service-box text-center">
                    <i class="fas fa-user-md service-icon"></i>
                    <h3>Health Services</h3>
                    <p>Regular health check-ups and monitoring are conducted by our on-site healthcare professionals to ensure the well-being of all children.</p>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="#">
                <div class="service-box text-center">
                    <i class="fas fa-music service-icon"></i>
                    <h3>Extra-curricular Activities</h3>
                    <p>We offer a variety of extra-curricular activities such as music, art, and physical education to enhance the overall development of children.</p>
                </div>
            </a>
        </div>
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
