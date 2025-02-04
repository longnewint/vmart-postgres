
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

CREATE FUNCTION get_category(parent_id integer)
  RETURNS TABLE(category_id integer, category_name varchar(64))
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

CREATE FUNCTION get_product(parent_id integer)
  RETURNS TABLE(product_id integer, product_name varchar(64),
    list_price numeric(6, 2))
  LANGUAGE SQL
AS
$$
SELECT
  product_id,
  product_name,
  list_price
FROM product
WHERE category_id IN (
  SELECT
    category_id
  FROM
    get_category(parent_id)
)
$$;

CREATE FUNCTION get_item(chosen_store_id integer, chosen_category_id integer)
  RETURNS TABLE(item_id integer, product_name varchar(64),
    list_price numeric(6,2), discount_price numeric(6,2))
  LANGUAGE SQL
AS
$$
SELECT
  si.item_id,
  pr.product_name,
  pr.list_price,
  si.discount_price
FROM get_product(chosen_category_id) AS pr
JOIN (
  SELECT
    item_id,
    product_id,
    quantity,
    discount_price
  FROM store_item
  WHERE store_id = chosen_store_id
) AS si
ON pr.product_id = si.product_id
$$;

CREATE FUNCTION get_address(customer_id integer)
  RETURNS TABLE(address_id integer, unit_number integer, street_number integer,
    address_line_1 varchar(64), address_line_2 varchar(64),
    postal_code varchar(6), city integer, region integer)
  LANGUAGE SQL
AS
$$
SELECT
  a.*
FROM (
  SELECT address_id
  FROM user_address
  WHERE user_id = customer_id
) AS ua
JOIN address a
ON ua.address_id = a.address_id;
$$;


CREATE FUNCTION add_address(customer_id integer, is_default boolean,
  unit_number integer, street_number integer,
  address_line_1 varchar(64), address_line_2 varchar(64),
  postal_code varchar(6), city integer, region integer)
  RETURNS TABLE(address_id integer, unit_number integer, street_number integer,
    address_line_1 varchar(64), address_line_2 varchar(64),
    postal_code varchar(6), city integer, region integer)
  LANGUAGE SQL
AS
$$
INSERT INTO address VALUES(nextval('address_seq'), unit_number, street_number,
  address_line_1, address_line_2, postal_code, city, region);
INSERT INTO user_address VALUES (customer_id, currval('address_seq'), is_default);
SELECT * FROM get_address(customer_id);
$$;

CREATE FUNCTION get_payment(customer_id integer)
  RETURNS TABLE(payment_method_id integer, payment_type_id integer,
    card_number varchar(32), exp_month varchar(2), exp_year varchar(4),
    cvv varchar(3), is_default boolean)
  LANGUAGE SQL
AS
$$
SELECT
  payment_method_id,
  payment_type_id,
  card_number,
  exp_month,
  exp_year,
  cvv,
  is_default
FROM payment_method
WHERE user_id = customer_id;
$$;

CREATE FUNCTION add_payment(customer_id integer, payment_type_id integer,
    card_number varchar(32), exp_month varchar(2), exp_year varchar(4),
    cvv varchar(3), is_default boolean)
  RETURNS TABLE(payment_method_id integer, payment_type_id integer,
    card_number varchar(32), exp_month varchar(2), exp_year varchar(4),
    cvv varchar(3), is_default boolean)
  LANGUAGE SQL
AS
$$
INSERT INTO payment_method(nextval('payment_method_seq'), customer_id,
  payment_type_id, card_number, exp_month, exp_year, cvv, is_default);
SELECT * FROM get_payment(customer_id);
$$;