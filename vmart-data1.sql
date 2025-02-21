--
-- vmart database dump 1
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

--
--
--

INSERT INTO vmart_user VALUES
(11111, 'default@vmart.com')
(12345, 'dev@mail.com');

INSERT INTO shopping_cart VALUES
(1234567, 12345, 101);

CALL update_profile(12345, 'Long Nguyen', '6134133792');

CALL add_address(11111, TRUE, 'pick up', 'at the store', 'K2C2T2', 1, 1);
CALL add_address(12345, TRUE, '1227', 'Woodroffe Ave', 'K2C2T2', 1, 1);
CALL add_address(12345, FALSE, '1221', 'Woodroffe Ave', 'K2C2T2', 1, 1);

CALL add_payment(12345, 1, '1234567812345678', '1', '27', '123', TRUE);
CALL add_payment(12345, 2, '1234123412341234', '1', '27', '123', FALSE);

CALL add_to_cart(1234567, 1002, 1);
CALL add_to_cart(1234567, 1005, 1);
CALL add_to_cart(1234567, 1007, 1);
CALL add_to_cart(1234567, 1072, 1);
CALL add_to_cart(1234567, 1038, 1);
CALL add_to_cart(1234567, 1047, 1);

CALL create_order(12345, 101, 1234567, 2, 2, 1);