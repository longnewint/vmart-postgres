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
CREATE FUNCTION get_current_order(customer_id integer)
RETURNS TABLE(
  order_id integer,
  store_name varchar(64),
  shipping_method_id integer,
  order_date timestamp,
  order_total numeric(8,2),
  order_status_id integer,
  unit_number varchar(16),
  street_number varchar(16),
  address_line_1 varchar(64),
  address_line_2 varchar(64),
  city varchar(32),
  province varchar(32),
  postal_code varchar(6)
)
LANGUAGE SQL
AS
$$
SELECT
  o.order_id,
  s.store_name,
  o.shipping_method_id,
  o.order_date,
  o.order_total,
  a.*
FROM (
  SELECT * FROM vmart_order
  WHERE user_id = customer_id
) AS o
JOIN store AS s ON o.store_id = s.store_id
JOIN address AS a ON o.address_id = a.address_id;
$$;

--
CREATE FUNCTION get_order_by_id(order_id_p integer)
RETURNS TABLE(
  order_id integer,
  store_name varchar(64),
  shipping_method_id integer,
  order_date timestamp,
  order_total numeric(8,2)
)
LANGUAGE SQL
AS
$$
SELECT
  o.order_id,
  s.store_name,
  o.shipping_method_id,
  o.order_date,
  o.order_total  
FROM (
  SELECT * FROM vmart_order
  WHERE order_id = order_id_p
) AS o
JOIN store AS s ON o.store_id = s.store_id
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
