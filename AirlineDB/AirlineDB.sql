-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2019 at 06:01 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airlines`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Discount` (IN `price` INT, IN `ccode` INT, OUT `final` INT)  NO SQL
case 
when ccode="STUD21" then 
set final = price-(price*0.03);
when ccode="FAM42" then 
set final = price-(price*0.04);
when ccode="WED17" then 
set final = price-(price*0.03);
when ccode="NEWUSER57" then 
set final = price-(price*0.05);
when ccode="OLDGOLD60" then 
set final = price-(price*0.04);
when ccode="FEMALE20" then 
set final = price-(price*0.049);

end case$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure1` (IN `fID` VARCHAR(20), IN `cont` INT)  NO SQL
select passengers.PNRNumber,passengers.name,passengers.flightID from passengers where passengers.flightID=fID and 
     passengers.contact=cont$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_ID` int(11) NOT NULL,
  `AdminName` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Admin_ID`, `AdminName`, `password`) VALUES
(1, 'Roopa', 'roopa64'),
(2, 'Sneha', 'sneha70');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `BookingID` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `flightID` varchar(20) NOT NULL,
  `no_of_tickets` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BookingID`, `username`, `flightID`, `no_of_tickets`, `price`) VALUES
(59, 'rosa', 'F003', 1, 2297),
(70, 'emma', 'F002', 1, 1455),
(71, 'emma', 'F002', 1, 1455),
(72, 'emma', 'F002', 1, 1455),
(73, 'emma', 'F002', 1, 1455),
(74, 'emma', 'F002', 1, 1455),
(75, 'emma', 'F002', 1, 1455),
(76, 'emma', 'F002', 1, 1455),
(77, 'emma', 'F002', 1, 1455),
(78, 'emma', 'F002', 1, 1455),
(79, 'SPOORTHI', 'F002', 1, 1498),
(80, 'user', 'F004', 1, 1843),
(81, 'user', 'F003', 1, 2231),
(82, 'Emily', 'F001', 1, 1552),
(83, 'Emily', 'F001', 1, 1552);

--
-- Triggers `booking`
--
DELIMITER $$
CREATE TRIGGER `trig` AFTER INSERT ON `booking` FOR EACH ROW update flights set Capacity = Capacity-1
	          where flights.flightID='abc123'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `flightID` varchar(20) NOT NULL,
  `departure` varchar(20) NOT NULL,
  `destination` varchar(20) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `ARRDATE` date NOT NULL,
  `ARRTIME` time NOT NULL,
  `Capacity` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `NoTicketsBooked` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`flightID`, `departure`, `destination`, `Date`, `Time`, `ARRDATE`, `ARRTIME`, `Capacity`, `Price`, `NoTicketsBooked`) VALUES
('F001', 'BANGALORE', 'GUJARAT', '2019-11-25', '20:00:00', '2019-11-26', '05:00:00', 198, 1600, 2),
('F002', 'DELHI', 'GUJARAT', '2019-11-19', '17:00:00', '2019-11-20', '08:00:00', 195, 1500, 5),
('F003', 'Delhi', 'Hyderabad', '2019-11-19', '06:30:00', '0000-00-00', '00:00:00', 198, 2300, 2),
('F004', 'Bangalore', 'Delhi', '2019-11-20', '07:00:00', '2019-11-20', '14:00:00', 199, 1900, 1),
('F005', 'DELHI', 'hyderabad', '2019-11-19', '09:00:00', '2019-11-19', '19:00:00', 200, 1600, 0),
('F006', 'bangalore', 'DELHI', '2019-11-20', '08:19:00', '2019-11-20', '22:00:00', 200, 1900, 0),
('F007', 'BANGALORE', 'HYDERABAD', '2019-11-19', '10:00:00', '2019-11-19', '14:00:00', 200, 1800, 0),
('F008', 'bangalore', 'hyderabad', '2019-11-19', '05:00:00', '2019-11-19', '10:00:00', 150, 2000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `PNRNumber` int(5) NOT NULL,
  `flightID` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `contact` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`PNRNumber`, `flightID`, `name`, `age`, `gender`, `contact`) VALUES
(95, 'F003', 'Rachel', 28, 'F', 998877665),
(105, 'F002', 'Emma', 20, 'F', 9988776655),
(106, 'F002', 'Jess', 20, 'F', 8899776655),
(107, 'F002', 'Peter', 21, 'm', 77897789),
(108, 'F002', 'Carol', 20, 'F', 729541678),
(109, 'F002', 'Spoorthi', 20, 'F', 726595533),
(110, 'F004', 'Sneha', 20, 'F', 733944338),
(111, 'F003', 'Roopa', 20, 'F', 88966745),
(112, 'F001', 'Emily', 34, 'F', 789456876),
(113, 'F001', 'John', 20, 'm', 87549623);

--
-- Triggers `passengers`
--
DELIMITER $$
CREATE TRIGGER `Trigger2` AFTER DELETE ON `passengers` FOR EACH ROW update flights set NoTicketsBooked = NoTicketsBooked-1
where flights.flightID=old.flightID
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger1` AFTER INSERT ON `passengers` FOR EACH ROW update flights set NoTicketsBooked = NoTicketsBooked+1
where flights.flightID=new.flightID
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger3` AFTER DELETE ON `passengers` FOR EACH ROW update flights set Capacity = Capacity+1
where flights.flightID=old.flightID
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger4` AFTER INSERT ON `passengers` FOR EACH ROW update flights set Capacity = Capacity-1
where flights.flightID=new.flightID
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transacID` int(11) NOT NULL,
  `BookingID` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `amount` int(11) NOT NULL,
  `paymentMethod` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transacID`, `BookingID`, `booking_date`, `amount`, `paymentMethod`) VALUES
(34, 59, '2019-11-18', 2297, 'CREDIT CARD'),
(45, 70, '2019-11-23', 1455, 'DEBIT CARD'),
(46, 70, '2019-11-23', 1455, 'DEBIT CARD'),
(47, 70, '2019-11-23', 1455, 'DEBIT CARD'),
(48, 70, '2019-11-23', 1455, 'DEBIT CARD'),
(49, 70, '2019-11-23', 1455, 'CASH'),
(50, 70, '2019-11-23', 1455, 'CASH'),
(51, 70, '2019-11-23', 1455, 'CASH'),
(52, 70, '2019-11-23', 1455, 'CASH'),
(53, 70, '2019-11-23', 1455, 'DEBIT CARD'),
(54, 79, '2019-11-23', 1498, 'CASH'),
(55, 80, '2019-11-23', 1843, 'DEBIT CARD'),
(56, 81, '2019-11-23', 2231, 'NET BANKING'),
(57, 82, '2019-11-23', 1552, 'DEBIT CARD'),
(58, 82, '2019-11-23', 1552, 'DEBIT CARD');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Contact` bigint(20) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `Fname`, `Lname`, `Contact`, `email`) VALUES
('Emily', 'Blunt', 'Emily', 'Blunt', 789456876, 'emily@gmail.com'),
('emma', 'stone', 'emma', 'stone', 9988776655, 'emma@gmail.com'),
('Holt', 'kev', 'Raymond', 'Holt', 2147483647, 'holt@gmail.com'),
('roopa', 'roopa70', 'roopa', 'n', 894473324, 'roopa@gmail.com'),
('rosa', 'diaz', 'rosa', 'diaz', 786663451, 'rosadiaz@gmail.com'),
('SPOORTHI', 'shiny', 'SPOORTHI', 'V', 726595533, 'spoov@gmail.com'),
('tony', 'stark', 'Tony', 'Stark', 2147483647, 'tonystark@gmail.com'),
('user', 'user123', 'user', '', 12345678, 'user@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `flightID` (`flightID`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`flightID`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`PNRNumber`),
  ADD UNIQUE KEY `PNRNumber` (`PNRNumber`),
  ADD KEY `flightID` (`flightID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transacID`),
  ADD KEY `transactions_ibfk_1` (`BookingID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Admin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `PNRNumber` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transacID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`flightID`) REFERENCES `flights` (`flightID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `passengers_ibfk_1` FOREIGN KEY (`flightID`) REFERENCES `flights` (`flightID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`BookingID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
