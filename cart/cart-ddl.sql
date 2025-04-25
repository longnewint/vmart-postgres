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

-- Cart function
CREATE FUNCTION get_cart(
  customer_cart_id integer,
  store_id integer)
  RETURNS TABLE(
    product_id integer,
    brand varchar(64),
    product_name varchar(64),
    list_price numeric(6,2),
    discount_price numeric(6,2),
    package_size integer,
    thumbnail_url varchar(256),
    quantity integer
  )
  LANGUAGE SQL
AS
$$
SELECT
  cart.product_id,
	brand,
	product_name,
	discount_price,
	list_price,
	package_size,
	thumbnail_url,
  quantity
FROM (
  SELECT
    product_id,
    quantity
  FROM shopping_cart_item
  WHERE cart_id = customer_cart_id
) AS cart
JOIN product_view AS pr
ON cart.product_id = pr.product_id;
$$;

--
CREATE PROCEDURE add_to_cart(
  customer_cart_id integer,
  added_product_id integer,
  product_quantity integer)
  LANGUAGE SQL
AS
$$
MERGE INTO shopping_cart_item sci
USING(
  VALUES(
    customer_cart_id,
    added_product_id,
    product_quantity)
) AS pr (cart_id, product_id, quantity)
ON sci.cart_id = pr.cart_id
AND sci.product_id = pr.product_id
WHEN MATCHED AND pr.quantity != 0 THEN
  UPDATE SET
    quantity = pr.quantity
WHEN MATCHED AND pr.quantity = 0 THEN
  DELETE
WHEN NOT MATCHED THEN
  INSERT (cart_id, product_id, quantity)
  VALUES (pr.cart_id, pr.product_id, pr.quantity);
$$;
