-- vmart database init
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET default_tablespace = '';
SET default_with_oids = false;
--

-- drop tables
DROP TABLE IF EXISTS vmart_user CASCADE;
DROP TABLE IF EXISTS address CASCADE;
DROP TABLE IF EXISTS user_address CASCADE;
DROP TABLE IF EXISTS payment_type CASCADE;
DROP TABLE IF EXISTS payment_method CASCADE;
DROP TABLE IF EXISTS store CASCADE;
DROP TABLE IF EXISTS product_category CASCADE;
DROP TABLE IF EXISTS product CASCADE;
DROP TABLE IF EXISTS store_item CASCADE;
DROP TABLE IF EXISTS shopping_cart CASCADE;
DROP TABLE IF EXISTS shopping_cart_item CASCADE;
DROP TABLE IF EXISTS order_status CASCADE;
DROP TABLE IF EXISTS shipping_method CASCADE;
DROP TABLE IF EXISTS vmart_order CASCADE;

---
--- create tables
---

CREATE TABLE store (
  store_id integer NOT NULL PRIMARY KEY,
  store_name varchar(64) NOT NULL,
  phone varchar(10) NOT NULL
);
CREATE SEQUENCE store_seq
  INCREMENT 1
  START 101
  OWNED BY store.store_id;

CREATE TABLE product_category (
  category_id integer NOT NULL PRIMARY KEY,
  parent_category_id integer,
  category_name varchar(64) NOT NULL,
  is_leaf boolean NOT NULL,
  FOREIGN KEY(parent_category_id) REFERENCES product_category
);

CREATE TABLE product (
  product_id integer NOT NULL PRIMARY KEY,
  category_id integer NOT NULL,
  brand varchar(64) DEFAULT 'none',
  product_name varchar(64) NOT NULL,
  list_price numeric(6,2) NOT NULL,
  package_size varchar(16) NOT NULL DEFAULT 'none',
  package_measurement int NOT NULL DEFAULT 0,
  package_measurement_unit varchar(8) NOT NULL DEFAULT 'none',
  unit_price varchar(16) DEFAULT 'none',
  unit_price_calc integer DEFAULT 0,
  thumbnail_url varchar(256) DEFAULT 'none',
  url varchar(256) DEFAULT 'none',
  description text DEFAULT 'none',
  ingredients text DEFAULT 'none',
  nutritions text DEFAULT 'none',
  SKU varchar(12) DEFAULT 'none',
  FOREIGN KEY(category_id) REFERENCES product_category
);
CREATE SEQUENCE product_seq
  INCREMENT 1
  START 1001
  OWNED BY product.product_id;

CREATE TABLE store_item (
  item_id integer NOT NULL PRIMARY KEY,
  product_id integer NOT NULL,
  store_id integer NOT NULL,
  quantity integer NOT NULL,
  discount_price numeric(6,2) NOT NULL DEFAULT 0,
  FOREIGN KEY(product_id) REFERENCES product,
  FOREIGN KEY(store_id) REFERENCES store
);
CREATE SEQUENCE store_item_seq
  INCREMENT 1
  START 1000001
  OWNED BY store_item.item_id;

CREATE TABLE vmart_user (
  user_id integer NOT NULL PRIMARY KEY,
  email varchar(64) NOT NULL,
  name varchar(64) DEFAULT 'none',
  phone_number varchar(10) DEFAULT 'none'
);

CREATE TABLE shopping_cart (
  cart_id integer NOT NULL PRIMARY KEY,
  user_id integer NOT NULL,
  store_id integer NOT NULL,
  FOREIGN KEY(user_id) REFERENCES vmart_user,
  FOREIGN KEY(store_id) REFERENCES store
);

CREATE TABLE shopping_cart_item (
  cart_id integer NOT NULL,
  product_id integer NOT NULL,
  quantity integer NOT NULL,
  PRIMARY KEY(cart_id, product_id),
  FOREIGN KEY(cart_id) REFERENCES shopping_cart,
  FOREIGN KEY(product_id) REFERENCES product
);

CREATE TABLE address (
  address_id integer NOT NULL PRIMARY KEY,
  unit_number varchar(16) DEFAULT 'none',
  street_number varchar(16) NOT NULL,
  address_line_1 varchar(64) NOT NULL,
  address_line_2 varchar(64) DEFAULT 'none',
  city varchar(32) NOT NULL,
  province varchar(32) NOT NULL,
  postal_code varchar(6) NOT NULL
);
CREATE SEQUENCE address_seq
  INCREMENT 1
  START 1
  OWNED BY address.address_id;

CREATE TABLE user_address (
  user_id integer NOT NULL,
  address_id integer NOT NULL,
  is_default boolean NOT NULL DEFAULT FALSE,
  PRIMARY KEY(user_id, address_id),
  FOREIGN KEY(user_id) REFERENCES vmart_user,
  FOREIGN KEY(address_id) REFERENCES address ON DELETE CASCADE
);

CREATE TABLE shipping_method (
  shipping_method_id integer NOT NULL PRIMARY KEY,
  shipping_method_value varchar(64) NOT NULL
);

CREATE TABLE payment_type (
  payment_type_id integer NOT NULL PRIMARY KEY,
  type_value varchar(64) NOT NULL
);

CREATE TABLE payment_method (
  payment_method_id integer NOT NULL PRIMARY KEY,
  user_id integer NOT NULL,
  payment_type_id integer NOT NULL,
  card_number varchar(16) NOT NULL,
  exp_month varchar(2) NOT NULL,
  exp_year varchar(4) NOT NULL,
  cvv varchar(3) NOT NULL,
  is_default boolean NOT NULL DEFAULT FALSE,
  FOREIGN KEY(user_id) REFERENCES vmart_user,
  FOREIGN KEY(payment_type_id) REFERENCES payment_type
);
CREATE SEQUENCE payment_method_seq
  INCREMENT 1
  START 1
  OWNED BY payment_method.payment_method_id;

CREATE TABLE order_status (
  order_status_id integer NOT NULL PRIMARY KEY,
  status_value varchar(64) NOT NULL
);

CREATE TABLE vmart_order (
  order_id integer NOT NUll PRIMARY KEY,
  user_id integer NOT NULL,
  store_id integer NOT NULL,
  cart_id integer NOT NULL,
  shipping_method_id integer NOT NULL,
  address_id integer NOT NULL,
  payment_method_id integer NOT NULL,
  order_date timestamp NOT NULL,
  order_total numeric(8,2) NOT NULL,
  order_status_id integer NOT NULL,
  FOREIGN KEY(user_id) REFERENCES vmart_user,
  FOREIGN KEY(store_id) REFERENCES store,
  FOREIGN KEY(cart_id) REFERENCES shopping_cart,
  FOREIGN KEY(shipping_method_id) REFERENCES shipping_method,
  FOREIGN KEY(address_id) REFERENCES address,
  FOREIGN KEY(payment_method_id) REFERENCES payment_method,
  FOREIGN KEY(order_status_id) REFERENCES order_status
);
CREATE SEQUENCE vmart_order_seq
  INCREMENT 1
  START 1
  OWNED BY vmart_order.order_id;
