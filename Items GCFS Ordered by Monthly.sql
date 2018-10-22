select i.name, sum(oi.quantity), sum(o.total)
  from orders as o

  inner join order_items as oi on oi.order_id = o.id
  inner join items as i on i.id = oi.item_id

where o.created_at > '2017-09-30 17:00'
  and o.created_at <= '2017-10-31 17:00'

group by 1
order by 1