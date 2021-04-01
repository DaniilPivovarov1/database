/*
	(по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.
*/

USE `shop`;
DROP procedure IF EXISTS `million_rows_insert`;
DELIMITER $$
USE `shop`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `million_rows_insert`()
BEGIN
	DECLARE count INT DEFAULT 1;
    WHILE count <= 1000000 DO
		INSERT users (`name`, birthday_at) VALUES ('Олег', '1990-10-05');
        SET count = count + 1;
	END WHILE;
END$$

DELIMITER ;
;
