/*
Определить кто больше поставил лайков (всего) - мужчины или женщины?
*/
SELECT 
    IF((SELECT 
                COUNT(*)
            FROM
                (SELECT 
                    gender
                FROM
                    `profile`
                WHERE
                    user_id IN ((SELECT 
                            user_id
                        FROM
                            `like`))
                        AND gender = 'm') t) > (SELECT 
                COUNT(*)
            FROM
                (SELECT 
                    gender
                FROM
                    `profile`
                WHERE
                    user_id IN ((SELECT 
                            user_id
                        FROM
                            `like`))
                        AND gender = 'f') t),
        'm',
        'f') AS max_gender;