-- Crear esquema:
CREATE DATABASE IF NOT EXISTS n1ex02 CHARACTER SET utf8mb4;
USE n1ex02;

-- Crear tablas:
CREATE TABLE `province` (
  `province_id` int PRIMARY KEY,
  `name` varchar(255)
);

CREATE TABLE `locality` (
  `locality_id` int PRIMARY KEY,
  `name` varchar(255),
  `province` int
);

CREATE TABLE `customer` (
  `customer_id` int PRIMARY KEY,
  `name` varchar(255),
  `surnames` varchar(255),
  `street` varchar(255),
  `street_num` varchar(255),
  `floor` int,
  `door` char,
  `postal_code` int,
  `phone_num` int,
  `locality` int
);

CREATE TABLE `store` (
  `store_id` int PRIMARY KEY,
  `locality` int,
  `street` varchar(255),
  `street_num` varchar(255),
  `postal_code` int
);

CREATE TABLE `order` (
  `order_id` int,
  `product` int,
  `date` datetime,
  `price` float,
  `quantity` int,
  `cook` int,
  `customer_id` int,
  `store` int,
  PRIMARY KEY (`order_id`, `product`)
);

CREATE TABLE `orderToTake` (
  `order_id` int,
  `product` int,
  PRIMARY KEY (`order_id`, `product`)
);

CREATE TABLE `orderToDelivery` (
  `order_id` int,
  `product` int,
  `delivery_time` timestamp,
  `deliveryMan_id` int,
  PRIMARY KEY (`order_id`, `product`)
);

CREATE TABLE `product` (
  `product_id` int PRIMARY KEY,
  `name` varchar(255),
  `description` varchar(255),
  `image` binary,
  `price` float
);

CREATE TABLE `hamburger` (
  `product_id` int PRIMARY KEY
);

CREATE TABLE `drink` (
  `product_id` int PRIMARY KEY
);

CREATE TABLE `pizza` (
  `product_id` int PRIMARY KEY,
  `category` int
);

CREATE TABLE `category` (
  `category_id` int PRIMARY KEY,
  `category_name` varchar(255)
);

CREATE TABLE `worker` (
  `worker_id` int PRIMARY KEY,
  `NIF` int,
  `name` varchar(255),
  `surnames` varchar(255),
  `province` varchar(255),
  `location` varchar(255),
  `street` varchar(255),
  `street_num` varchar(255),
  `floor` int,
  `door` char,
  `postal_code` int,
  `phone_num` int,
  `store` int
);

CREATE TABLE `cook` (
  `worker_id` int PRIMARY KEY
);

CREATE TABLE `deliveryMan` (
  `worker_id` int PRIMARY KEY
);

-- Crear Referencias
ALTER TABLE `locality` ADD FOREIGN KEY (`province`) REFERENCES `province` (`province_id`);

ALTER TABLE `customer` ADD FOREIGN KEY (`locality`) REFERENCES `locality` (`locality_id`);

ALTER TABLE `order` ADD FOREIGN KEY (`product`) REFERENCES `product` (`product_id`);

ALTER TABLE `order` ADD FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

ALTER TABLE `order` ADD FOREIGN KEY (`store`) REFERENCES `store` (`store_id`);

ALTER TABLE `order` ADD FOREIGN KEY (`cook`) REFERENCES `cook` (`worker_id`);

ALTER TABLE `pizza` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

ALTER TABLE `pizza` ADD FOREIGN KEY (`category`) REFERENCES `category` (`category_id`);

ALTER TABLE `hamburger` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

ALTER TABLE `drink` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

ALTER TABLE `store` ADD FOREIGN KEY (`locality`) REFERENCES `locality` (`locality_id`);

ALTER TABLE `worker` ADD FOREIGN KEY (`store`) REFERENCES `store` (`store_id`);

ALTER TABLE `cook` ADD FOREIGN KEY (`worker_id`) REFERENCES `worker` (`worker_id`);

ALTER TABLE `deliveryman` ADD FOREIGN KEY (`worker_id`) REFERENCES `worker` (`worker_id`);

ALTER TABLE `ordertotake` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`);

ALTER TABLE `ordertotake` ADD FOREIGN KEY (`product`) REFERENCES `order` (`product`);

ALTER TABLE `ordertodelivery` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`);

ALTER TABLE `ordertodelivery` ADD FOREIGN KEY (`product`) REFERENCES `order` (`product`);

ALTER TABLE `ordertodelivery` ADD FOREIGN KEY (`deliveryman_id`) REFERENCES `deliveryman` (`worker_id`);

-- inserts en la base de datos:
INSERT INTO `province` (`province_id`, `name`)
VALUES
(1, 'Barcelona'),
(2, 'Barcelona');

INSERT INTO `locality` (`locality_id`, `name`, `province`)
VALUES
(1, 'Barcelona', 1),
(2, 'Badalona', 2);

INSERT INTO `customer` (`customer_id`, `name`, `surnames`, `street`, `street_num`, `floor`, `door`, `postal_code`, `phone_num`, `locality`)
VALUES
(1, 'Juan', 'Garcia Vazquez', 'Street falsaBarcelona', '123', 2, 'A', 12345, 555555555, 1),
(2, 'Pepe', 'Sanchez Moteno', 'Street falsaBadalona', '321', 1, 'B', 543221, 65245555, 2);

INSERT INTO `store` (`store_id`, `locality`, `street`, `street_num`, `postal_code`)
VALUES
(1, 1, 'Street falsa', '789', 34567),
(2, 2, 'Street falsaBadalona', '101', 45678);

INSERT INTO `product` (`product_id`, `name`, `description`, `image`, `price`)
VALUES
(1, 'BigBurger', 'Hamburguesa grande y sabrosa', NULL, 9.99),
(2, 'CocaCola', 'Refresco rico', NULL, 3.99),
(3, 'Pizza bbq', 'Picsa rica', NULL, 12.99),
(4, 'Pizza Texas', 'Refresco rico', NULL, 15.99);

INSERT INTO `hamburger` (`product_id`)
VALUES (1);

INSERT INTO `drink` (`product_id`)
VALUES (2);

INSERT INTO `category` (`category_id`, `category_name`)
VALUES
(1, 'Pizza Classica'),
(2, 'Pizza Premium');

INSERT INTO `pizza` (`product_id`, `category`)
VALUES
(3, 1),
(4, 2);

INSERT INTO `worker` (`worker_id`, `NIF`, `name`, `surnames`, `province`, `location`, `street`, `street_num`, `floor`, `door`, `postal_code`, `phone_num`, `store`)
VALUES
(1, 123456789, 'Carlos', 'Benages Salamanca', 'Barcelona', 'Barcelona', 'Delivery Street ', '101', 3, 'C', 34567, 777777777, 1),
(2, 987654321, 'Pepe', 'Palomo Garcia', 'Badalona', 'Badalona', 'Cook Street', '202', 2, 'D', 45678, 888888888, 2);

INSERT INTO `cook` (`worker_id`)
VALUES (2);

INSERT INTO `deliveryMan` (`worker_id`)
VALUES (1);

INSERT INTO `order` (`order_id`, `product`, `date`, `price`, `quantity`, `cook`, `customer_id`, `store`)
VALUES
(1, 1, '2023-11-06 08:00:00', 19.98, 2, 2, 1, 1),
(2, 4, '2023-11-07 09:00:00', 15.99, 1, 2, 2, 2),
(3, 2, '2023-11-06 08:00:00', 3.99, 1, 2, 1, 1);

INSERT INTO `orderToTake` (`order_id`, `product`)
VALUES
(1, 1);

INSERT INTO `orderToDelivery` (`order_id`, `product`, `delivery_time`, `deliveryMan_id`)
VALUES
(2, 1, '2023-11-08 10:00:00', 1);
