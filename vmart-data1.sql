--
-- vmart database dump 0
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

SELECT add_address(12345, DEFAULT, '1227', 'Woodroffe Ave', DEFAULT, 'K2C2T2', 1, 1, TRUE);
SELECT add_address(12345, DEFAULT, '1221', 'Woodroffe Ave', DEFAULT, 'K2C2T2', 1, 1, FALSE);

SELECT add_payment(12345, 1, '1234567812345678', '1', '27', '123', TRUE);
SELECT add_payment(12345, 2, '1234123412341234', '1', '27', '123', FALSE);

SELECT add_to_cart();
SELECT add_to_cart();
SELECT add_to_cart();
SELECT add_to_cart();
SELECT add_to_cart();

