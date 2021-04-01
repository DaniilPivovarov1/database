/*
	Создайте таблицу logs типа Archive.
	Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается время и дата создания записи,
	название таблицы, идентификатор первичного ключа и содержимое поля name.
*/
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
    `datetime` DATETIME NOT NULL DEFAULT NOW(),
    `table_name` VARCHAR(50) NOT NULL,
    catalogs_users_products_id BIGINT NOT NULL,
    catalogs_users__productsname VARCHAR(140) NOT NULL
) ENGINE=ARCHIVE;

DROP TRIGGER IF EXISTS `shop`.`catalogs_logs_insert`;
DELIMITER $$
USE `shop`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `catalogs_logs_insert` BEFORE INSERT ON `catalogs` FOR EACH ROW BEGIN
	DECLARE new_id BIGINT DEFAULT (SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = "shop" AND TABLE_NAME = "catalogs") + 1;
	INSERT `logs` (`table_name`, catalogs_users_products_id, catalogs_users_name) VALUES ('catalogs', new_id, NEW.`name`);
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS `shop`.`users_logs_insert`;

DELIMITER $$
USE `shop`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `users_logs_insert` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
	DECLARE new_id BIGINT DEFAULT (SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = "shop" AND TABLE_NAME = "users") + 1;
	INSERT `logs` (`table_name`, catalogs_users_products_id, catalogs_users_products_name) VALUES ('users', new_id, NEW.`name`);
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS `shop`.`products_logs_insert`;
DELIMITER $$
USE `shop`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `products_logs_insert` BEFORE INSERT ON `products` FOR EACH ROW BEGIN
	DECLARE new_id BIGINT DEFAULT (SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = "shop" AND TABLE_NAME = "products") + 1;
	INSERT `logs` (`table_name`, catalogs_users_products_id, catalogs_users_name) VALUES ('products', new_id, NEW.`name`);
END$$
DELIMITER ;
