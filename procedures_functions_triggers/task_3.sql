USE `shop`;
DROP function IF EXISTS `FIBONACCI`;

USE `shop`;
DROP function IF EXISTS `shop`.`FIBONACCI`;
;

DELIMITER $$
USE `shop`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `FIBONACCI`(num INT) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE pre_pre INT DEFAULT 0;
	DECLARE pre INT DEFAULT 1;
	DECLARE fib INT DEFAULT 1;
	DECLARE new_num INT DEFAULT 2;
	DECLARE ans INT DEFAULT 0;
    IF (num = 0) THEN
		SET fib = 0;
	ELSEIF (num = 1) THEN
		SET fib = 1;
	ELSE
        WHILE new_num != num DO
			SET new_num = new_num + 1;
            SET pre_pre = pre;
            SET pre = fib;
            SET fib = pre_pre + pre;
		END WHILE;
	END IF;
    SET ans = fib;
RETURN ans;
END$$

DELIMITER ;
;

