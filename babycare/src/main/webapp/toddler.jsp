<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Toddler Care - Baby Care Management System</title>
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
            background-color: #fff;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 50px;
        }

        .content-section h2 {
            font-size: 32px;
            color: #343a40;
            font-weight: 700;
            margin-bottom: 30px;
        }

        .content-section p {
            font-size: 16px;
            color: #666;
            line-height: 1.8;
        }

        .content-section ul {
            list-style-type: disc;
            padding-left: 20px;
        }

        .content-section ul li {
            margin-bottom: 10px;
            font-size: 16px;
            color: #666;
        }

        .service-icon {
            font-size: 5rem;
            color: #ff6f61;
            margin-bottom: 20px;
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
            .content-section {
                padding: 30px;
            }

            .content-section h2 {
                font-size: 28px;
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

<!-- Toddler Care Section -->
<div class="container my-5">
    <div class="content-section">
        <div class="text-center">
            <i class="fas fa-child service-icon"></i>
            <h2>Toddler Care</h2>
        </div>
        <p>Our Toddler Care program is designed to nurture the curious and energetic nature of toddlers. We offer a safe, stimulating environment where children can explore, learn, and grow. Our experienced caregivers provide individualized attention, ensuring each child's unique needs are met.</p>
        <h3>Program Features:</h3>
        <ul>
            <li>Age-appropriate activities that promote cognitive, social, and physical development.</li>
            <li>Daily routines that include playtime, nap time, and healthy meals.</li>
            <li>Interactive learning through music, art, and movement.</li>
            <li>Outdoor play areas designed for safe exploration.</li>
            <li>Regular communication with parents to update on their child's progress.</li>
        </ul>
        <p>We believe in fostering a love of learning from an early age. Our Toddler Care program is the perfect place for your child to thrive and prepare for preschool.</p>
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
