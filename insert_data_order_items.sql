-- =============================================================================
-- order_items: ~185 строк (зависит от random()).
-- Для каждого заказа берётся товар из одной категории (по o.id % 8).
-- Количество товаров в заказе: с вероятностью 70% — 1, иначе 2.
-- quantity: 1–20 для дешёвых (< 1000 руб.), 1–5 для дорогих.
-- unit_price: берётся из products.price на момент оформления заказа.
-- Дубли (order_id, product_id) исключены: order by random() + limit.
-- =============================================================================

insert into order_items (order_id, product_id, quantity, unit_price)
select
    o.id                                                        as order_id,
    p.id                                                        as product_id,
    case
        when p.price < 1000
            then (1 + floor(random() * 20))::int
        else
            (1 + floor(random() * 5))::int
        end                                                         as quantity,
    p.price                                                     as unit_price
from orders o
         cross join lateral (
    select id, price
    from products
    where category_id = (
        case (o.id % 8)
            when 0 then (select id from categories where name = 'Смартфоны')
            when 1 then (select id from categories where name = 'Наушники')
            when 2 then (select id from categories where name = 'Платья и юбки')
            when 3 then (select id from categories where name = 'Кроссовки')
            when 4 then (select id from categories where name = 'Холодильники')
            when 5 then (select id from categories where name = 'Наборы кастрюль')
            when 6 then (select id from categories where name = 'Корм для кошек')
            when 7 then (select id from categories where name = 'Конструкторы')
            end
        )
    order by random()
    limit (case when random() < 0.7 then 1 else 2 end)
    ) p;