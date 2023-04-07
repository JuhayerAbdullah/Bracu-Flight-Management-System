-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2023 at 10:40 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ofbsphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_uname` varchar(20) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_pwd` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_uname`, `admin_email`, `admin_pwd`) VALUES
(1, 'Admin', 'juhayer@mail.com', '$2y$10$fGyiJ8fGJChh/K7XkLNKOOcZ.L/.wXUnzvDNZOxJImyxgc//IrOsK');

-- --------------------------------------------------------

--
-- Table structure for table `airline`
--

CREATE TABLE `airline` (
  `airline_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `seats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `airline`
--

INSERT INTO `airline` (`airline_id`, `name`, `seats`) VALUES
(1, ' Bangladesh Biman', 165),
(2, 'Eastern Airways', 220),
(3, 'Air Asia', 125),
(4, 'BRACU Sky', 210),
(5, 'Fly BRACU', 185),
(6, 'US Bangla ', 200),
(7, 'Easyjet', 205),
(8, 'Paramount', 158),
(9, 'Kingfisher', 210),
(10, 'Etihad Airways', 135),
(11, 'Asian Wings', 215);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city`) VALUES
('Dhaka'),
('Chittagong'),
('Rajshahi'),
('Sylhet'),
('Jashore'),
('Saidpur'),
('Barishal'),
('Kolkata'),
('Mumbai'),
('Chennai'),
('Nepal'),
('Thailand'),
('Jeddah');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feed_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `q1` varchar(250) NOT NULL,
  `q2` varchar(20) NOT NULL,
  `q3` varchar(250) NOT NULL,
  `rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feed_id`, `email`, `q1`, `q2`, `q3`, `rate`) VALUES
(1, 'juhayer@mail.com', 'Comfortable ', 'Friend/Relative', '', 5);

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `flight_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `arrivale` datetime NOT NULL,
  `departure` datetime NOT NULL,
  `Destination` varchar(20) NOT NULL,
  `source` varchar(20) NOT NULL,
  `airline` varchar(20) NOT NULL,
  `Seats` varchar(110) NOT NULL,
  `duration` varchar(20) NOT NULL,
  `Price` int(11) NOT NULL,
  `status` varchar(6) DEFAULT NULL,
  `issue` varchar(50) DEFAULT NULL,
  `last_seat` varchar(5) DEFAULT '',
  `bus_seats` int(11) DEFAULT 20,
  `last_bus_seat` varchar(5) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`flight_id`, `admin_id`, `arrivale`, `departure`, `Destination`, `source`, `airline`, `Seats`, `duration`, `Price`, `status`, `issue`, `last_seat`, `bus_seats`, `last_bus_seat`) VALUES
(1, 1, '2023-06-01 10:03:00', '2023-06-01 09:01:00', 'Dhaka', 'Chittagong', 'Bangladesh Biman', '63', '1', 165, '', '', '21B', 20, ''),
(2, 1, '2023-05-15 11:15:00', '2023-05-15 10:05:00', 'Chittagong', 'Rajshahi', 'BRACU Sky', '61', '1', 220, 'arr', '', '21D', 20, ''),
(3, 1, '2023-06-05 12:13:00', '2023-06-05 10:13:00', 'Saidpur', 'Dhaka', 'US Bangla ', '123', '2', 125, 'arr', '', '21B', 20, ''),
(4, 1, '2023-06-02 16:30:00', '2023-06-02 15:26:00', 'Dhaka', 'Barishal', 'Fly BRACU', '190', '1', 210, 'issue', '120', '', 20, ''),
(5, 1, '2023-06-02 15:30:00', '2023-06-02 12:30:00', 'Dhaka', 'Sylhet', 'Eastern Airways', '125', '3', 185, '', '', '', 20, ''),
(6, 1, '2023-06-05 17:55:00', '2023-06-05 15:30:00', 'Dhaka', 'Kolkata', 'Kingfisher', '125', '2', 200, '', '', '', 20, ''),
(7, 1, '2023-05-25 20:50:00', '2023-05-25 18:50:00', 'Dhaka', 'Mumbai', 'Paramount', '125', '2', 205, '', '', '', 20, ''),
(8, 1, '2023-06-26 00:55:00', '2023-06-25 17:00:00', 'Dhaka', 'Chennai', 'Asian Wings', '138', '7', 158, 'arr', '', '21B', 20, ''),
(9, 1, '2023-05-15 17:09:00', '2023-05-15 16:05:00', 'Dhaka', 'Nepal', 'Eastern Airways', '110', '1', 210, '', '', '', 20, ''),
(10, 1, '2023-07-06 13:10:00', '2023-07-06 11:05:00', 'Dhaka', 'Thailand', 'Air Asia', '125', '2', 135, '', '', '', 20, ''),
(11, 1, '2023-06-15 19:10:00', '2023-06-15 18:05:00', 'Dhaka', 'Jeddah', 'Etihad Airways', '120', '1', 215, '', '', '', 20, ''),
(22, 1, '2023-08-29 12:20:00', '2023-08-29 10:20:00', 'Kolkata', 'Dhaka', 'Kingfisher', '135', '2', 200, '', '', '', 20, ''),
(23, 1, '2023-06-13 09:30:00', '2023-06-13 08:30:00', 'Chittagong', 'Dhaka', 'BRACU Sky', '210', '1', 120, '', '', '', 20, ''),
(24, 1, '2023-05-19 11:30:00', '2023-05-19 10:30:00', 'Chittagong', 'Dhaka', 'Eastern Airways', '220', '1', 120, '', '', '', 20, ''),
(25, 1, '2023-06-17 17:03:00', '2023-06-17 16:30:00', 'Chittagong', 'Dhaka', 'US Bangla ', '198', '1', 120, '', '', '21B', 20, ''),
(26, 1, '2023-08-14 21:30:00', '2023-08-14 20:20:00', 'Dhaka', 'Sylhet', ' Fly BRACU', '210', '1', 130, '', '', '', 20, ''),
(27, 1, '2023-08-26 23:20:00', '2023-08-26 22:20:00', 'Dhaka', 'Sylhet', 'Eastern Airways', '205', '1', 130, '', '', '', 20, ''),
(28, 1, '2023-07-12 17:30:00', '2023-07-12 16:30:00', 'Dhaka', 'Sylhet', 'US Bangla ', '200', '1', 130, '', '', '', 20, ''),
(29, 1, '2023-07-29 21:30:00', '2023-07-29 20:30:00', 'Chittagong', 'Dhaka', ' BRACU Sky', '185', '1', 120, '', '', '', 20, ''),
(30, 1, '2023-06-10 14:30:00', '2023-06-10 12:30:00', 'Kolkata', 'Dhaka', ' Bangladesh Biman', '165', '2', 300, '', '', '', 20, ''),
(31, 1, '2023-05-11 18:30:00', '2023-05-11 16:30:00', 'Kolkata', 'Dhaka', 'Air Asia', '135', '2', 300, '', '', '', 20, ''),
(32, 1, '2023-07-19 22:30:00', '2023-07-19 20:30:00', 'Kolkata', 'Dhaka', 'Easyjet', '210', '2', 300, '', '', '', 20, ''),
(33, 1, '2023-07-22 21:30:00', '2023-07-22 20:30:00', 'Chittagong', 'Dhaka', 'BRACU Sky', '210', '1', 140, '', '', '', 18, '1B'),
(34, 1, '2023-06-12 12:30:00', '2023-06-12 11:30:00', 'Chittagong', 'Dhaka', 'US Bangla ', '200', '1', 135, '', '', '', 20, ''),
(35, 1, '2023-05-17 15:30:00', '2023-05-17 14:30:00', 'Dhaka', 'Chittagong', 'Fly BRACU', '200', '1', 135, '', '', '', 20, ''),
(36, 1, '2022-08-22 18:30:00', '2022-08-22 17:30:00', 'Chittagong', 'Dhaka', 'Novo Air', '205', '1', 140, '', '', '', 20, ''),
(37, 1, '2022-08-22 10:30:00', '2022-08-22 09:30:00', 'Sylhet', 'Dhaka', 'Biman Bangladesh', '165', '1', 155, '', '', '', 20, ''),
(38, 1, '2022-08-22 16:30:00', '2022-08-22 15:30:00', 'Sylhet', 'Dhaka', 'Air BRACU', '185', '1', 157, '', '', '', 20, ''),
(39, 1, '2022-08-22 21:30:00', '2022-08-22 20:30:00', 'Dhaka', 'Sylhet', 'Air BRACU', '185', '1', 157, '', '', '', 18, '1B'),
(40, 1, '2022-08-22 14:30:00', '2022-08-22 07:30:00', 'Jeddah', 'Dhaka', 'Emirates Airline', '215', '1', 380, '', '', '', 20, ''),
(41, 1, '2022-08-22 17:30:00', '2022-08-22 15:30:00', 'Kolkata', 'Dhaka', 'IndiGo Airlines', '135', '2', 240, '', '', '', 18, '1B'),
(42, 1, '2022-08-22 23:40:00', '2022-08-22 15:40:00', 'Jeddah', 'Dhaka', 'Emirates Airline', '215', '6', 380, '', '', '', 18, '1B'),
(43, 1, '2022-08-22 19:20:00', '2022-08-22 17:30:00', 'Kolkata', 'Dhaka', 'Air India', '210', '2', 245, '', '', '', 20, '');

-- --------------------------------------------------------

--
-- Table structure for table `passenger_profile`
--

CREATE TABLE `passenger_profile` (
  `passenger_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `mobile` varchar(110) NOT NULL,
  `dob` datetime NOT NULL,
  `f_name` varchar(20) DEFAULT NULL,
  `m_name` varchar(20) DEFAULT NULL,
  `l_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `passenger_profile`
--

INSERT INTO `passenger_profile` (`passenger_id`, `user_id`, `flight_id`, `mobile`, `dob`, `f_name`, `m_name`, `l_name`) VALUES
(1, 1, 1, '0151111111', '1995-01-01 00:00:00', 'Arif', 'Ali', 'Mahmud'),
(2, 2, 3, '0171111111', '1995-02-13 00:00:00', 'David', 'A', 'Brown'),
(3, 3, 2, '0141111111', '1994-06-21 00:00:00', 'Alif', 'k', 'Khan'),
(4, 4, 2, '0181111111', '1995-05-16 00:00:00', 'Mamun', 'Ur', 'Rashid'),
(5, 2, 8, '0171111111', '1995-02-13 00:00:00', 'Tarek', 'Amin', 'Chowdhury'),
(6, 2, 10, '0171111111', '1995-02-13 00:00:00', 'Raisul', 'Kabir', 'Chowdhury'),
(7, 2, 25, '177771221', '1996-02-27 00:00:00', 'Taylor', 'Rush', 'Gerard'),
(8, 2, 39, '177771221', '1997-03-27 00:00:00', 'Md', 'Alam', 'Ahmed'),
(9, 2, 41, '177771221', '1997-05-27 00:00:00', 'Ricky', 'C', 'Bairstow'),
(10, 2, 33, '177771221', '1997-03-27 00:00:00', 'Shaheen', 'Ur', 'Abedin'),
(11, 2, 42, '177771221', '1997-04-27 00:00:00', 'Anisul', 'Islam', 'Khan');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `card_no` varchar(16) NOT NULL,
  `user_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `expire_date` varchar(5) DEFAULT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`card_no`, `user_id`, `flight_id`, `expire_date`, `amount`) VALUES
('1010555677851111', 4, 2, '10/26', 370),
('1020445869651011', 2, 10, '12/25', 370),
('1111888889897778', 2, 3, '12/25', 205),
('1400565800004478', 2, 8, '12/25', 1230),
('1458799990001450', 3, 2, '12/25', 185),
('3876290134876245', 2, 41, '03/24', 360),
('4123456798765234', 2, 25, '03/25', 120),
('4204558500014587', 1, 1, '02/25', 350),
('4367829013447689', 2, 42, '05/25', 570),
('4863291736291732', 2, 33, '04/23', 210),
('5678314568932156', 2, 39, '03/26', 235);

-- --------------------------------------------------------

--
-- Table structure for table `pwdreset`
--

CREATE TABLE `pwdreset` (
  `pwd_reset_id` int(11) NOT NULL,
  `pwd_reset_email` varchar(50) NOT NULL,
  `pwd_reset_selector` varchar(80) NOT NULL,
  `pwd_reset_token` varchar(120) NOT NULL,
  `pwd_reset_expires` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seat_no` varchar(10) NOT NULL,
  `cost` int(11) NOT NULL,
  `class` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `passenger_id`, `flight_id`, `user_id`, `seat_no`, `cost`, `class`) VALUES
(1, 1, 1, 1, '21A', 350, 'E'),
(2, 2, 3, 2, '21A', 205, 'E'),
(4, 3, 2, 3, '21A', 185, 'E'),
(6, 4, 2, 4, '21C', 370, 'E'),
(8, 5, 8, 2, '21A', 1230, 'E'),
(10, 6, 10, 2, '21A', 370, 'E'),
(12, 1, 25, 2, '21A', 120, 'E'),
(13, 2, 25, 2, '21B', 120, 'E'),
(14, 1, 39, 2, '1A', 235, 'B'),
(15, 2, 39, 2, '1B', 235, 'B'),
(16, 1, 41, 2, '1A', 360, 'B'),
(17, 2, 41, 2, '1B', 360, 'B'),
(18, 1, 33, 2, '1A', 210, 'B'),
(19, 2, 33, 2, '1B', 210, 'B'),
(20, 1, 42, 2, '1A', 570, 'B'),
(21, 2, 42, 2, '1B', 570, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`) VALUES
(1, 'Arif', 'arif@mail.com', '$2y$10$yAqKisCcxzSsYKld9eG1VuAtZrtkt.ISQYXoI7hJqYiqzAUC8cDBu'),
(2, 'Maayrl', 'mayrl@mail.com', '$2y$10$yAqKisCcxzSsYKld9eG1VuAtZrtkt.ISQYXoI7hJqYiqzAUC8cDBu'),
(3, 'Taylor', 'taylor@mail.com', '$2y$10$yAqKisCcxzSsYKld9eG1VuAtZrtkt.ISQYXoI7hJqYiqzAUC8cDBu'),
(4, 'Mamun', 'mamun@mail.com', '$2y$10$yAqKisCcxzSsYKld9eG1VuAtZrtkt.ISQYXoI7hJqYiqzAUC8cDBu'),
(5, 'Juhayer', 'juhayer@mail.com', '$2y$10$fGyiJ8fGJChh/K7XkLNKOOcZ.L/.wXUnzvDNZOxJImyxgc//IrOsK');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `airline`
--
ALTER TABLE `airline`
  ADD PRIMARY KEY (`airline_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feed_id`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`flight_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `passenger_profile`
--
ALTER TABLE `passenger_profile`
  ADD PRIMARY KEY (`passenger_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `flight_id` (`flight_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`card_no`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `flight_id` (`flight_id`);

--
-- Indexes for table `pwdreset`
--
ALTER TABLE `pwdreset`
  ADD PRIMARY KEY (`pwd_reset_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `flight_id` (`flight_id`),
  ADD KEY `passenger_id` (`passenger_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `airline`
--
ALTER TABLE `airline`
  MODIFY `airline_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `passenger_profile`
--
ALTER TABLE `passenger_profile`
  MODIFY `passenger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pwdreset`
--
ALTER TABLE `pwdreset`
  MODIFY `pwd_reset_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `passenger_profile`
--
ALTER TABLE `passenger_profile`
  ADD CONSTRAINT `passenger_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `passenger_profile_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`),
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`passenger_id`) REFERENCES `passenger_profile` (`passenger_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
