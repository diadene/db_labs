WITH sellers_info AS (
    SELECT s.id AS seller_id, s.store_name, p.price
    FROM sellers AS s
    JOIN products AS p ON s.id = p.seller_id
)

SELECT p.name, s_i.price, p.quantity FROM sellers_info AS s_i
JOIN products AS p ON s_i.seller_id =  p.seller_id;

-- рекурсивный CTE

WITH RECURSIVE parents_categories AS (
    SELECT id, parent_id, name
    FROM categories

    UNION

    SELECT categories.id, categories.parent_id, categories.name
    FROM categories
        JOIN parents_categories
            ON categories.parent_id = parents_categories.id
    )

SELECT * FROM parents_categories;