-- Создайте триггер аудита: при изменении цены товара старое и новое
-- значение автоматически заносятся в таблицу журнала.

CREATE TABLE IF NOT EXISTS journal (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_id INT,
    OLD_price BIGINT,
    NEW_price BIGINT
);

