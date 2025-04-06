--
-- vmart product view and functions
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
--
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
ON si.product_id = pr.product_id

-- Product function
CREATE FUNCTION get_product_by_category(parent_id integer)
  RETURNS SETOF product
  LANGUAGE SQL
AS
$$
SELECT
  *
FROM product
WHERE category_id IN (
  SELECT
    category_id
  FROM
    get_category(parent_id)
)
$$;

--
CREATE FUNCTION get_product(
  chosen_store_id integer,
  chosen_category_id integer)
  RETURNS TABLE(
    product_id integer,
    brand varchar(64),
    product_name varchar(64),
    list_price numeric(6,2),
    discount_price numeric(6,2),
    thumbnail_url varchar(256))
  LANGUAGE SQL
AS
$$
SELECT
  pr.product_id,
  pr.brand,
  pr.product_name,
  pr.list_price,
  si.discount_price,
  pr.thumbnail_url
FROM get_product_by_category(chosen_category_id) AS pr
JOIN (
  SELECT
    product_id,
    quantity,
    discount_price
  FROM store_item
  WHERE store_id = chosen_store_id
) AS si
ON pr.product_id = si.product_id
$$;

--
CREATE FUNCTION get_product_by_id(
  chosen_store_id integer,
  chosen_product_id integer)
  RETURNS TABLE(
    product_id integer,
    brand varchar(64),
    product_name varchar(64),
    list_price numeric(6,2),
    discount_price numeric(6,2),
    package_size int,
    url varchar(256),
    sku varchar(12),
    ingredients text,
    nutritions text)
  LANGUAGE SQL
AS
$$
SELECT
  pr.product_id,
  pr.brand,
  pr.product_name,
  pr.list_price,
  si.discount_price,
  pr.package_size,
  pr.url,
  pr.sku,
  pr.ingredients,
  pr.nutritions
FROM (
  SELECT
    *
  FROM product
  WHERE product_id = chosen_product_id
  ) AS pr
JOIN (
  SELECT
    product_id,
    quantity,
    discount_price
  FROM store_item
  WHERE store_id = chosen_store_id
) AS si
ON pr.product_id = si.product_id
$$;