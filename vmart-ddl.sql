
--
-- vmart database init
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET default_tablespace = '';
SET default_with_oids = false;

---
--- drop tables
---


---
--- create tables
---

CREATE TABLE vmart_user (
  user_id integer NOT NULL PRIMARY KEY,
  email varchar(64) NOT NULL,
  first_name varchar(64),
  last_name varchar(64),
  phone_number varchar(10)
);

CREATE TABLE address (
  address_id integer NOT NULL PRIMARY KEY,
  unit_number varchar(8),
  street_number varchar(8),
  address_line_1 varchar(64),
  address_line_2 varchar(64),
  postal_code varchar(6),
  city smallint NOT NULL,
  region smallint NOT NULL
);

CREATE TABLE user_address (
  user_id integer NOT NULL,
  address_id integer NOT NULL,
  is_default boolean NOT NULL,
  PRIMARY KEY(user_id, address_id),
  FOREIGN KEY(user_id) REFERENCES vmart_user,
  FOREIGN KEY(address_id) REFERENCES address
);

CREATE TABLE payment_type (
  payment_type_id integer NOT NULL PRIMARY KEY,
  type_value varchar(64) NOT NULL
);

CREATE TABLE payment_method (
  payment_method_id integer NOT NULL PRIMARY KEY,
  user_id integer NOT NULL,
  payment_type_id integer NOT NULL,
  provider varchar(64) NOT NULL,
  account_number varchar(64) NOT NULL,
  expiry_date date NOT NULL,
  is_default boolean NOT NULL,
  FOREIGN KEY(user_id) REFERENCES vmart_user,
  FOREIGN KEY(payment_type_id) REFERENCES payment_type
);
