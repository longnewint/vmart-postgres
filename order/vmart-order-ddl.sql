
CREATE FUNCTION calculate_total(
  customer_cart_id integer,
  chosen_store_id integer)
  RETURNS numeric(6,2)
  LANGUAGE SQL
AS
$$
SELECT
  SUM(p.list_price * sci.quantity)
FROM (
  SELECT
    product_id,
    quantity
  FROM shopping_cart_item
  WHERE cart_id = customer_cart_id
) AS sci
JOIN product p ON sci.product_id = p.product_id
$$;

