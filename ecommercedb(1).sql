-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3308
-- Généré le : mar. 08 août 2023 à 15:46
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecommercedb`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `building_name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `street_no` varchar(255) DEFAULT NULL,
  `customer_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_total` double DEFAULT NULL,
  `customer_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_total`, `customer_customer_id`) VALUES
(10, NULL, NULL),
(12, NULL, NULL),
(14, NULL, NULL),
(16, NULL, NULL),
(18, NULL, NULL),
(20, 400, NULL),
(287, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cart_cart_items`
--

CREATE TABLE `cart_cart_items` (
  `cart_cart_id` int(11) NOT NULL,
  `cart_items_cart_item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `cart_item`
--

CREATE TABLE `cart_item` (
  `cart_item_id` int(11) NOT NULL,
  `cart_item_quantity` int(11) DEFAULT NULL,
  `cart_product_product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `cardcvv` varchar(255) DEFAULT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `card_validity` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `mobile_no` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `customer_cart_cart_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `customer`
--

INSERT INTO `customer` (`customer_id`, `created_on`, `cardcvv`, `card_number`, `card_validity`, `email_id`, `first_name`, `last_name`, `mobile_no`, `password`, `customer_cart_cart_id`) VALUES
(9, '2023-05-16 14:27:51', NULL, NULL, NULL, 'zakaria0@gmail.com', 'zakaria', 'ait katib', '06917260880', '123456', 10),
(11, '2023-05-16 14:50:07', NULL, NULL, NULL, '', 'zakaria', 'ait katib', '', '123456', 12),
(13, '2023-05-16 15:14:31', NULL, NULL, NULL, 'aaaaaafaaaaa@azzzzzzna.com', 'zakaria', 'name.value.text', 'name.value.text', 'azerty0', 14),
(15, '2023-05-16 15:19:57', NULL, NULL, NULL, 'aaaddda@azzzzzzna.com', 'zakaria', 'name.value.text', '1878357545', 'azerty0', 16),
(17, '2023-05-16 15:21:34', NULL, NULL, NULL, 'aaaddda@azzzzna.com', 'zakaria', 'name.value.text', '187835754', 'azerty0', 18),
(19, '2023-05-16 15:22:16', NULL, NULL, NULL, 'aaaddda@azzzna.com', 'zakaria', 'name.value.text', '123', '123', 20),
(286, '2023-06-02 17:00:49', NULL, NULL, NULL, 'zakariaa@gmail.com', 'zakaria', 'ait katib', '1234', '1234', 287);

-- --------------------------------------------------------

--
-- Structure de la table `customer_address_mapping`
--

CREATE TABLE `customer_address_mapping` (
  `customer_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `address_key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(376);

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) NOT NULL,
  `data` longblob DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `images` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id`, `data`, `name`, `product_id`, `images`) VALUES
(196, NULL, NULL, 366, 'https://res.cloudinary.com/dm32ciz26/image/upload/v1686905093/IPHONE%2014/uu35p8vcdi1agcxn80cz.png'),
(197, NULL, NULL, 367, 'https://res.cloudinary.com/dm32ciz26/image/upload/v1686905248/Macbook%20Air/gssqd0tcrohetxnk3wng.png'),
(198, NULL, NULL, 368, 'https://res.cloudinary.com/dm32ciz26/image/upload/v1686910715/air%20pods%20pro/vg4ougxprmbjldnmybsf.png'),
(201, NULL, NULL, 371, 'https://res.cloudinary.com/dm32ciz26/image/upload/v1686913809/Apple%20watch/eersmscs0dvbvrbjkc6p.png'),
(202, NULL, NULL, 372, 'https://res.cloudinary.com/dm32ciz26/image/upload/v1686932909/Lenovo%20thinkpad/v4lbiib8o20n4y2llc9a.png');

-- --------------------------------------------------------

--
-- Structure de la table `orderr`
--

CREATE TABLE `orderr` (
  `order_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `orderr_cart_items`
--

CREATE TABLE `orderr_cart_items` (
  `orderr_order_id` int(11) NOT NULL,
  `cart_items_cart_item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `order_status` varchar(255) NOT NULL,
  `total` double DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `orders_ordercart_items`
--

CREATE TABLE `orders_ordercart_items` (
  `order_order_id` int(11) NOT NULL,
  `ordercart_items_cart_item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `seller_seller_id` int(11) DEFAULT NULL,
  `qr_code` varchar(255) DEFAULT NULL,
  `is_liked` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`product_id`, `category`, `description`, `manufacturer`, `price`, `product_name`, `quantity`, `status`, `seller_seller_id`, `qr_code`, `is_liked`) VALUES
(366, 'MOBILES', '', ' ', 1500, 'IPHONE 14', 10, 'AVAILABLE', 161, NULL, b'1'),
(367, 'MOBILES', '', ' ', 2000, 'Macbook Air', 10, 'AVAILABLE', 161, NULL, b'1'),
(368, 'MOBILES', 'wireless earphpnes', ' ', 200, 'air pods pro', 10, 'AVAILABLE', 161, NULL, b'1'),
(371, 'MOBILES', 'smart watch', ' ', 1000, 'Apple watch', 10, 'AVAILABLE', 161, NULL, b'1'),
(372, 'MOBILES', 'px1', ' ', 1000, 'Lenovo thinkpad', 100, 'AVAILABLE', 161, NULL, b'1');

-- --------------------------------------------------------

--
-- Structure de la table `product_images`
--

CREATE TABLE `product_images` (
  `product_product_id` int(11) NOT NULL,
  `images_id` bigint(20) NOT NULL,
  `product_id` int(11) NOT NULL,
  `images` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `rating`
--

CREATE TABLE `rating` (
  `rating_id` varchar(255) NOT NULL,
  `rating` double NOT NULL,
  `user_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `ratings`
--

CREATE TABLE `ratings` (
  `product_id` int(11) NOT NULL,
  `ratings_rating_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `seller`
--

CREATE TABLE `seller` (
  `seller_id` int(11) NOT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `bank_account` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `seller`
--

INSERT INTO `seller` (`seller_id`, `email_id`, `first_name`, `last_name`, `mobile`, `password`, `bank_account`) VALUES
(144, 'zakaria@seller.com', 'zakaria', 'seller', '123456', '123456', '512353'),
(161, 'zakaria00@seller.com', 'zakaria', 'Ait katib', '1110', '111', '773767963297980123512353');

-- --------------------------------------------------------

--
-- Structure de la table `seller_product`
--

CREATE TABLE `seller_product` (
  `seller_seller_id` int(11) NOT NULL,
  `product_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `seller_product`
--

INSERT INTO `seller_product` (`seller_seller_id`, `product_product_id`) VALUES
(161, 366),
(161, 367),
(161, 368),
(161, 371),
(161, 372);

-- --------------------------------------------------------

--
-- Structure de la table `user_session`
--

CREATE TABLE `user_session` (
  `session_id` int(11) NOT NULL,
  `session_end_time` datetime DEFAULT NULL,
  `session_start_time` datetime DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user_session`
--

INSERT INTO `user_session` (`session_id`, `session_end_time`, `session_start_time`, `token`, `user_id`, `user_type`) VALUES
(299, '2137-07-01 12:21:34', '2023-06-02 20:21:34', 'customer_3cb149d9', 19, 'customer'),
(374, '2137-07-25 06:14:52', '2023-06-26 14:14:52', 'seller_b2427c1e', 144, 'seller'),
(375, '2137-09-06 02:53:32', '2023-08-08 10:53:32', 'seller_c48ce82c', 161, 'seller');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `FK214xlexe9f13rdbg15mw73h5a` (`customer_customer_id`);

--
-- Index pour la table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `FK9hpirec8qm60sghwjqvu0s6ic` (`customer_customer_id`);

--
-- Index pour la table `cart_cart_items`
--
ALTER TABLE `cart_cart_items`
  ADD UNIQUE KEY `UK_6hs3sdvi9h5hb5wtgo3vls83g` (`cart_items_cart_item_id`),
  ADD KEY `FK44su6cws1vcr95r0pn6md4jon` (`cart_cart_id`);

--
-- Index pour la table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `FKp1ifyfdsfaq48tuqs28xra1kw` (`cart_product_product_id`);

--
-- Index pour la table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `UK_p1nyof8six1aupbuhnlax3tkk` (`email_id`),
  ADD UNIQUE KEY `UK_48sdtr54m4p8083qlovv5kgu3` (`mobile_no`),
  ADD KEY `FKdfk6f90km8lu3re20sbm6pfms` (`customer_cart_cart_id`);

--
-- Index pour la table `customer_address_mapping`
--
ALTER TABLE `customer_address_mapping`
  ADD PRIMARY KEY (`customer_id`,`address_key`),
  ADD UNIQUE KEY `UK_o26f5oglpv8879niu125pagt2` (`address_id`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8sfun6tj1hqb85ed52o8mkqyh` (`product_id`);

--
-- Index pour la table `orderr`
--
ALTER TABLE `orderr`
  ADD PRIMARY KEY (`order_id`);

--
-- Index pour la table `orderr_cart_items`
--
ALTER TABLE `orderr_cart_items`
  ADD UNIQUE KEY `UK_djer4tw2v2i72abkmob1hryh9` (`cart_items_cart_item_id`),
  ADD KEY `FK71s6e4xpccups9w6j0q6fjgfs` (`orderr_order_id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `FKf5464gxwc32ongdvka2rtvw96` (`address_id`),
  ADD KEY `FK624gtjin3po807j3vix093tlf` (`customer_id`);

--
-- Index pour la table `orders_ordercart_items`
--
ALTER TABLE `orders_ordercart_items`
  ADD UNIQUE KEY `UK_fma27srpqyf3cvwruephdd7or` (`ordercart_items_cart_item_id`),
  ADD KEY `FK5of0bhae62onrn5to8sy80bo` (`order_order_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `FKrxwpm6lqvddjvyr9vjymxqnlb` (`seller_seller_id`);

--
-- Index pour la table `product_images`
--
ALTER TABLE `product_images`
  ADD UNIQUE KEY `UK_3701am6d8us1lbn5v3j75yinr` (`images_id`),
  ADD KEY `FKhrvh0hklwgllpdjlra6hx7p9u` (`product_product_id`),
  ADD KEY `FKi8jnqq05sk5nkma3pfp3ylqrt` (`product_id`);

--
-- Index pour la table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`rating_id`);

--
-- Index pour la table `ratings`
--
ALTER TABLE `ratings`
  ADD UNIQUE KEY `UK_q0nlhl3lu7d3bkcx1af2vnfv6` (`ratings_rating_id`),
  ADD KEY `FKpvx3j2rgs4g99r0rti2vf57or` (`product_id`);

--
-- Index pour la table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`seller_id`),
  ADD UNIQUE KEY `UK_5bkvm98bjre616hi1jniweeet` (`mobile`),
  ADD UNIQUE KEY `UK_oo27njgogd5779fn4pxo9sv7u` (`email_id`);

--
-- Index pour la table `seller_product`
--
ALTER TABLE `seller_product`
  ADD UNIQUE KEY `UK_j8hju5mgrwlh9ml6423mf4kjr` (`product_product_id`),
  ADD KEY `FK236mvsacc1n1mvfbcglfxu2bt` (`seller_seller_id`);

--
-- Index pour la table `user_session`
--
ALTER TABLE `user_session`
  ADD PRIMARY KEY (`session_id`),
  ADD UNIQUE KEY `UK_8gq4v10ega75qhpjsj51fh13v` (`token`),
  ADD UNIQUE KEY `UK_p9ixbu6uq0wk83xq3823cpbom` (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK214xlexe9f13rdbg15mw73h5a` FOREIGN KEY (`customer_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Contraintes pour la table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK9hpirec8qm60sghwjqvu0s6ic` FOREIGN KEY (`customer_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Contraintes pour la table `cart_cart_items`
--
ALTER TABLE `cart_cart_items`
  ADD CONSTRAINT `FK44su6cws1vcr95r0pn6md4jon` FOREIGN KEY (`cart_cart_id`) REFERENCES `cart` (`cart_id`),
  ADD CONSTRAINT `FKk9u7jarcxlxb896jsxjrhr2nn` FOREIGN KEY (`cart_items_cart_item_id`) REFERENCES `cart_item` (`cart_item_id`);

--
-- Contraintes pour la table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `FKp1ifyfdsfaq48tuqs28xra1kw` FOREIGN KEY (`cart_product_product_id`) REFERENCES `product` (`product_id`);

--
-- Contraintes pour la table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FKdfk6f90km8lu3re20sbm6pfms` FOREIGN KEY (`customer_cart_cart_id`) REFERENCES `cart` (`cart_id`);

--
-- Contraintes pour la table `customer_address_mapping`
--
ALTER TABLE `customer_address_mapping`
  ADD CONSTRAINT `FK3i4tethe1xoyrvrup8dvraijq` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `FKfqe84yiec5jt6is4dcccb1rv7` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);

--
-- Contraintes pour la table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `FK8sfun6tj1hqb85ed52o8mkqyh` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Contraintes pour la table `orderr_cart_items`
--
ALTER TABLE `orderr_cart_items`
  ADD CONSTRAINT `FK3mtal0emo88jowec1h7uhxm7l` FOREIGN KEY (`cart_items_cart_item_id`) REFERENCES `cart_item` (`cart_item_id`),
  ADD CONSTRAINT `FK71s6e4xpccups9w6j0q6fjgfs` FOREIGN KEY (`orderr_order_id`) REFERENCES `orderr` (`order_id`);

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK624gtjin3po807j3vix093tlf` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `FKf5464gxwc32ongdvka2rtvw96` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);

--
-- Contraintes pour la table `orders_ordercart_items`
--
ALTER TABLE `orders_ordercart_items`
  ADD CONSTRAINT `FK5of0bhae62onrn5to8sy80bo` FOREIGN KEY (`order_order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `FKj8lvkdvy81176i4t1doili4ec` FOREIGN KEY (`ordercart_items_cart_item_id`) REFERENCES `cart_item` (`cart_item_id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FKrxwpm6lqvddjvyr9vjymxqnlb` FOREIGN KEY (`seller_seller_id`) REFERENCES `seller` (`seller_id`);

--
-- Contraintes pour la table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `FKabu9ra4jn6gelbpfx7lllyx9q` FOREIGN KEY (`images_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `FKhrvh0hklwgllpdjlra6hx7p9u` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `FKi8jnqq05sk5nkma3pfp3ylqrt` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Contraintes pour la table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `FKf4kmrqhyp3hneaxu0pc8u8yjl` FOREIGN KEY (`ratings_rating_id`) REFERENCES `rating` (`rating_id`),
  ADD CONSTRAINT `FKpvx3j2rgs4g99r0rti2vf57or` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Contraintes pour la table `seller_product`
--
ALTER TABLE `seller_product`
  ADD CONSTRAINT `FK236mvsacc1n1mvfbcglfxu2bt` FOREIGN KEY (`seller_seller_id`) REFERENCES `seller` (`seller_id`),
  ADD CONSTRAINT `FKktoeahm8f5smvb2ln1lxpl0rt` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
