/*
Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/
SELECT 
    (SELECT COUNT(DAYNAME(CONCAT(YEAR(NOW()), RIGHT(birthday_at, 6)))) FROM `users` WHERE DAYNAME(CONCAT(YEAR(NOW()), RIGHT(birthday_at, 6))) = 'Monday') AS 'Monday',
    (SELECT COUNT(DAYNAME(CONCAT(YEAR(NOW()), RIGHT(birthday_at, 6)))) FROM `users` WHERE DAYNAME(CONCAT(YEAR(NOW()), RIGHT(birthday_at, 6))) = 'Tuesday') AS 'Tuesday',
    (SELECT COUNT(DAYNAME(CONCAT(YEAR(NOW()), RIGHT(birthday_at, 6)))) FROM `users` WHERE DAYNAME(CONCAT(YEAR(NOW()), RIGHT(birthday_at, 6))) = 'Wednesday') AS 'Wednesday',
    (SELECT COUNT(DAYNAME(CONCAT(YEAR(NOW()), RIGHT(birthday_at, 6)))) FROM `users` WHERE DAYNAME(CONCAT(YEAR(NOW()), RIGHT(birthday_at, 6))) = 'Thursday') AS 'Thursday',
    (SELECT COUNT(DAYNAME(CONCAT(YEAR(NOW()), RIGHT(birthday_at, 6)))) FROM `users` WHERE DAYNAME(CONCAT(YEAR(NOW()), RIGHT(birthday_at, 6))) = 'Friday') AS 'Friday',
    (SELECT COUNT(DAYNAME(CONCAT(YEAR(NOW()), RIGHT(birthday_at, 6)))) FROM `users` WHERE DAYNAME(CONCAT(YEAR(NOW()), RIGHT(birthday_at, 6))) = 'Saturday') AS 'Saturday',
    (SELECT COUNT(DAYNAME(CONCAT(YEAR(NOW()), RIGHT(birthday_at, 6)))) FROM `users` WHERE DAYNAME(CONCAT(YEAR(NOW()), RIGHT(birthday_at, 6))) = 'Sunday') AS 'Sunday';