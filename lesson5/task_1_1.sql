/*
Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
*/

UPDATE users 
SET 
    created_at = NULL,
    updated_at = NULL;
update users
set
	created_at = now(),
    updated_at = now();
