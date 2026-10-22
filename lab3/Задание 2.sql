SELECT p.name, pr.description
FROM products AS p
LEFT JOIN product_review AS pr ON p.id = pr.product_id
-- WHERE pr.description IS NULL;