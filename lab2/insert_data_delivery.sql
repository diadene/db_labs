-- =============================================================================
-- delivery: 113 доставок.
-- Заказы со статусом paid/in_delivery/delivered.
-- Грузовики заполняются по порядку на 100% вместимости:
--   <=1000   -> 5
--   <=1500   -> 8
--   <=3500   -> 10
--   <=7500   -> 14
--   <=10000  -> 18
--   >10000   -> 20
-- Статус доставки:
--   paid        -> gathering (60%) / handed_to_courier (40%)
--   in_delivery -> in_transit
--   delivered   -> received
-- =============================================================================

with
    orders_for_delivery as (
        select id, status,
               row_number() over (order by id) as rn
        from orders
        where status in ('paid', 'in_delivery', 'delivered')
    ),
    trucks_with_capacity as (
        select id,
               row_number() over (order by id) as rn,
               case
                   when load_capacity <= 1000  then 5
                   when load_capacity <= 1500  then 8
                   when load_capacity <= 3500  then 10
                   when load_capacity <= 7500  then 14
                   when load_capacity <= 10000 then 18
                   else 20
                   end as capacity
        from truck
    ),
    trucks_cumulative as (
        select id,
               capacity,
               sum(capacity) over (order by rn) as cum_capacity,
               coalesce(
                               sum(capacity) over (order by rn
                           rows between unbounded preceding and 1 preceding),
                               0
               ) as prev_cum
        from trucks_with_capacity
    )
insert into delivery (truck_id, order_id, status)
select
    t.id,
    o.id,
    case
        when o.status = 'paid' and random() < 0.6 then 'gathering'::delivery_status
        when o.status = 'paid'                    then 'handed_to_courier'::delivery_status
        when o.status = 'in_delivery'             then 'in_transit'::delivery_status
        when o.status = 'delivered'               then 'received'::delivery_status
        end
from orders_for_delivery o
         join trucks_cumulative t
              on o.rn > t.prev_cum and o.rn <= t.cum_capacity;