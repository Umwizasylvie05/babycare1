<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Infant Care Services</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            color: #333;
            background-color: #f8f9fa;
            padding-top: 56px;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }
        .form-group label {
            font-weight: bold;
            color: #555;
        }
        .btn-primary {
            background-color: #28a745;
            border-color: #28a745;
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
            <li class="nav-item"><a class="nav-link" href="logout.jsp#login">LogOut</a></li>
        </ul>
    </div>
</nav>
    <div class="container">
        <h2>Infant Care Services</h2>
        <form action="InfantServlet" method="post">
            <!-- Infant Information -->
            <div class="form-group">
                <label for="infantName">Infant's Name</label>
                <input type="text" class="form-control" id="infantName" name="infantName" required>
            </div>
            <div class="form-group">
                <label for="dob">Date of Birth</label>
                <input type="date" class="form-control" id="dob" name="dob" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender</label>
                <select class="form-control" id="gender" name="gender" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select>
            </div>
            <div class="form-group">
                <label for="parentName">Parent/Guardian Name</label>
                <input type="text" class="form-control" id="parentName" name="parentName" required>
            </div>
            <div class="form-group">
                <label for="contactNumber">Contact Number</label>
                <input type="text" class="form-control" id="contactNumber" name="contactNumber" required>
            </div>
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <!-- Health Information -->
            <div class="form-group">
                <label for="weight">Weight (kg)</label>
                <input type="number" class="form-control" id="weight" name="weight" required>
            </div>
            <div class="form-group">
                <label for="height">Height (cm)</label>
                <input type="number" class="form-control" id="height" name="height" required>
            </div>
            <div class="form-group">
                <label for="allergies">Allergies</label>
                <textarea class="form-control" id="allergies" name="allergies" rows="2"></textarea>
            </div>
            <div class="form-group">
                <label for="medicalConditions">Medical Conditions</label>
                <textarea class="form-control" id="medicalConditions" name="medicalConditions" rows="2"></textarea>
            </div>
            <!-- Service Details -->
            <div class="form-group">
                <label for="serviceType">Service Type</label>
                <select class="form-control" id="serviceType" name="serviceType" required>
                    <option value="Routine Checkup">Routine Checkup</option>
                    <option value="Vaccination">Vaccination</option>
                    <option value="Nutrition Counseling">Nutrition Counseling</option>
                    <option value="Emergency Care">Emergency Care</option>
                </select>
            </div>
            <div class="form-group">
                <label for="serviceDate">Service Date</label>
                <input type="date" class="form-control" id="serviceDate" name="serviceDate" required>
            </div>
            <div class="form-group">
                <label for="preferredTime">Preferred Time</label>
                <input type="time" class="form-control" id="preferredTime" name="preferredTime" required>
            </div>
            <div class="form-group">
                <label for="specialInstructions">Special Instructions</label>
                <textarea class="form-control" id="specialInstructions" name="specialInstructions" rows="2"></textarea>
            </div>
            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary btn-block">Submit</button>
        </form>
    </div>
</body>
</html>
