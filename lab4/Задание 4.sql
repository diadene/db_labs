-- С помощью SUM(...) OVER (PARTITION BY ...) посчитайте долю выручки каждого продавца в
-- выручке его категории

-- Задание 4

SELECT DISTINCT
    c.name AS category_name,
    s.store_name AS seller_name,
    SUM(order_items.quantity * order_items.unit_price) OVER (PARTITION BY c.id, s.id) AS seller_revenue,
    ROUND(
            (
                        SUM( order_items.quantity * order_items.unit_price) OVER (PARTITION BY c.id, s.id) /
                        SUM( order_items.quantity * order_items.unit_price) OVER (PARTITION BY c.id)
                ) * 100,
            2
    ) AS revenue_share_pct
FROM order_items
         JOIN products p ON order_items.product_id = p.id
         JOIN sellers s ON p.seller_id = s.id
         JOIN categories c ON p.category_id = c.id
ORDER BY category_name, revenue_share_pct DESC;
