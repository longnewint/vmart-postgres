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
