--
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET default_tablespace = '';
SET default_with_oids = false;
--

-- Create product view
CREATE OR REPLACE VIEW product_view AS
SELECT
	si.item_id,
	si.store_id,
	si.discount_price,
	pr.*
FROM store_item AS si
JOIN product AS pr
ON si.product_id = pr.product_id;

-- Category function
CREATE OR REPLACE FUNCTION get_category(parent_id integer)
RETURNS TABLE(
  category_id integer,
  category_name varchar(64))
LANGUAGE SQL
AS
$$
WITH RECURSIVE category_cte AS
(SELECT
  category_id,
  category_name,
  is_leaf
FROM product_category
WHERE category_id = parent_id
UNION ALL
SELECT
  category.category_id,
  category.category_name,
  category.is_leaf
FROM category_cte
JOIN product_category category
ON category_cte.category_id = category.parent_category_id)
SELECT
  category_id,
  category_name
FROM category_cte
WHERE is_leaf = TRUE;
$$;

-- Product function
CREATE OR REPLACE FUNCTION get_product_by_category(
	parent_category_id integer,
	store_idtt integer)
RETURNS TABLE(
	product_id integer,
	brand varchar(64),
	product_name varchar(64),
	list_price numeric(6,2),
	discount_price numeric(6,2),
	package_size varchar(16),
	unit_price varchar(16),
	unit_price_calc integer,
	thumbnail_url varchar(256)
)
LANGUAGE SQL
AS
$$
SELECT
	product_id,
	brand,
	product_name,
	list_price,
	discount_price,
	package_size,
	unit_price,
	unit_price_calc,
	thumbnail_url
FROM product_view
WHERE category_id IN (
  SELECT
    category_id
  FROM
    get_category(parent_category_id)
)
AND store_id = store_idtt;
$$;

--
CREATE OR REPLACE FUNCTION get_product_by_id(
  product_idtt integer,
  store_idtt integer)
RETURNS TABLE(
  product_id integer,
  brand varchar(64),
  product_name varchar(64),
  list_price numeric(6,2),
  discount_price numeric(6,2),
  package_size varchar(16),
  unit_price varchar(16),
  url varchar(256),
  sku varchar(12),
  ingredients text,
  nutritions text)
LANGUAGE SQL
AS
$$
SELECT
  product_id,
  brand,
  product_name,
  list_price,
  discount_price,
  package_size,
  unit_price,
  url,
  sku,
  ingredients,
  nutritions
FROM product_view
WHERE store_id = store_idtt
AND product_id = product_idtt;
$$;
