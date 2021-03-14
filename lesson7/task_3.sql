DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    `from` VARCHAR(45),
    `to` VARCHAR(45)
);
INSERT flights (`from`, `to`) VALUES ('moscow', 'omsk');
INSERT flights (`from`, `to`) VALUES ('novgorod', 'kazan');
INSERT flights (`from`, `to`) VALUES ('irkutsk', 'moscow');
INSERT flights (`from`, `to`) VALUES ('omsk', 'irkutsk');
INSERT flights (`from`, `to`) VALUES ('moscow', 'kazan');
DROP TABLE IF EXISTS label;
CREATE TABLE label (
    label VARCHAR(45),
    `name` VARCHAR(45)
);
INSERT label (label, `name`) VALUES ('moscow', 'Москва');
INSERT label (label, `name`) VALUES ('irkutsk', 'Иркутск');
INSERT label (label, `name`) VALUES ('novgorod', 'Новгород');
INSERT label (label, `name`) VALUES ('kazan', 'Казань');
INSERT label (label, `name`) VALUES ('omsk', 'Омск');
SELECT 
    id,
    (SELECT 
            `name`
        FROM
            label l
        WHERE
            l.label = f.`from`) AS `from`,
    (SELECT 
            `name`
        FROM
            label l
        WHERE
            l.label = f.`to`) AS `to`
FROM
    flights f
