/*
Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем
*/
SELECT 
    *
FROM
    `user`
WHERE
    id = (SELECT from_user_id FROM (SELECT 
            from_user_id, COUNT(*)
        FROM
            message
        WHERE
            to_user_id = 27
        ORDER BY from_user_id
        LIMIT 1) t);
