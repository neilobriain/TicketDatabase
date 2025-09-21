-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 22, 2024 at 06:21 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ticketmaster`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `building_num` varchar(255) NOT NULL,
  `building_name` varchar(255) NOT NULL,
  `address_line_1` varchar(500) NOT NULL,
  `address_line_2` varchar(500) NOT NULL,
  `town` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL,
  `postcode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `building_num`, `building_name`, `address_line_1`, `address_line_2`, `town`, `city_id`, `postcode`) VALUES
(1, '123', 'My Big Building', 'The Alleyway', 'Main Street', 'Lisburn Road', 1, 'BT9 123'),
(2, '17', 'Corkonian Towers', 'Lower Coal Quay', 'South Main Street', 'City Centre', 2, 'THZ RY0'),
(3, '1', 'Belfast Venue 1', 'Main Street', '', 'Belfast', 1, 'BT1 1AA'),
(4, '2', 'Belfast Venue 2', 'High Street', '', 'Belfast', 1, 'BT2 2BB'),
(5, '3', 'Belfast Venue 3', 'Market Square', '', 'Belfast', 1, 'BT3 3CC'),
(6, '1', 'Dublin Venue 1', 'O\'Connell Street', '', 'Dublin', 7, 'D1 1AA'),
(7, '2', 'Dublin Venue 2', 'St. Stephen\'s Green', '', 'Dublin', 7, 'D2 2BB'),
(8, '1', 'Cork Venue 1', 'Patrick Street', '', 'Cork', 2, 'C1 1AA'),
(9, '2', 'Cork Venue 2', 'Oliver Plunkett Street', '', 'Cork', 2, 'C2 2BB'),
(10, '1', 'London Venue 1', 'Baker Street', '', 'London', 8, 'NW1 1AA'),
(11, '2', 'London Venue 2', 'Oxford Street', '', 'London', 8, 'W1 2BB');

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `artist_id` int(11) NOT NULL,
  `artist_name` varchar(255) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`artist_id`, `artist_name`, `genre_id`) VALUES
(4, 'Coldplay', 1),
(5, 'Dua Lipa', 2),
(6, 'Cork Hurling Team', 3),
(7, 'BTS', 4),
(8, 'Foo Fighters', 5),
(9, 'BLACKPINK', 4),
(10, 'Imagine Dragons', 2),
(11, 'Arctic Monkeys', 5);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `booking_made_date` date NOT NULL,
  `booking_ref` varchar(255) NOT NULL,
  `total_price_paid` decimal(10,2) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `booking_made_date`, `booking_ref`, `total_price_paid`, `customer_id`) VALUES
(1, '2024-11-01', 'REF12345', '100.50', 1),
(2, '2024-11-05', 'REF12346', '200.00', 2),
(3, '2024-11-10', 'REF12347', '150.75', 1),
(4, '2024-11-15', 'REF12348', '300.25', 2),
(5, '2024-11-20', 'REF12349', '120.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `booking_line_item`
--

CREATE TABLE `booking_line_item` (
  `booking_line_item_id` int(11) NOT NULL,
  `line_item_name` varchar(255) NOT NULL,
  `line_item_desc` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking_line_item`
--

INSERT INTO `booking_line_item` (`booking_line_item_id`, `line_item_name`, `line_item_desc`, `price`, `currency_id`, `payment_type_id`, `booking_id`) VALUES
(1, 'Rocking Rory', 'Premium seat ticket for Rory Gallagher Tribute', '50.00', 1, 1, 1),
(2, 'Open Night Comedy', 'Regular seat ticket for Open Night Comedy', '30.00', 2, 1, 2),
(3, 'Faulty Towers Westend Play', 'VIP ticket for Faulty Towers', '100.00', 1, 2, 3),
(4, 'Disney Hercules', 'Discounted ticket for Hercules', '25.00', 3, 2, 4),
(5, 'Robbie Williams', 'Standard ticket for Robbie Williams', '40.00', 2, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL,
  `region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`, `region_id`) VALUES
(1, 'Belfast', 1),
(2, 'Cork', 2),
(7, 'Dublin', 2),
(8, 'London', 10);

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(255) NOT NULL,
  `currency_name` varchar(255) NOT NULL,
  `currency_symbol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`currency_id`, `currency_code`, `currency_name`, `currency_symbol`) VALUES
(1, 'USD', 'United States Dollar', '$'),
(2, 'EUR', 'Euro', '€'),
(3, 'GBP', 'British Pound', '£');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email_address` varchar(355) NOT NULL,
  `password` varbinary(255) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `email_address`, `password`, `address_id`) VALUES
(1, 'John', 'Murphy', 'jmurphy@gmail.com', 0x68617368656470617373776f7264313233, 1),
(2, 'Siobhán', 'Lordan', 'lordsiobh@hotmail.com', 0x6563633961636164353963613239646338666332383165376262326132343733323161303764356661313366333963326230656337323861, 2);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `availability` int(11) NOT NULL,
  `venue_id` int(11) NOT NULL,
  `event_date_id` int(11) NOT NULL,
  `event_time_id` int(11) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `event_name`, `capacity`, `availability`, `venue_id`, `event_date_id`, `event_time_id`, `event_type_id`, `artist_id`) VALUES
(4, 'Greatest Hits Tour', 5000, 124, 1, 4, 7, 1, 4),
(5, 'Radical Optimism Tour', 10000, 400, 2, 4, 6, 1, 5),
(6, 'All Ireland Hurling Final', 80000, 200, 4, 4, 5, 2, 6),
(7, 'Foo Fighters Tour', 5000, 14, 3, 4, 7, 1, 8),
(8, 'K-Pop Showcase', 10000, 400, 5, 4, 6, 1, 9),
(9, 'Imagine Dragons Tour', 17000, 200, 6, 4, 5, 1, 10),
(10, 'The Car Tour', 8000, 2000, 4, 8, 8, 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `event_date`
--

CREATE TABLE `event_date` (
  `event_date_id` int(11) NOT NULL,
  `event_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `event_date`
--

INSERT INTO `event_date` (`event_date_id`, `event_date`) VALUES
(4, '2024-12-01'),
(5, '2024-12-05'),
(6, '2024-12-10'),
(7, '2024-12-15'),
(8, '2024-12-20');

-- --------------------------------------------------------

--
-- Table structure for table `event_image`
--

CREATE TABLE `event_image` (
  `event_image_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_section`
--

CREATE TABLE `event_section` (
  `event_section_id` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_section_price`
--

CREATE TABLE `event_section_price` (
  `event_section_price_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `event_section_id` int(11) NOT NULL,
  `ticket_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_section_seat`
--

CREATE TABLE `event_section_seat` (
  `event_section_seat_id` int(11) NOT NULL,
  `seat_available` tinyint(1) NOT NULL,
  `event_section_id` int(11) NOT NULL,
  `seat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_time`
--

CREATE TABLE `event_time` (
  `event_time_id` int(11) NOT NULL,
  `event_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `event_time`
--

INSERT INTO `event_time` (`event_time_id`, `event_time`) VALUES
(4, '10:00:00'),
(5, '12:00:00'),
(6, '15:00:00'),
(7, '18:00:00'),
(8, '21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `event_type`
--

CREATE TABLE `event_type` (
  `event_type_id` int(11) NOT NULL,
  `event_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `event_type`
--

INSERT INTO `event_type` (`event_type_id`, `event_type`) VALUES
(1, 'Music'),
(2, 'Sport'),
(3, 'Arts, Theatre & Comedy'),
(4, 'Family & Attractions');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_id`, `genre_name`) VALUES
(1, 'Indie'),
(2, 'Pop'),
(3, 'Hurling'),
(4, 'K-Pop'),
(5, 'Rock');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `image_id` int(11) NOT NULL,
  `image_url` varchar(2500) NOT NULL,
  `image_alt_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`image_id`, `image_url`, `image_alt_text`) VALUES
(1, 'https://example.com/image1.jpg', 'Image 1 description'),
(2, 'https://example.com/image2.jpg', 'Image 2 description'),
(3, 'https://example.com/image3.jpg', 'Image 3 description'),
(4, 'https://example.com/image4.jpg', 'Image 4 description'),
(5, 'https://example.com/image5.jpg', 'Image 5 description');

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE `payment_type` (
  `payment_type_id` int(11) NOT NULL,
  `payment_type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_type`
--

INSERT INTO `payment_type` (`payment_type_id`, `payment_type_name`) VALUES
(1, 'VISA'),
(2, 'PayPal'),
(3, 'Mastercard'),
(4, 'Gift Voucher');

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `region_id` int(11) NOT NULL,
  `region_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`region_id`, `region_name`) VALUES
(1, 'Northern Ireland'),
(2, 'Ireland'),
(9, 'All of United Kingdom'),
(10, 'London'),
(11, 'South'),
(12, 'Midlands & Central'),
(13, 'Wales & North West'),
(14, 'North & North East'),
(15, 'Scotland');

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `seat_id` int(11) NOT NULL,
  `seat_number` int(11) NOT NULL,
  `seat_row` varchar(255) NOT NULL,
  `seat_accessible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seat`
--

INSERT INTO `seat` (`seat_id`, `seat_number`, `seat_row`, `seat_accessible`) VALUES
(1, 1, 'A', 1),
(2, 2, 'A', 0),
(3, 3, 'A', 0),
(4, 4, 'B', 1),
(5, 5, 'B', 0),
(6, 6, 'B', 0),
(7, 7, 'C', 1),
(8, 8, 'C', 0),
(9, 9, 'C', 0),
(10, 10, 'D', 1),
(11, 101, 'D', 0),
(12, 102, 'D', 1),
(13, 103, 'E', 0),
(14, 104, 'E', 1),
(15, 105, 'F', 0),
(16, 106, 'F', 1),
(17, 107, 'G', 0),
(18, 108, 'G', 1),
(19, 109, 'D', 0),
(20, 110, 'D', 1),
(21, 111, 'E', 0),
(22, 112, 'E', 1),
(23, 113, 'F', 0),
(24, 114, 'F', 1),
(25, 115, 'G', 0),
(26, 116, 'G', 1),
(27, 117, 'D', 0),
(28, 118, 'D', 1),
(29, 119, 'E', 0),
(30, 120, 'E', 1),
(31, 11, 'E', 0),
(32, 12, 'E', 1),
(33, 13, 'F', 0),
(34, 14, 'F', 1),
(35, 15, 'G', 0),
(36, 16, 'G', 1),
(37, 17, 'D', 0),
(38, 18, 'D', 1),
(39, 19, 'E', 0),
(40, 20, 'E', 1);

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `section_id` int(11) NOT NULL,
  `section_name` varchar(255) NOT NULL,
  `section_desc` text NOT NULL,
  `venue_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `price_paid` decimal(10,2) NOT NULL,
  `reseller` tinyint(1) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `event_section_price_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_type`
--

CREATE TABLE `ticket_type` (
  `ticket_type_id` int(11) NOT NULL,
  `ticket_type_name` varchar(255) NOT NULL,
  `ticket_type_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket_type`
--

INSERT INTO `ticket_type` (`ticket_type_id`, `ticket_type_name`, `ticket_type_desc`) VALUES
(1, 'General Admission', 'Standard entry with no seat reservation.'),
(2, 'VIP', 'Premium access with reserved seating and additional perks.'),
(3, 'Student', 'Discounted ticket for students with valid ID.'),
(4, 'Early Bird', 'Discounted ticket for early purchases, limited availability.'),
(5, 'Group', 'Special pricing for groups of 10 or more attendees.');

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `venue_id` int(11) NOT NULL,
  `venue_name` varchar(255) NOT NULL,
  `venue_information` text NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`venue_id`, `venue_name`, `venue_information`, `address_id`) VALUES
(1, 'Waterfront', 'A popular venue in Belfast.', 3),
(2, 'SSE Arena', 'A historic venue in Belfast.', 4),
(3, 'Ulster Hall', 'An iconic venue in Belfast.', 5),
(4, 'Croke Park', 'A cultural venue in Dublin. The Home of GAA', 6),
(5, 'Vicar Street', 'A vibrant venue in Dublin.', 7),
(6, 'Cork Opera House', 'A scenic venue in Cork.', 8),
(7, 'Crane Lane', 'An intimate venue in Cork.', 9),
(8, 'Tileyard', 'A renowned venue in London.', 10),
(9, 'Royal Albert Hall', 'A central venue in London.', 11);

-- --------------------------------------------------------

--
-- Table structure for table `venue_image`
--

CREATE TABLE `venue_image` (
  `venue_image_id` int(11) NOT NULL,
  `venue_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `venue_image`
--

INSERT INTO `venue_image` (`venue_image_id`, `venue_id`, `image_id`) VALUES
(11, 6, 1),
(12, 7, 2),
(13, 4, 3),
(14, 9, 4),
(15, 2, 5),
(16, 8, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `FK_city_city_id` (`city_id`);

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artist_id`),
  ADD KEY `FK_genre_genre_id` (`genre_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `FK_customer_customer_id` (`customer_id`);

--
-- Indexes for table `booking_line_item`
--
ALTER TABLE `booking_line_item`
  ADD PRIMARY KEY (`booking_line_item_id`),
  ADD KEY `FK_currency_currency_id3` (`currency_id`),
  ADD KEY `FK_payment_type_payment_type_id` (`payment_type_id`),
  ADD KEY `FK_booking_booking_id` (`booking_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `FK_region_region_id` (`region_id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `FK_address_address_id` (`address_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `FK_venue_venue_id2` (`venue_id`),
  ADD KEY `FK_artist_artist_id` (`artist_id`),
  ADD KEY `FK_event_time_event_time_id` (`event_time_id`),
  ADD KEY `FK_event_type_event_type_id` (`event_type_id`),
  ADD KEY `FK_event_date_event_date_id` (`event_date_id`);

--
-- Indexes for table `event_date`
--
ALTER TABLE `event_date`
  ADD PRIMARY KEY (`event_date_id`);

--
-- Indexes for table `event_image`
--
ALTER TABLE `event_image`
  ADD PRIMARY KEY (`event_image_id`),
  ADD KEY `FK_image_image_id2` (`image_id`),
  ADD KEY `FK_event_event_id` (`event_id`);

--
-- Indexes for table `event_section`
--
ALTER TABLE `event_section`
  ADD PRIMARY KEY (`event_section_id`),
  ADD KEY `FK_event_event_id2` (`event_id`),
  ADD KEY `FK_section_section_id2` (`section_id`);

--
-- Indexes for table `event_section_price`
--
ALTER TABLE `event_section_price`
  ADD PRIMARY KEY (`event_section_price_id`),
  ADD KEY `FK_currency_currency_id` (`currency_id`),
  ADD KEY `FK_event_section_event_section_id` (`event_section_id`),
  ADD KEY `FK_ticket_type_ticket_type_id` (`ticket_type_id`);

--
-- Indexes for table `event_section_seat`
--
ALTER TABLE `event_section_seat`
  ADD PRIMARY KEY (`event_section_seat_id`),
  ADD KEY `FK_seat_seat_id` (`seat_id`),
  ADD KEY `FK_event_section_event_section_id2` (`event_section_id`);

--
-- Indexes for table `event_time`
--
ALTER TABLE `event_time`
  ADD PRIMARY KEY (`event_time_id`);

--
-- Indexes for table `event_type`
--
ALTER TABLE `event_type`
  ADD PRIMARY KEY (`event_type_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`payment_type_id`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`region_id`);

--
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`seat_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `FK_venue_venue_id3` (`venue_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `FK_currency_currency_id2` (`currency_id`),
  ADD KEY `FK_event_section_price_event_section_price_id` (`event_section_price_id`),
  ADD KEY `FK_booking_booking_id2` (`booking_id`);

--
-- Indexes for table `ticket_type`
--
ALTER TABLE `ticket_type`
  ADD PRIMARY KEY (`ticket_type_id`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`venue_id`),
  ADD KEY `FK_address_address_id2` (`address_id`);

--
-- Indexes for table `venue_image`
--
ALTER TABLE `venue_image`
  ADD PRIMARY KEY (`venue_image_id`),
  ADD KEY `FK_image_image_id` (`image_id`),
  ADD KEY `FK_venue_venue_id` (`venue_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `booking_line_item`
--
ALTER TABLE `booking_line_item`
  MODIFY `booking_line_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `event_date`
--
ALTER TABLE `event_date`
  MODIFY `event_date_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `event_image`
--
ALTER TABLE `event_image`
  MODIFY `event_image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_section`
--
ALTER TABLE `event_section`
  MODIFY `event_section_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_section_price`
--
ALTER TABLE `event_section_price`
  MODIFY `event_section_price_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_section_seat`
--
ALTER TABLE `event_section_seat`
  MODIFY `event_section_seat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_time`
--
ALTER TABLE `event_time`
  MODIFY `event_time_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `event_type`
--
ALTER TABLE `event_type`
  MODIFY `event_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `payment_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `region_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `seat`
--
ALTER TABLE `seat`
  MODIFY `seat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_type`
--
ALTER TABLE `ticket_type`
  MODIFY `ticket_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `venue`
--
ALTER TABLE `venue`
  MODIFY `venue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `venue_image`
--
ALTER TABLE `venue_image`
  MODIFY `venue_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_city_city_id` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`);

--
-- Constraints for table `artist`
--
ALTER TABLE `artist`
  ADD CONSTRAINT `FK_genre_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FK_customer_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `booking_line_item`
--
ALTER TABLE `booking_line_item`
  ADD CONSTRAINT `FK_booking_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`),
  ADD CONSTRAINT `FK_currency_currency_id3` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`),
  ADD CONSTRAINT `FK_payment_type_payment_type_id` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`payment_type_id`);

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `FK_region_region_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `FK_artist_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`),
  ADD CONSTRAINT `FK_event_date_event_date_id` FOREIGN KEY (`event_date_id`) REFERENCES `event_date` (`event_date_id`),
  ADD CONSTRAINT `FK_event_time_event_time_id` FOREIGN KEY (`event_time_id`) REFERENCES `event_time` (`event_time_id`),
  ADD CONSTRAINT `FK_event_type_event_type_id` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`event_type_id`),
  ADD CONSTRAINT `FK_venue_venue_id2` FOREIGN KEY (`venue_id`) REFERENCES `venue` (`venue_id`);

--
-- Constraints for table `event_image`
--
ALTER TABLE `event_image`
  ADD CONSTRAINT `FK_event_event_id` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`),
  ADD CONSTRAINT `FK_image_image_id2` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`);

--
-- Constraints for table `event_section`
--
ALTER TABLE `event_section`
  ADD CONSTRAINT `FK_event_event_id2` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`),
  ADD CONSTRAINT `FK_section_section_id2` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`);

--
-- Constraints for table `event_section_price`
--
ALTER TABLE `event_section_price`
  ADD CONSTRAINT `FK_currency_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`),
  ADD CONSTRAINT `FK_event_section_event_section_id` FOREIGN KEY (`event_section_id`) REFERENCES `event_section` (`event_section_id`),
  ADD CONSTRAINT `FK_ticket_type_ticket_type_id` FOREIGN KEY (`ticket_type_id`) REFERENCES `ticket_type` (`ticket_type_id`);

--
-- Constraints for table `event_section_seat`
--
ALTER TABLE `event_section_seat`
  ADD CONSTRAINT `FK_event_section_event_section_id2` FOREIGN KEY (`event_section_id`) REFERENCES `event_section` (`event_section_id`),
  ADD CONSTRAINT `FK_seat_seat_id` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`);

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `FK_venue_venue_id3` FOREIGN KEY (`venue_id`) REFERENCES `venue` (`venue_id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `FK_booking_booking_id2` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`),
  ADD CONSTRAINT `FK_currency_currency_id2` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`),
  ADD CONSTRAINT `FK_event_section_price_event_section_price_id` FOREIGN KEY (`event_section_price_id`) REFERENCES `event_section_price` (`event_section_price_id`);

--
-- Constraints for table `venue`
--
ALTER TABLE `venue`
  ADD CONSTRAINT `FK_address_address_id2` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `venue_image`
--
ALTER TABLE `venue_image`
  ADD CONSTRAINT `FK_image_image_id` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`),
  ADD CONSTRAINT `FK_venue_venue_id` FOREIGN KEY (`venue_id`) REFERENCES `venue` (`venue_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
