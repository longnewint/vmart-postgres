CREATE VIEW product_view AS
SELECT
	si.item_id,
	si.store_id,
	si.discount_price,
	pr.*
FROM store_item AS si
JOIN product AS pr
ON si.product_id = pr.product_id