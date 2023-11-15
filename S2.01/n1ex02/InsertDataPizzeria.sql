-- Inserción de datos en la tabla "province"
INSERT INTO `province` (`province_id`, `name`)
VALUES
(1, 'Barcelona'),
(2, 'Barcelona');

-- Inserción de datos en la tabla "locality"
INSERT INTO `locality` (`locality_id`, `name`, `province`)
VALUES
(1, 'Barcelona', 1),
(2, 'Badalona', 2);

-- Inserción de datos en la tabla "customer"
INSERT INTO `customer` (`customer_id`, `name`, `surnames`, `street`, `street_num`, `floor`, `door`, `postal_code`, `phone_num`, `locality`)
VALUES
(1, 'Juan', 'Garcia Vazquez', 'Street falsaBarcelona', '123', 2, 'A', 12345, 555555555, 1),
(2, 'Pepe', 'Sanchez Moteno', 'Street falsaBadalona', '321', 1, 'B', 543221, 65245555, 2);

-- Inserción de datos en la tabla "store"
INSERT INTO `store` (`store_id`, `locality`, `street`, `street_num`, `postal_code`)
VALUES
(1, 1, 'Street falsa', '789', 34567),
(2, 2, 'Street falsaBadalona', '101', 45678);

-- Inserción de datos en la tabla "product"
INSERT INTO `product` (`product_id`, `name`, `description`, `image`, `price`)
VALUES
(1, 'BigBurger', 'Hamburguesa grande y sabrosa', NULL, 9.99),
(2, 'CocaCola', 'Refresco rico', NULL, 3.99),
(3, 'Pizza bbq', 'Picsa rica', NULL, 12.99),
(4, 'Pizza Texas', 'Refresco rico', NULL, 15.99);

-- Inserción de datos en la tabla "hamburger"
INSERT INTO `hamburger` (`product_id`)
VALUES (1);

-- Inserción de datos en la tabla "drink"
INSERT INTO `drink` (`product_id`)
VALUES (2);

-- Inserción de datos en la tabla "category"
INSERT INTO `category` (`category_id`, `category_name`)
VALUES
(1, 'Pizza Classica'),
(2, 'Pizza Premium');

-- Inserción de datos en la tabla "pizza"
INSERT INTO `pizza` (`product_id`, `category`)
VALUES
(3, 1),
(4, 2);

-- Inserción de datos en la tabla "worker"
INSERT INTO `worker` (`worker_id`, `NIF`, `name`, `surnames`, `province`, `location`, `street`, `street_num`, `floor`, `door`, `postal_code`, `phone_num`, `store`)
VALUES
(1, 123456789, 'Carlos', 'Benages Salamanca', 'Barcelona', 'Barcelona', 'Delivery Street ', '101', 3, 'C', 34567, 777777777, 1),
(2, 987654321, 'Pepe', 'Palomo Garcia', 'Badalona', 'Badalona', 'Cook Street', '202', 2, 'D', 45678, 888888888, 2);

-- Inserción de datos en la tabla "cook"
INSERT INTO `cook` (`worker_id`)
VALUES (2);

-- Inserción de datos en la tabla "deliveryMan"
INSERT INTO `deliveryMan` (`worker_id`)
VALUES (1);

-- Inserción de datos en la tabla "order"
INSERT INTO `order` (`order_id`, `product`, `date`, `price`, `quantity`, `cook`, `customer_id`, `store`)
VALUES
(1, 1, '2023-11-06 08:00:00', 19.98, 2, 2, 1, 1),
(2, 4, '2023-11-07 09:00:00', 15.99, 1, 2, 2, 2),
(3, 2, '2023-11-06 08:00:00', 3.99, 1, 2, 1, 1);

-- Inserción de datos en la tabla "orderToTake"
INSERT INTO `orderToTake` (`order_id`, `product`)
VALUES
(1, 1);

-- Inserción de datos en la tabla "orderToDelivery"
INSERT INTO `orderToDelivery` (`order_id`, `product`, `delivery_time`, `deliveryMan_id`)
VALUES
(2, 1, '2023-11-08 10:00:00', 1);
