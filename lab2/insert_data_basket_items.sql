-- =============================================================================
-- basket_items: случайное количество товаров (1–15) на каждую корзину.
-- Всего корзин: 300 (после insert_data_basket + insert_data_basket_part2).
-- Всего товаров: 1000 (батчи products).
-- Гарантии:
--   * basket_id и product_id всегда существуют (FK не нарушается);
--   * нет дублей (basket_id, product_id) внутри одной корзины;
--   * quantity от 1 до 5;
--   * количество позиций в корзине — от 1 до 15.
-- =============================================================================

insert into basket_items (basket_id, product_id, quantity)
select
    b.id                                        as basket_id,
    p.id                                        as product_id,
    (1 + floor(random() * 5))::int              as quantity
from basket b
         cross join lateral (
    -- сколько товаров положим в эту корзину: от 1 до 15
    select (1 + floor(random() * 15))::int as n
    ) cnt
         cross join lateral (
    -- выбираем n случайных РАЗНЫХ товаров
    select id
    from products
    order by random()
    limit cnt.n
    ) p;