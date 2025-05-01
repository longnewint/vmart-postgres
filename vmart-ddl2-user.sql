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

--
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

