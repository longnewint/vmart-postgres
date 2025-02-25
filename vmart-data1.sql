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
(11111, 'default@vmart.com'),
(12345, 'dev@mail.com'),
(12321, 'other_dev@mail.com');

INSERT INTO shopping_cart VALUES
(1234567, 12345, 101),
(1234321, 12321, 101);

CALL update_profile(12321, 'Test User', '6132160803');

CALL add_address(11111, TRUE, 'none', 'pick up', 'at the store', 'none', 'Ottawa', 'Ontario', 'K2C2T2');
CALL add_address(12321, TRUE, 'none', '1227', 'Woodroffe Ave', 'none', 'Ottawa', 'Ontario', 'K2C2T2');
CALL add_address(12321, FALSE, 'none', '1221', 'Woodroffe Ave', 'none', 'Ottawa', 'Ontario', 'K2C2T2');

CALL add_payment(11111, 1, '1111111111111111', '01', '01', '111', TRUE);
CALL add_payment(12321, 1, '1234567812345678', '01', '27', '123', TRUE);
CALL add_payment(12321, 2, '1234123412341234', '01', '27', '123', FALSE);

CALL add_to_cart(1234321, 1002, 1);
CALL add_to_cart(1234321, 1005, 1);
CALL add_to_cart(1234321, 1007, 1);
CALL add_to_cart(1234321, 1072, 1);
CALL add_to_cart(1234321, 1038, 1);
CALL add_to_cart(1234321, 1047, 1);

CALL create_order(12321, 101, 1234321, 2, 2, 2);
