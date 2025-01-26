--
-- vmart database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET default_tablespace = '';
SET default_with_oids = false;

SET default_with_oids = false;
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL SERIALIZABLE;

INSERT INTO store VALUES
(nextval('store_seq'), 'VMart Ottawa', '6134131234'),
(nextval('store_seq'), 'VMart Kanata', '6134132345');

INSERT INTO product_category VALUES
(1, NULL, 'Produce'),
(2, 1, 'Vegetables'),
(3, 1, 'Fruits'),
(4, NULL, 'Plant-based Protein & Tofu'),
(5, NULL, 'Bakery'),
(6, 5, 'Bread'),
(7, 5, 'Buns & Rolls'),
(8, 5, 'Tortillas & Flat Breads'),
(9, 5, 'Cake'),
(10, NULL, 'Frozen Food'),
(11, 10, 'Frozen Vegetables'),
(12, 10, 'Frozen Fruits'),
(13, 10, 'Frozen Plant Protein'),
(14, NULL, 'Pantry'),
(15, 14, 'Rice & Noodles'),
(16, 14, 'Instant Ramen'),
(17, 14, 'Dried Beans, Vegetables & Grains'),
(18, 14, 'Spices & Seasonings'),
(19, 14, 'Condiments & Sauces'),
(20, 14, 'Canned & Pickled'),
(10, NULL, 'Plant-based Milk'),
(11, NULL, 'Drinks'),
(NULL, 'Produce'),
(NULL, 'Seafood');


