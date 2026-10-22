WITH sellers_info AS (
    SELECT s.id AS seller_id, s.store_name, p.price
    FROM sellers AS s
    JOIN products AS p ON s.id = p.seller_id
)

SELECT p.name, s_i.price, p.quantity FROM sellers_info AS s_i
JOIN products AS p ON s_i.seller_id =  p.seller_id ;

-- TODO рекурсивный CTE

