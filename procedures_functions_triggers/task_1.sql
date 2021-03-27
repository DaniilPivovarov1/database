DROP FUNCTION IF EXISTS `hello`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `hello`() RETURNS char(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	declare hel CHAR(255);
	IF (RIGHT(NOW(), 8) BETWEEN '06:00:00' AND '12:00:00') THEN
		SET hel = 'Доброе утро';
	ELSEIF (RIGHT(NOW(), 8) BETWEEN '12:00:00' AND '18:00:00') THEN
		SET hel = 'Добрый день';
	ELSEIF (RIGHT(NOW(), 8) BETWEEN '18:00:00' AND '22:00:00') THEN
		SET hel = 'Добрый вечер';
	ELSE
		SET hel = 'Доброй ночи';
	END IF;
RETURN hel;
END$$

DELIMITER ;
;