
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
