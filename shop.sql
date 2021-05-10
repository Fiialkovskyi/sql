-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 10 2021 г., 13:24
-- Версия сервера: 8.0.19
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `carts`
--

CREATE TABLE `carts` (
  `id_cart` int NOT NULL,
  `id_customer` int NOT NULL,
  `id_product` int NOT NULL,
  `id_option` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `carts`
--

INSERT INTO `carts` (`id_cart`, `id_customer`, `id_product`, `id_option`, `quantity`) VALUES
(1, 3, 6, 12, 2),
(2, 1, 8, 10, 1),
(3, 4, 4, 16, 1),
(4, 4, 2, 9, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id_category` int NOT NULL,
  `category_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id_category`, `category_name`) VALUES
(1, 'Авто, мото'),
(2, 'Айтишникам'),
(3, 'Интернет приколы'),
(4, 'Музыка'),
(5, 'Праздники'),
(6, 'Юмор');

-- --------------------------------------------------------

--
-- Структура таблицы `categories-products`
--

CREATE TABLE `categories-products` (
  `id_category` int NOT NULL,
  `id_product` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `categories-products`
--

INSERT INTO `categories-products` (`id_category`, `id_product`) VALUES
(1, 2),
(1, 1),
(2, 4),
(4, 6),
(5, 8),
(3, 7),
(6, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `colors`
--

CREATE TABLE `colors` (
  `id_color` int NOT NULL,
  `color_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `colors`
--

INSERT INTO `colors` (`id_color`, `color_name`) VALUES
(1, 'Белый'),
(2, 'Жёлтый'),
(3, 'Оранжевый'),
(4, 'Красный'),
(5, 'Бордовый'),
(6, 'Чёрный'),
(7, 'Серый');

-- --------------------------------------------------------

--
-- Структура таблицы `customers`
--

CREATE TABLE `customers` (
  `id_customer` int NOT NULL,
  `username` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `second_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `customers`
--

INSERT INTO `customers` (`id_customer`, `username`, `first_name`, `second_name`, `email`, `phone_number`) VALUES
(1, 'customer1', 'Ivan', 'Ivanov', 'ivan@gmail.com', '380661234567'),
(2, 'customer2', 'Petr', 'Petrov', 'petrov@yahoo.com', '380952345678'),
(3, 'testuser', 'testuser', 'testuser', 'testuser@gmail.com', '380660000001'),
(4, 'starship', 'Elon', 'Musk', 'starship@gmail.com', '380665555123');

-- --------------------------------------------------------

--
-- Структура таблицы `matherials`
--

CREATE TABLE `matherials` (
  `id_matherial` int NOT NULL,
  `matherial_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `matherials`
--

INSERT INTO `matherials` (`id_matherial`, `matherial_name`) VALUES
(1, 'хлопок 100%'),
(2, 'хлопок 90%, полиэстер 10%'),
(3, 'хлопок 95%, вискоза 5%');

-- --------------------------------------------------------

--
-- Структура таблицы `options`
--

CREATE TABLE `options` (
  `id_option` int NOT NULL,
  `id_color` int NOT NULL,
  `id_size` int NOT NULL,
  `id_type` int NOT NULL,
  `id_product` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `options`
--

INSERT INTO `options` (`id_option`, `id_color`, `id_size`, `id_type`, `id_product`) VALUES
(7, 2, 1, 3, 9),
(8, 4, 2, 1, 2),
(9, 1, 1, 4, 7),
(10, 1, 4, 5, 8),
(11, 5, 2, 3, 4),
(12, 7, 4, 5, 1),
(13, 7, 1, 4, 2),
(14, 3, 1, 5, 6),
(15, 6, 2, 5, 1),
(16, 2, 4, 2, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id_order` int NOT NULL,
  `id_customer` int NOT NULL,
  `id_order_status` int NOT NULL,
  `id_payment` int NOT NULL,
  `id_shipping_method` int NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number_for_delivery` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `order_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id_order`, `id_customer`, `id_order_status`, `id_payment`, `id_shipping_method`, `address`, `city`, `country`, `zip_code`, `phone_number_for_delivery`, `order_date`) VALUES
(1, 4, 1, 1, 1, '1st street 24a', 'Santa Monica, CA', 'United States', '012345', '0990001111', '2021-05-05 12:39:35'),
(2, 1, 7, 1, 1, 'Petra Sahaidachnoho 3a', 'Kyiv', 'Ukraine', '33245', '0505050123', '2021-05-05 12:39:35'),
(3, 2, 5, 1, 1, 'Lazuraya 1, kv 123', 'Mykolaiv', 'Ukraine', '86688', '380637894561', '2021-05-09 12:42:36'),
(4, 3, 4, 1, 1, 'Karpenko 12, kv 789', 'Mykolaiv', 'Ukraine', '96212', '380993213214', '2021-05-03 12:42:36');

-- --------------------------------------------------------

--
-- Структура таблицы `order_item`
--

CREATE TABLE `order_item` (
  `id_order_info` int NOT NULL,
  `id_order` int NOT NULL,
  `id_product` int NOT NULL,
  `id_option` int NOT NULL,
  `quantity` int NOT NULL,
  `total_cost` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `order_item`
--

INSERT INTO `order_item` (`id_order_info`, `id_order`, `id_product`, `id_option`, `quantity`, `total_cost`) VALUES
(1, 2, 4, 9, 1, 400.00),
(2, 4, 8, 9, 2, 998.00),
(3, 4, 9, 9, 1, 330.00),
(4, 2, 1, 8, 1, 350.00),
(5, 3, 2, 13, 1, 550.25),
(6, 3, 8, 13, 1, 499.00);

-- --------------------------------------------------------

--
-- Структура таблицы `order_status`
--

CREATE TABLE `order_status` (
  `id_order_status` int NOT NULL,
  `status_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `order_status`
--

INSERT INTO `order_status` (`id_order_status`, `status_name`) VALUES
(1, 'Новый'),
(2, 'Обработан'),
(3, 'В доставку'),
(4, 'Доставляется'),
(5, 'Готов'),
(6, 'Отказан'),
(7, 'Отменен'),
(8, 'Возврат');

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE `payments` (
  `id_payment` int NOT NULL,
  `payment_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `payments`
--

INSERT INTO `payments` (`id_payment`, `payment_name`, `is_active`) VALUES
(1, 'Наложенным платежом, при получении', 1),
(2, 'Банковской картой', 1),
(3, 'Рассрочка', 0),
(4, 'Интернет банкинг', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id_product` int NOT NULL,
  `id_matherial` int NOT NULL,
  `product_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_price` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id_product`, `id_matherial`, `product_name`, `product_price`) VALUES
(1, 2, 'Forza Motorsport', 350.00),
(2, 2, 'Formula 1', 550.25),
(4, 1, 'C++ forever', 400.00),
(6, 3, 'Aftermath Entertainment', 349.00),
(7, 1, 'Kermit the Frog', 250.00),
(8, 2, 'Independence Day', 499.00),
(9, 3, 'StandUp', 330.00);

-- --------------------------------------------------------

--
-- Структура таблицы `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id_shipping_method` int NOT NULL,
  `shipping_carrier` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_cost` double(10,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `shipping_methods`
--

INSERT INTO `shipping_methods` (`id_shipping_method`, `shipping_carrier`, `shipping_cost`, `is_active`) VALUES
(1, 'Новая почта', 0.00, 1),
(2, 'Укрпошта', 50.00, 1),
(3, 'Justin', 30.00, 1),
(4, 'Самовывоз', 0.00, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `sizes`
--

CREATE TABLE `sizes` (
  `id_size` int NOT NULL,
  `size_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `sizes`
--

INSERT INTO `sizes` (`id_size`, `size_name`) VALUES
(1, 'S'),
(2, 'M'),
(3, 'L'),
(4, 'XL');

-- --------------------------------------------------------

--
-- Структура таблицы `types`
--

CREATE TABLE `types` (
  `id_type` int NOT NULL,
  `type_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `price` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `types`
--

INSERT INTO `types` (`id_type`, `type_name`, `price`) VALUES
(1, 'Мужская', 250.00),
(2, 'Унисекс', 299.99),
(3, 'Женская', 250.00),
(4, 'Детская', 159.50),
(5, 'Длинный рукав', 899.90),
(6, 'Ringer', 560.00);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id_cart`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_option` (`id_option`),
  ADD KEY `id_product` (`id_product`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Индексы таблицы `categories-products`
--
ALTER TABLE `categories-products`
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_product` (`id_product`);

--
-- Индексы таблицы `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id_color`);

--
-- Индексы таблицы `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id_customer`);

--
-- Индексы таблицы `matherials`
--
ALTER TABLE `matherials`
  ADD PRIMARY KEY (`id_matherial`);

--
-- Индексы таблицы `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id_option`),
  ADD KEY `id_color` (`id_color`),
  ADD KEY `id_size` (`id_size`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `id_product` (`id_product`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_order_status` (`id_order_status`),
  ADD KEY `id_payment` (`id_payment`),
  ADD KEY `id_shipping_method` (`id_shipping_method`);

--
-- Индексы таблицы `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id_order_info`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_option` (`id_option`);

--
-- Индексы таблицы `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id_order_status`);

--
-- Индексы таблицы `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id_payment`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_matherial` (`id_matherial`);

--
-- Индексы таблицы `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id_shipping_method`);

--
-- Индексы таблицы `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id_size`);

--
-- Индексы таблицы `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id_type`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `carts`
--
ALTER TABLE `carts`
  MODIFY `id_cart` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `colors`
--
ALTER TABLE `colors`
  MODIFY `id_color` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `customers`
--
ALTER TABLE `customers`
  MODIFY `id_customer` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `matherials`
--
ALTER TABLE `matherials`
  MODIFY `id_matherial` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `options`
--
ALTER TABLE `options`
  MODIFY `id_option` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id_order_info` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id_order_status` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `payments`
--
ALTER TABLE `payments`
  MODIFY `id_payment` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id_shipping_method` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id_size` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `types`
--
ALTER TABLE `types`
  MODIFY `id_type` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id_customer`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`id_option`) REFERENCES `options` (`id_option`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `carts_ibfk_3` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `categories-products`
--
ALTER TABLE `categories-products`
  ADD CONSTRAINT `categories-products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `categories-products_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_ibfk_2` FOREIGN KEY (`id_color`) REFERENCES `colors` (`id_color`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `options_ibfk_3` FOREIGN KEY (`id_size`) REFERENCES `sizes` (`id_size`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `options_ibfk_4` FOREIGN KEY (`id_type`) REFERENCES `types` (`id_type`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `options_ibfk_5` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id_customer`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_order_status`) REFERENCES `order_status` (`id_order_status`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`id_payment`) REFERENCES `payments` (`id_payment`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`id_shipping_method`) REFERENCES `shipping_methods` (`id_shipping_method`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `order_item_ibfk_3` FOREIGN KEY (`id_option`) REFERENCES `options` (`id_option`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_matherial`) REFERENCES `matherials` (`id_matherial`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
