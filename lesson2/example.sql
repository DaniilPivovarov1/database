DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id INT,
	name VARCHAR(20) default 'anonymous'
);