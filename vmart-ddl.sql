
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
