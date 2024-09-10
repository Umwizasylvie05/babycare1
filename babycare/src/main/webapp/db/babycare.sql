-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2024 at 08:00 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `babycare`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `activity_id` int(11) NOT NULL,
  `toddler_id` int(11) DEFAULT NULL,
  `activity_date` date DEFAULT NULL,
  `activity_name` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` varchar(255) DEFAULT NULL,
  `notifications` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `created_at`, `email`, `notifications`) VALUES
(1, 'umwiza', '12345', '2024-08-21 21:26:58', 'umwiza05@gmail.com', '1');

-- --------------------------------------------------------

--
-- Table structure for table `careschedule`
--

CREATE TABLE `careschedule` (
  `schedule_id` int(11) NOT NULL,
  `infant_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_time` time NOT NULL,
  `activity_description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contact-form`
--

CREATE TABLE `contact-form` (
  `name` varchar(25) NOT NULL,
  `email` varchar(35) NOT NULL,
  `message` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact-form`
--

INSERT INTO `contact-form` (`name`, `email`, `message`) VALUES
('umwiza sylvie', 'umwiza05@gmail.com', 'thx'),
('clarisse', 'clarisse@gmail.com', 'hi thanks for the best services'),
('E-check', 'sylvie45@gmail.com', 'thanks for the good services');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `infant_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `comments` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `infants`
--

CREATE TABLE `infants` (
  `infant_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `infant_care_services`
--

CREATE TABLE `infant_care_services` (
  `id` int(11) NOT NULL,
  `infant_name` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `parent_name` varchar(100) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `allergies` text DEFAULT NULL,
  `medical_conditions` text DEFAULT NULL,
  `service_type` varchar(50) DEFAULT NULL,
  `service_date` date DEFAULT NULL,
  `preferred_time` time DEFAULT NULL,
  `special_instructions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `infant_care_services`
--

INSERT INTO `infant_care_services` (`id`, `infant_name`, `dob`, `gender`, `parent_name`, `contact_number`, `email`, `weight`, `height`, `allergies`, `medical_conditions`, `service_type`, `service_date`, `preferred_time`, `special_instructions`) VALUES
(2, 'keke', '2024-08-14', 'Male', 'cyubahiro', '8765555', 'ggfgf@gmail.com', '60.00', '65.00', 'none', 'none', 'nutrition', '2024-07-31', '12:07:00', 'none'),
(3, 'manzi Aldo', '2024-08-14', 'Male', 'CYUBAHIRO Patrick', '078654667778', 'pi@gmail.com', '60.00', '65.00', 'none', 'none', 'Nutrition Counseling', '2024-08-02', '23:24:00', 'none'),
(4, 'MUTIMUKEYE', '2024-08-13', 'Female', 'MUTIMA', '078029344', 'umwiza05@gmail.com', '5.00', '45.00', 'MIKLK', 'NONE', 'Vaccination', '2024-08-13', '01:56:00', 'FDTRGDYTFU'),
(5, 'douce', '2024-08-23', 'Female', 'devota', '078654667778', 'umwiza05@gmail.com', '60.00', '65.00', 'eggs', 'eyes', 'Nutrition Counseling', '2024-08-30', '20:04:00', 'ghhjjjj'),
(7, 'shema shalma', '2024-12-28', 'Female', 'valenc', '07865765431', 'vava@gmail.com', '62.00', '171.00', 'chees', 'headech', 'Emergency Care', '2024-08-21', '18:10:00', 'don\'t give my child milk');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

CREATE TABLE `progress` (
  `progress_id` int(11) NOT NULL,
  `toddler_id` int(11) DEFAULT NULL,
  `progress_date` date DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `service_date` date DEFAULT NULL,
  `service_description` text NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_name`, `service_date`, `service_description`, `category`) VALUES
(1, 'Newborn Care', '2024-08-08', 'Comprehensive care for newborns including feeding, diaper changes, and monitoring health.', 'Infant Care'),
(2, 'Sleep Training', '2024-08-10', 'Customized sleep training programs to help infants develop healthy sleep patterns.', 'Infant Care'),
(3, 'Health Monitoring', '2024-08-14', 'Regular health check-ups and vaccinations for infants to ensure they are growing healthy.', 'Infant Care');

-- --------------------------------------------------------

--
-- Table structure for table `toddlers`
--

CREATE TABLE `toddlers` (
  `toddler_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `parent_contact` varchar(50) DEFAULT NULL,
  `health_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `toddlers`
--

INSERT INTO `toddlers` (`toddler_id`, `name`, `age`, `parent_contact`, `health_notes`) VALUES
(1, 'emmg', 123, '2', 'dfghfgh');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `role`, `email`, `phone`, `created_at`, `password`) VALUES
(13, 'ney michel tuyishime', 'user', 'ney123@gmail.com', NULL, '2024-08-20 17:56:07', '12345'),
(20, 'richard', 'customer', 'rich@gmail.com', '0783245322', '2024-08-21 07:00:00', '123'),
(22, 'clarass', 'customer', 'clarisse@gmail.com', '0783245322', '2024-08-20 07:00:00', '12345'),
(23, 'devotha', 'customer', 'umwiza05@gmail.com', '07883533', '2024-08-16 07:00:00', '1234'),
(24, 'sylvie', 'customer', 'sylvie12@gmail.com', '0783245322', '2024-08-28 07:00:00', '1234'),
(26, 'mutoni', 'customer', 'mutoni@12345', '4567890', '2024-08-13 07:00:00', '123'),
(29, 'sylvieUmwiza', 'customer', 'sylvie45@gmail.com', '0783245322', '2024-08-29 07:00:00', '123'),
(30, 'sylvieUmwiza yalleck', 'customer', 'sylvie45@gmail.com', '0783245322', '2024-08-29 07:00:00', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `toddler_id` (`toddler_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `careschedule`
--
ALTER TABLE `careschedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `infant_id` (`infant_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `infant_id` (`infant_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `infants`
--
ALTER TABLE `infants`
  ADD PRIMARY KEY (`infant_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `infant_care_services`
--
ALTER TABLE `infant_care_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`progress_id`),
  ADD KEY `toddler_id` (`toddler_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `toddlers`
--
ALTER TABLE `toddlers`
  ADD PRIMARY KEY (`toddler_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `careschedule`
--
ALTER TABLE `careschedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `infants`
--
ALTER TABLE `infants`
  MODIFY `infant_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `infant_care_services`
--
ALTER TABLE `infant_care_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `progress`
--
ALTER TABLE `progress`
  MODIFY `progress_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `toddlers`
--
ALTER TABLE `toddlers`
  MODIFY `toddler_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`toddler_id`) REFERENCES `toddlers` (`toddler_id`);

--
-- Constraints for table `careschedule`
--
ALTER TABLE `careschedule`
  ADD CONSTRAINT `careschedule_ibfk_1` FOREIGN KEY (`infant_id`) REFERENCES `infants` (`infant_id`),
  ADD CONSTRAINT `careschedule_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`infant_id`) REFERENCES `infants` (`infant_id`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `infants`
--
ALTER TABLE `infants`
  ADD CONSTRAINT `infants_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `progress`
--
ALTER TABLE `progress`
  ADD CONSTRAINT `progress_ibfk_1` FOREIGN KEY (`toddler_id`) REFERENCES `toddlers` (`toddler_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
