/*
Таблица users была неудачно спроектирована.
Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10.
Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.
*/

update users
set
	example_created_at = STR_TO_DATE(example_created_at, '%d.%m.%Y %H:%i'),
    example_updated_at = STR_TO_DATE(example_updated_at, '%d.%m.%Y %H:%i');
