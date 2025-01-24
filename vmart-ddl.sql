
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

CREATE TABLE store (
  store_id integer NOT NULL PRIMARY KEY,
  store_name varchar(64) NOT NULL,
  phone varchar(10) NOT NULL
);

CREATE TABLE product_category (
  category_id integer NOT NULL PRIMARY KEY,
  parent_category_id integer,
  category_name varchar(64) NOT NULL,
  FOREIGN KEY(parent_category_id) REFERENCES product_category
);

CREATE TABLE product (
  product_id integer NOT NULL PRIMARY KEY,
  category_id integer NOT NULL,
  name varchar(64) NOT NULL,
  description text,
  image_url varchar(256),
  SKU varchar(12),
  FOREIGN KEY(category_id) REFERENCES product_category
);

CREATE TABLE shopping_cart (
  cart_id integer NOT NULL PRIMARY KEY,
  user_id integer NOT NULL,
  FOREIGN KEY(user_id) REFERENCES vmart_user
);

CREATE TABLE shopping_cart_item (
  cart_item_id integer NOT NULL PRIMARY KEY,
  cart_id integer NOT NULL,
  item_id integer NOT NULL,
  quantity integer NOT NULL,
  FOREIGN KEY(cart_id) REFERENCES shopping_cart,
  FOREIGN KEY(item_id) REFERENCES store_item
);

CREATE TABLE order_status (
  order_status_id integer NOT NULL PRIMARY KEY,
  status_value varchar(64)
);

CREATE TABLE shipping_method (
  shipping_method_id integer NOT NULL PRIMARY KEY,
  shipping_method_value varchar(64) NOT NULL
);

CREATE TABLE vmart_order (
  order_id integer NOT NUll,
  cart_id integer NOT NULL,
  store_id integer NOT NULL,
  shipping_method_id integer NOT NULL,
  address_id integer,
  payment_method_id integer NOT NULL,
  order_date date NOT NULL,
  order_total numeric(8,2) NOT NULL,
  order_status_id integer,
  FOREIGN KEY(cart_id) REFERENCES shopping_cart,
  FOREIGN KEY(store_id) REFERENCES store,
  FOREIGN KEY(shipping_method_id) REFERENCES shipping_method,
  FOREIGN KEY(address_id) REFERENCES address,
  FOREIGN KEY(payment_method_id) REFERENCES payment_method,
  FOREIGN KEY(order_status_id) REFERENCES order_status
);
