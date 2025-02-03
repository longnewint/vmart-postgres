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
  product_name varchar(64) NOT NULL,
  list_price numeric(6,2) NOT NULL,
  description text,
  image_url varchar(256),
  SKU varchar(12),
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
  first_name varchar(64),
  last_name varchar(64),
  phone_number varchar(10)
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
CREATE SEQUENCE shopping_cart_item_seq
  INCREMENT 1
  START 1
  OWNED BY shopping_cart_item.cart_item_id;

CREATE TABLE address (
  address_id integer NOT NULL PRIMARY KEY,
  unit_number varchar(16),
  street_number varchar(16),
  address_line_1 varchar(64),
  address_line_2 varchar(64),
  postal_code varchar(6),
  city smallint NOT NULL,
  region smallint NOT NULL
);
CREATE SEQUENCE address_seq
  INCREMENT 1
  START 1
  OWNED BY address.address_id;

CREATE TABLE user_address (
  user_id integer NOT NULL,
  address_id integer NOT NULL,
  is_default boolean,
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
CREATE SEQUENCE payment_method_seq
  INCREMENT 1
  START 1
  OWNED BY payment_method.payment_method_id;

CREATE TABLE order_status (
  order_status_id integer NOT NULL PRIMARY KEY,
  status_value varchar(64) NOT NULL
);

CREATE TABLE shipping_method (
  shipping_method_id integer NOT NULL PRIMARY KEY,
  shipping_method_value varchar(64) NOT NULL
);

CREATE TABLE vmart_order (
  order_id integer NOT NUll PRIMARY KEY,
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
CREATE SEQUENCE vmart_order_seq
  INCREMENT 1
  START 1
  OWNED BY vmart_order.order_id;
