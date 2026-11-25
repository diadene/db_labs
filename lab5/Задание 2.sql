-- Реализуйте функцию на PL/pgSQL, атомарно оформляющую заказ: она
-- создаёт заказ и его позиции и уменьшает остаток, а при нехватке товара
-- возбуждает исключение и не оставляет частичных изменений.

DROP  FUNCTION IF EXISTS validate_data(text, text, int);
DROP  FUNCTION IF EXISTS create_order(text, text, int, orders.address%TYPE);

CREATE OR REPLACE FUNCTION validate_data(
    v_username TEXT,
    v_product TEXT,
    v_quantity INT,
    OUT user_id INT,
    OUT product_id INT,
    OUT quantity INT) AS $$

    DECLARE query_result INT;

    BEGIN
        SELECT id INTO user_id FROM users
        WHERE name = v_username;

        SELECT id INTO product_id FROM products
        WHERE name = v_product;

        SELECT products.quantity INTO query_result FROM products WHERE id = product_id FOR UPDATE;
        IF user_id IS NULL THEN
            RAISE EXCEPTION 'Пользователя % не существует!', v_username;
        ELSEIF product_id IS NULL THEN
            RAISE EXCEPTION 'Продукта % не существует!', v_product;
        ELSEIF v_quantity <= 0 THEN
            RAISE EXCEPTION 'Введено неверное количество продукта: %', v_product;
        ELSEIF v_quantity > query_result THEN
            RAISE EXCEPTION 'На складе не хватает продукта!';
        END IF;

        quantity = v_quantity;
        RETURN;
    END;

    $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION create_order(
    p_username TEXT,
    p_product TEXT,
    p_quantity INT,
    p_address orders.address%TYPE) RETURNS TEXT AS $$

    DECLARE
        c_user_id INT;
        c_product_id INT;
        c_quantity INT;
        c_address orders.address%TYPE = p_address;
        c_order_id INT;
    BEGIN
        SELECT user_id, product_id, quantity INTO c_user_id, c_product_id, c_quantity
                                             FROM validate_data(p_username, p_product, p_quantity);

        INSERT INTO orders(user_id, address) VALUES (c_user_id, c_address) RETURNING id INTO c_order_id;

        INSERT INTO order_items(order_id, product_id, quantity, unit_price) VALUES (c_order_id, c_product_id, c_quantity,
                                                                                    (SELECT price FROM products WHERE id = c_product_id));
        RETURN 'Заказ успешно создан. Номер заказа: ' || c_order_id;
    end;
    $$ LANGUAGE plpgsql;

SELECT * FROM create_order('Euphemia Hadwick', 'Смартфон Honor X8b 8/128 ГБ', 2, 'г. Казань, ул. Баумана, д. 20, кв. 56');
DELETE FROM orders WHERE id = 155;
