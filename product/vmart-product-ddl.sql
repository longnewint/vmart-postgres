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