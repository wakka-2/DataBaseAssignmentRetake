-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2024 at 02:22 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online-shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `password` varchar(100) NOT NULL,
  `address` text DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `full_name`, `email`, `last_login`, `password`, `address`, `telephone`) VALUES
(1, 'John Doe', 'john@example.com', '2024-09-01 10:34:56', 'password123', '123 Main St, Cityville', '123-456-7890'),
(2, 'Jane Smith', 'jane@example.com', '2024-09-01 11:22:10', 'password456', '456 Oak St, Townsville', '987-654-3210'),
(3, 'Michael Johnson', 'michaelj@example.com', '2024-09-02 07:15:30', 'passmike', '789 Pine St, Metropolis', '111-222-3333'),
(4, 'Emily Davis', 'emily@example.com', '2024-09-03 08:50:25', 'passemily', '321 Maple St, Rivertown', '444-555-6666'),
(5, 'Olivia Brown', 'oliviab@example.com', '2024-09-04 06:45:00', 'passolivia', '222 Elm St, Capital City', '777-888-9999'),
(6, 'James Williams', 'james@example.com', '2024-09-05 09:10:10', 'passjames', '654 Spruce St, Coastline', '000-111-2222'),
(7, 'Sophia Martinez', 'sophia@example.com', '2024-09-06 12:12:40', 'passsophia', '987 Cedar St, Baytown', '333-444-5555'),
(8, 'Liam Miller', 'liam@example.com', '2024-09-07 13:18:20', 'passliam', '159 Birch St, Uptown', '666-777-8888'),
(9, 'Mia Wilson', 'mia@example.com', '2024-09-08 07:25:00', 'passmia', '753 Poplar St, Seaside', '123-987-6543'),
(10, 'Noah Taylor', 'noah@example.com', '2024-09-09 14:32:50', 'passnoah', '951 Willow St, Lakeside', '456-789-0123');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `total_amount`) VALUES
(1, 1, '2024-08-01 08:15:00', 159.98),
(2, 2, '2024-09-01 09:25:00', 199.99),
(3, 3, '2024-09-02 10:30:00', 999.99),
(4, 4, '2024-09-02 11:40:00', 89.99),
(5, 5, '2024-09-03 12:50:00', 49.99),
(6, 6, '2024-09-03 13:00:00', 249.99),
(7, 7, '2024-09-04 14:10:00', 59.99),
(8, 8, '2024-09-04 15:20:00', 19.99),
(9, 9, '2024-09-05 16:30:00', 149.99),
(10, 10, '2024-09-05 17:40:00', 129.99);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `price`, `description`) VALUES
(1, 1, 1, 2, 79.99, 'Two pairs of Nike Air Max running shoes, size 42'),
(2, 1, 3, 1, 199.99, 'Leather Jacket, black, size M'),
(3, 2, 2, 1, 89.99, 'Adidas Sneakers, white, size 44'),
(4, 3, 5, 1, 49.99, 'Levi\'s Jeans, blue, size 32'),
(5, 4, 6, 1, 249.99, 'Samsung Galaxy Watch, black, 42mm'),
(6, 5, 7, 3, 19.99, '3 Zara T-shirts, white, size L'),
(7, 6, 8, 1, 149.99, 'Sony wireless headphones, black'),
(8, 7, 4, 2, 59.99, 'Two Puma backpacks, black'),
(9, 8, 9, 1, 129.99, 'H&M Evening dress, red, size S'),
(10, 9, 10, 1, 999.99, 'Apple iPhone 13, black, 128GB');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `supplier_id`, `product_description`, `product_price`, `product_category`) VALUES
(1, 'Running Shoes', 1, 'High-quality running shoes for athletes.', 79.99, 'Sportswear'),
(2, 'Leather Jacket', 4, 'Genuine leather jacket for winter.', 199.99, 'Fashion'),
(3, 'Smartphone', 5, 'Latest Apple iPhone with advanced features.', 999.99, 'Electronics'),
(4, 'Sneakers', 2, 'Comfortable sneakers for everyday wear.', 89.99, 'Footwear'),
(5, 'Jeans', 8, 'Stylish denim jeans.', 49.99, 'Clothing'),
(6, 'Smartwatch', 6, 'Feature-packed smartwatch with fitness tracking.', 249.99, 'Electronics'),
(7, 'Backpack', 7, 'Durable backpack for travel.', 59.99, 'Accessories'),
(8, 'T-shirt', 9, 'Trendy T-shirt with unique prints.', 19.99, 'Clothing'),
(9, 'Headphones', 7, 'Noise-cancelling wireless headphones.', 149.99, 'Electronics'),
(10, 'Dress', 10, 'Elegant evening dress.', 129.99, 'Fashion');

-- --------------------------------------------------------

--
-- Table structure for table `product_comments`
--

CREATE TABLE `product_comments` (
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `comment` text NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_comments`
--

INSERT INTO `product_comments` (`comment_id`, `product_id`, `comment`, `customer_id`, `created_at`) VALUES
(1, 1, 'These running shoes are very comfortable!', 1, '2024-09-25 22:21:28'),
(2, 1, 'Great shoes for the price.', 2, '2024-09-25 22:21:28'),
(3, 2, 'The leather jacket is high-quality, but pricey.', 3, '2024-09-25 22:21:28'),
(4, 3, 'The iPhone is great, but battery life could be better.', 4, '2024-09-25 22:21:28'),
(5, 4, 'Sneakers are decent for everyday wear.', 5, '2024-09-25 22:21:28'),
(6, 5, 'Good fit and comfortable jeans.', 6, '2024-09-25 22:21:28'),
(7, 6, 'Smartwatch is amazing, love the fitness features.', 7, '2024-09-25 22:21:28'),
(8, 7, 'This backpack fits everything I need for my trip.', 8, '2024-09-25 22:21:28'),
(9, 8, 'T-shirt has a great design, love the print!', 9, '2024-09-25 22:21:28'),
(10, 9, 'The headphones have excellent sound quality.', 10, '2024-09-25 22:21:28');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `image_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_url` text NOT NULL,
  `is_thumbnail` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`image_id`, `product_id`, `image_url`, `is_thumbnail`) VALUES
(1, 1, 'images/running_shoes_1.jpg', 1),
(2, 1, 'images/running_shoes_2.jpg', 0),
(3, 2, 'images/leather_jacket_1.jpg', 1),
(4, 3, 'images/smartphone_1.jpg', 1),
(5, 4, 'images/sneakers_1.jpg', 1),
(6, 5, 'images/jeans_1.jpg', 1),
(7, 6, 'images/smartwatch_1.jpg', 1),
(8, 7, 'images/backpack_1.jpg', 1),
(9, 8, 'images/tshirt_1.jpg', 1),
(10, 9, 'images/headphones_1.jpg', 1),
(11, 10, 'images/dress_1.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE `product_tags` (
  `product_tag_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `tag` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_tags`
--

INSERT INTO `product_tags` (`product_tag_id`, `product_id`, `tag`) VALUES
(1, 1, 'running'),
(2, 1, 'sports'),
(4, 2, 'fashion'),
(3, 2, 'leather'),
(6, 3, 'electronics'),
(5, 3, 'smartphone'),
(8, 4, 'footwear'),
(7, 4, 'sneakers'),
(10, 5, 'denim'),
(9, 5, 'jeans'),
(11, 6, 'smartwatch'),
(12, 6, 'wearable'),
(13, 7, 'backpack'),
(14, 7, 'travel'),
(16, 8, 'fashion'),
(15, 8, 't-shirt'),
(18, 9, 'audio'),
(17, 9, 'headphones'),
(19, 10, 'dress'),
(20, 10, 'eveningwear');

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `return_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `return_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `returns`
--

INSERT INTO `returns` (`return_id`, `order_item_id`, `return_date`, `reason`) VALUES
(1, 1, '2024-09-01 08:30:00', 'Defective item'),
(2, 2, '2024-09-02 09:00:00', 'Wrong size'),
(3, 3, '2024-09-03 07:45:00', 'Not as described'),
(4, 4, '2024-09-04 13:20:00', 'Changed my mind'),
(5, 5, '2024-09-05 12:10:00', 'Item arrived late'),
(6, 6, '2024-09-06 11:00:00', 'Defective item'),
(7, 7, '2024-09-07 14:25:00', 'Wrong item sent'),
(8, 8, '2024-09-08 10:15:00', 'Not satisfied with quality'),
(9, 9, '2024-09-09 15:30:00', 'Changed my mind'),
(10, 10, '2024-09-10 16:00:00', 'Defective item');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `telephone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `telephone`) VALUES
(1, 'Samsung', '+012907389217'),
(2, 'Nike', '+012907389218'),
(3, 'Adidas', '+012907389215'),
(4, 'Puma', '+012907389214'),
(5, 'HP', '+012907389213'),
(6, 'Apple', '+012907389212'),
(7, 'Sony', '+012907389211'),
(8, 'Rebook', '+012907389218'),
(9, 'Zara', '+012907389210'),
(10, 'H&M', '+012907389219');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_comments`
--
ALTER TABLE `product_comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`product_tag_id`),
  ADD UNIQUE KEY `product_id` (`product_id`,`tag`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`return_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_comments`
--
ALTER TABLE `product_comments`
  MODIFY `comment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `image_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_tags`
--
ALTER TABLE `product_tags`
  MODIFY `product_tag_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `return_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
