/*
Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей
*/
SELECT 
    COUNT(*)
FROM
    (SELECT 
        *
    FROM
        `profile` p
    WHERE
        p.user_id IN ((SELECT 
                from_user_id
            FROM
                message
            WHERE
                id IN (SELECT 
                        message_id
                    FROM
                        `like`)))
            AND p.user_id IN (SELECT 
                *
            FROM
                (SELECT 
                user_id
            FROM
                `profile`
            ORDER BY birthday DESC
            LIMIT 10) t)
    ORDER BY birthday DESC) t1;
