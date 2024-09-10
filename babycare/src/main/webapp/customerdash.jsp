<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard - Baby Care Management System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
        }
        .sidebar {
            width: 250px;
            background-color: #343a40;
            padding: 20px;
            color: #fff;
            position: fixed;
            height: 100%;
        }
        .sidebar h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .sidebar a {
            color: #fff;
            display: block;
            padding: 10px;
            text-decoration: none;
            margin-bottom: 10px;
            border-radius: 4px;
        }
        .sidebar a:hover {
            background-color: #495057;
            text-decoration: none;
        }
        .main-content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
            background-color: #fff;
        }
        .dashboard-header {
            background-color: #45786e;
            color: #fff;
            padding: 15px 20px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .card {
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border: none;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .card-body {
            padding: 20px;
        }
        .card-title {
            font-size: 18px;
            margin-bottom: 10px;
            color: #343a40;
        }
        .card-text {
            font-size: 16px;
            color: #666;
        }
        .footer {
            background: #333;
            color: #fff;
            text-align: center;
            padding: 1rem 0;
            position: fixed;
            bottom: 0;
            width: 100%;
            margin-left: 250px;
        }
        .btn-primary {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn-primary:hover {
            background-color: #004494;
            border-color: #004494;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Customer Dashboard</h2>
        <a href="#profile"><i class="fas fa-user"></i> Profile</a>
        <a href="#manage-babies"><i class="fas fa-baby"></i> Manage Babies</a>
        <a href="#appointments"><i class="fas fa-calendar-alt"></i> Appointments</a>
        <a href="#messages"><i class="fas fa-envelope"></i> Messages</a>
        <a href="#settings"><i class="fas fa-cog"></i> Settings</a>
        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Log Out</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="dashboard-header">
            <h1>Welcome, [Customer Name]</h1>
            <p>Here is your dashboard where you can manage your details and baby care activities.</p>
        </div>

        <!-- Profile Section -->
        <section id="profile">
            <h2>Profile</h2>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Your Information</h5>
                    <p class="card-text">Name: [UMWIZA Sylvie]</p>
                    <p class="card-text">Email: [umwiza05@gmail.com]</p>
                    <p class="card-text">Phone: [+250784108487]</p>
                    <a href="editprofile.jsp" class="btn btn-primary">Edit Profile</a>
                </div>
            </div>
        </section>

        <!-- Manage Babies Section -->
        <section id="manage-babies">
            <h2>Manage Babies</h2>
            <p>View and manage your baby’s records and details.</p>
            <button class="btn btn-primary">View Baby Records</button>
        </section>

        <!-- Appointments Section -->
        <section id="appointments">
            <h2>Appointments</h2>
            <p>Manage and view your scheduled appointments.</p>
            <button class="btn btn-primary">View Appointments</button>
        </section>

        <!-- Messages Section -->
        <section id="messages">
            <h2>Messages</h2>
            <p>Check and manage your messages and notifications.</p>
            <button class="btn btn-primary">View Messages</button>
        </section>

        <!-- Settings Section -->
        <section id="settings">
            <h2>Settings</h2>
            <p>Update your preferences and settings.</p>
            <button class="btn btn-primary">Update Settings</button>
        </section>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 BabyCare. All rights reserved.</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
