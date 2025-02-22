
--
-- vmart database functions and views
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


-- Category function

CREATE FUNCTION get_category(parent_id integer)
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

CREATE FUNCTION get_product_view(
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

CREATE FUNCTION get_product_by_id_view(
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

-- Profile function

CREATE FUNCTION get_profile(customer_id integer)
  RETURNS TABLE(
    email varchar(64),
    name varchar(64),
    phone_number varchar(10)
  )
LANGUAGE SQL
AS
$$
SELECT
  email,
  name,
  phone_number
FROM vmart_user
WHERE user_id = customer_id;
$$;

CREATE PROCEDURE update_profile(
  customer_id integer,
  c_name varchar(64),
  c_number varchar(10))
LANGUAGE SQL
AS
$$
UPDATE vmart_user
SET
  name = c_name,
  phone_number = c_number
WHERE user_id = customer_id;
$$;

-- Address function

CREATE FUNCTION get_address(customer_id integer)
  RETURNS TABLE(
    address_id integer,
    unit_number varchar(16),
    street_number varchar(16),
    address_line_1 varchar(64),
    address_line_2 varchar(64),
    postal_code varchar(6),
    city varchar(32),
    province varchar(32),
    is_default boolean)
  LANGUAGE SQL
AS
$$
SELECT
  a.*,
  ua.is_default
FROM (
  SELECT
    address_id,
    is_default
  FROM user_address
  WHERE user_id = customer_id
) AS ua
JOIN address a
ON ua.address_id = a.address_id;
$$;

--

CREATE PROCEDURE add_address(
  customer_id integer,
  is_default boolean,
  street_number varchar(16),
  address_line_1 varchar(64),
  postal_code varchar(6),
  city varchar(32),
  region varchar(32),
  unit_number varchar(16) DEFAULT 'none',
  address_line_2 varchar(64) DEFAULT 'none')
  LANGUAGE SQL
AS
$$
INSERT INTO address VALUES(nextval('address_seq'), $8, $3, $4, $9, $5, $6, $7);
INSERT INTO user_address VALUES ($1, currval('address_seq'), $2);
$$;

-- Payment function

CREATE FUNCTION get_payment(customer_id integer)
  RETURNS TABLE(
    payment_method_id integer,
    payment_type_id integer,
    card_number varchar(4),
    is_default boolean)
  LANGUAGE SQL
AS
$$
SELECT
  payment_method_id,
  payment_type_id,
  substring(card_number, 13),
  is_default
FROM payment_method
WHERE user_id = customer_id;
$$;

--

CREATE PROCEDURE add_payment(
  customer_id integer,
  payment_type_id integer,
  card_number varchar(32),
  exp_month varchar(2),
  exp_year varchar(4),
  cvv varchar(3),
  is_default boolean)
  LANGUAGE SQL
AS
$$
INSERT INTO payment_method VALUES (
  nextval('payment_method_seq'),
  customer_id,
  payment_type_id,
  card_number,
  exp_month,
  exp_year,
  cvv,
  is_default);
$$;


-- Cart function

CREATE FUNCTION get_cart(
  customer_cart_id integer,
  store_id integer)
  RETURNS TABLE(
    product_id integer,
    product_name varchar(64),
    list_price numeric(6,2),
    thumbnail_url text,
    quantity integer
  )
  LANGUAGE SQL
AS
$$
SELECT
  pr.product_id,
  pr.product_name,
  pr.list_price,
  pr.thumbnail_url,
  cart.quantity
FROM (
  SELECT
    product_id,
    quantity
  FROM shopping_cart_item
  WHERE cart_id = customer_cart_id
) AS cart
JOIN product AS pr
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


-- Order function

CREATE FUNCTION calculate_total(
  customer_cart_id integer,
  chosen_store_id integer)
  RETURNS numeric(6,2)
  LANGUAGE SQL
AS
$$
SELECT
  SUM(p.list_price * sci.quantity)
FROM (
  SELECT
    product_id,
    quantity
  FROM shopping_cart_item
  WHERE cart_id = customer_cart_id
) AS sci
JOIN product p ON sci.product_id = p.product_id
$$;

--

CREATE PROCEDURE create_order(
  customer_id integer,
  store_id integer,
  customer_cart_id integer,
  shipping_method_id integer,
  address_id integer,
  payment_method_id integer)
  LANGUAGE SQL
AS
$$
INSERT INTO vmart_order
VALUES (
  nextval('vmart_order_seq'),
  customer_id,
  store_id,
  customer_cart_id, 
  shipping_method_id,
  address_id,
  payment_method_id,
  NOW(),
  calculate_total(customer_cart_id, store_id),
  1
);
$$;
