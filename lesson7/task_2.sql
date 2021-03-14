SELECT 
    p.*, c.*
FROM
    products p
        JOIN
    catalogs c ON p.catalog_id = c.id;