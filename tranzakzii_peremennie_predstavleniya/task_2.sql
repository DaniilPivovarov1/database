DROP VIEW IF EXISTS pr_and_cat_name;
CREATE VIEW pr_and_cat_name AS SELECT p.`name` as product_name, c.`name` as `catalog_name`  FROM products p JOIN `catalogs` c ON p.catalog_id = c.id;
