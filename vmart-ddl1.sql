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

--
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
  unit_number varchar(16),
  street_number varchar(16),
  address_line_1 varchar(64),
  address_line_2 varchar(64),
  city varchar(32),
  province varchar(32),
  postal_code varchar(6))
  LANGUAGE SQL
AS
$$
INSERT INTO address VALUES(nextval('address_seq'), $3, $4, $5, $6, $7, $8, $9);
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
  card_number varchar(16),
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


