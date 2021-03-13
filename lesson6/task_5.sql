/*
Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети
*/
SELECT 
    *,
    (SELECT 
            COUNT(*)
        FROM
            `like`
        WHERE
            user_id = p.user_id) + (SELECT 
            COUNT(*)
        FROM
            media
        WHERE
            user_id = p.user_id) + (SELECT 
            COUNT(*)
        FROM
            community
        WHERE
            admin_id = p.user_id) + (SELECT 
            COUNT(*)
        FROM
            user_community
        WHERE
            user_id = p.user_id) + (SELECT 
            COUNT(*)
        FROM
            post
        WHERE
            user_id = p.user_id) + (SELECT 
            COUNT(*)
        FROM
            friend_request
        WHERE
            from_user_id = p.user_id
                OR to_user_id = p.user_id AND `status` = 1) + (SELECT 
            COUNT(*)
        FROM
            message
        WHERE
            from_user_id = p.user_id) AS statistic
FROM
    `profile` p
ORDER BY statistic
LIMIT 10;