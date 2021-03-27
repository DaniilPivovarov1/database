DROP TRIGGER IF EXISTS `shop`.`products_BEFORE_INSERT`;

DELIMITER $$
USE `shop`$$
CREATE DEFINER = CURRENT_USER TRIGGER `shop`.`products_BEFORE_INSERT` BEFORE INSERT ON `products` FOR EACH ROW
BEGIN
	IF (NEW.`name` IS NULL) + (NEW.`description` IS NULL) = 2 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'At least one of two colums(name, description) must be filled!';
	END IF;
END$$
DELIMITER ;
DROP TRIGGER IF EXISTS `shop`.`products_BEFORE_UPDATE`;

DELIMITER $$
USE `shop`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `products_BEFORE_UPDATE` BEFORE UPDATE ON `products` FOR EACH ROW BEGIN
	IF (NEW.`name` IS NULL) + (NEW.`description` IS NULL) = 2 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'At least one of two colums(name, description) must be filled!';
	END IF;
END$$
DELIMITER ;
