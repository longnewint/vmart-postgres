--
-- Profile function
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
