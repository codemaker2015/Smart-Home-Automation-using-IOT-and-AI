-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2018 at 01:05 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smarthome`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_appliances`
--

CREATE TABLE `tbl_appliances` (
  `component_id` int(11) NOT NULL,
  `component_name` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL,
  `power` double NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_appliances`
--

INSERT INTO `tbl_appliances` (`component_id`, `component_name`, `description`, `power`, `price`) VALUES
(1, 'CFL 14W', 'CFL Bulb 14W. Used to provide light in home', 14, 110),
(2, 'LED Light 8W', 'LED Light 8W used to provide light for home', 8, 90),
(3, 'TV', 'Used for seeing movies. Provide entertainment to the user.', 90, 8000),
(4, 'FAN', 'Uses hub-mounted rotating paddles to circulate air to cool the room.', 90, 1500),
(5, 'A/C', 'Air conditioning, technologies for altering the temperature and humidity of air.', 300, 8000),
(6, 'Washing Machine', 'A washing machine (laundry machine, clothes washer, or washer) is a device used to wash laundry.', 300, 8000),
(7, 'Door', 'A door is a moving mechanism used to block off and allow access to, an entrance to room or building.', 5, 1000),
(8, 'Window', 'A window is an opening in a wall, door, roof that allows the passage of light, sound, and air.', 5, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_registration`
--

CREATE TABLE `tbl_registration` (
  `username` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_room`
--

CREATE TABLE `tbl_room` (
  `room_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_room_configuration`
--

CREATE TABLE `tbl_room_configuration` (
  `room_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `status` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_appliances`
--
ALTER TABLE `tbl_appliances`
  ADD PRIMARY KEY (`component_id`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `tbl_room`
--
ALTER TABLE `tbl_room`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `tbl_room_configuration`
--
ALTER TABLE `tbl_room_configuration`
  ADD PRIMARY KEY (`component_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_appliances`
--
ALTER TABLE `tbl_appliances`
  MODIFY `component_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
