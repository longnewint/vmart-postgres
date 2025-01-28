
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
-- CREATE VIEW category_view AS
WITH RECURSIVE category_cte AS
(SELECT
  category_id,
  parent_category_id,
  category_name
FROM product_category
UNION ALL
SELECT
  category.category_id,
  category.parent_category_id,
  category.category_name
FROM category_cte
JOIN product_category category
ON category_cte.category_id = category.parent_category_id)
SELECT * FROM category_cte