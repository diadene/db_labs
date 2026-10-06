-- =============================================================================
-- payment: один платёж на заказ (order_id UNIQUE).
-- Берём только заказы, у которых есть позиции в order_items.
-- amount = сумма quantity * unit_price по этому заказу.
-- paid согласован со статусом orders:
--    created              -> false
--    paid/in_delivery/delivered -> true
--    cancelled            -> случайно (true/false)
-- method: 85% card, 15% cash.
-- created_at: сразу после оформления заказа (до 1 часа).
-- =============================================================================

insert into payment (user_id, order_id, amount, method, paid, created_at)
select
    o.user_id,
    o.id,
    sum(oi.quantity * oi.unit_price)                              as amount,
    case when random() < 0.85 then 'card'::paid_method
         else 'cash'::paid_method end                             as method,
    case
        when o.status = 'created'                                 then false
        when o.status in ('paid','in_delivery','delivered')       then true
        when o.status = 'cancelled'                               then random() < 0.5
        end                                                           as paid,
    o.created_at + (random() * interval '1 hour')                 as created_at
from orders o
         join order_items oi on oi.order_id = o.id
group by o.id, o.user_id, o.status, o.created_at;