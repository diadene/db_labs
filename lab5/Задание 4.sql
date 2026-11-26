-- Создайте триггер аудита: при изменении цены товара старое и новое
-- значение автоматически заносятся в таблицу журнала.

CREATE TABLE IF NOT EXISTS journal (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_id INT,
    old_unit_price numeric(12, 2),
    new_unit_price numeric(12, 2),
    updated_at timestamptz
);

CREATE OR REPLACE FUNCTION write_logs() RETURNS TRIGGER AS $$
    BEGIN
        IF OLD.unit_price IS DISTINCT FROM NEW.unit_price THEN
            INSERT INTO journal (product_id, old_unit_price ,new_unit_price, updated_at)
            VALUES (NEW.product_id, OLD.unit_price,NEW.unit_price, now());
        END IF;
        RETURN new;
    end;
    $$ LANGUAGE  plpgsql;

CREATE TRIGGER after_update_log
AFTER UPDATE OF unit_price ON order_items
FOR EACH ROW
EXECUTE FUNCTION write_logs();

UPDATE order_items
SET unit_price = 68.68
WHERE product_id = 1;

SELECT * FROM journal;

DELETE FROM journal
WHERE id BETWEEN 1 AND 9;