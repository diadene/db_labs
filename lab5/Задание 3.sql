-- Реализуйте функцию, возвращающую сводный показатель (например,
-- выручку продавца за период) с использованием переменных и запроса
-- внутри функции.

DROP FUNCTION IF EXISTS return_salary_by_period(integer,date,date);
CREATE OR REPLACE FUNCTION return_salary_by_period(r_seller_id INT, r_date_from DATE, r_date_to DATE) RETURNS INT AS $$

    DECLARE
        sum BIGINT;
    BEGIN
        SELECT SUM(unit_price * products.quantity) INTO sum FROM products
        JOIN order_items ON products.id = order_items.product_id
        JOIN orders on order_items.order_id = orders.id
        JOIN payment ON orders.id = payment.order_id
        WHERE payment.paid = TRUE AND products.seller_id = r_seller_id AND (payment.created_at BETWEEN r_date_to AND r_date_from)
        GROUP BY products.seller_id;

        RETURN sum;
        END;
        $$ LANGUAGE plpgsql;


SELECT * FROM return_salary_by_period(8, '2025-10-25', '2023-10-16')

