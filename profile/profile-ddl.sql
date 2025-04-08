
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