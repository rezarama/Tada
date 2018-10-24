select o.created_at as "Time" , o."transaction_id" as "Order Reference", c.name as "Channel", it.name as "Item Name", i.quantity "Item Qty" , i.subtotal as "Subtotal"
, s.price as "Shipping Fee" , o.total+s.price as "Total", op.card_no as "Card Number" , ol.metadata
  from orders as o

  inner join order_items as i on i.order_id = o.id
  inner join items as it on it.id = i.item_id
  inner join shipping_fees as s on s.id = o.delivery_city
  inner join clients as c on c.id = o.client_id
  left join order_payments as op on op.order_id = o.id
 left join "order_logs" as ol on ol."order_id"=o.id
where o.created_at >= '2018-07-01' and o.created_at <= '2018-07-31'
 and o.deleted_at is null
 and o.status not in ('5')
 and i.status not in ('6')
--  and o.transaction_id in
and c.name like '%Mortar%'
and ol.metadata not like '%@giftcard%'