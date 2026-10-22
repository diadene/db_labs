-- =============================================================================
-- product_review: отзывы только на реально полученные товары.
-- Берём все delivered-заказы, их order_items, и пишем по одному отзыву
-- на каждую уникальную пару (user_id, product_id).
-- Количество строк = число уникальных пар (обычно 90–130).
-- rating ↔ description согласованы.
-- status ≈ 60% hidden (в основном негатив).
-- =============================================================================

with
    delivered_pairs as (
        select distinct
            o.user_id,
            oi.product_id,
            o.created_at as order_created_at
        from orders o
                 join order_items oi on oi.order_id = o.id
        where o.status = 'delivered'
    ),
    with_rating as (
        select
            user_id,
            product_id,
            order_created_at,
            -- распределение рейтингов: чаще 4–5★, реже 1–2★
            case
                when random() < 0.45 then 5
                when random() < 0.75 then 4
                when random() < 0.90 then 3
                when random() < 0.97 then 2
                else 1
                end as rating
        from delivered_pairs
    )
insert into product_review (product_id, user_id, description, rating, status, created_at)
select
    product_id,
    user_id,
    -- текст зависит от рейтинга
    case rating
        when 5 then
            (array[
                'Товар отличный, полностью соответствует описанию. Рекомендую!',
                'Качество на высоте, пришло быстро, упаковано аккуратно.',
                'Прекрасная покупка, пользуюсь с удовольствием.',
                'Всё супер, спасибо продавцу!',
                'Отличное качество, буду заказывать ещё.',
                'Товар превзошёл ожидания, спасибо!'
                ])[1 + floor(random() * 6)::int]
        when 4 then
            (array[
                'Хороший товар, но упаковка могла быть получше.',
                'В целом доволен, небольшие недочёты, но за эти деньги отлично.',
                'Качество хорошее, доставка немного задержалась.',
                'Товар понравился, рекомендую.',
                'Всё в порядке, но цвет чуть отличается от фото.'
                ])[1 + floor(random() * 5)::int]
        when 3 then
            (array[
                'Средний товар, есть небольшие дефекты.',
                'Ожидал большего за эти деньги.',
                'Товар рабочий, но качество среднее.',
                'Ничего особенного, обычный товар.',
                'Есть недочёты, но в целом терпимо.'
                ])[1 + floor(random() * 5)::int]
        when 2 then
            (array[
                'Товар пришёл с браком, разочарован.',
                'Качество плохое, не соответствует описанию.',
                'Работает плохо, пришлось вернуть.',
                'Материал дешёвый, быстро сломался.',
                'Не рекомендую, ожидал совсем другого.'
                ])[1 + floor(random() * 5)::int]
        when 1 then
            (array[
                'Ужасное качество, товар сломан.',
                'Полное разочарование, деньги на ветер.',
                'Пришло не то, что заказывал.',
                'Товар нерабочий, оформил возврат.',
                'Худшее качество, что я видел.'
                ])[1 + floor(random() * 5)::int]
        end as description,
    rating,
    -- status: у 1–2★ — почти всегда hidden, у 3★ — 50/50, у 4–5★ — в основном published
    case
        when rating <= 2 and random() < 0.85 then 'hidden'
        when rating = 3  and random() < 0.5  then 'hidden'
        when rating >= 4 and random() < 0.2  then 'hidden'
        else 'published'
        end as status,
    -- дата отзыва: через 3–30 дней после оформления заказа
    order_created_at + (interval '3 days' + random() * interval '27 days') as created_at
from with_rating;