
 with cte as (
select distinct 'Voucher at GCFS' as  type,  cast(o.created_at as date) as tanggal , sum(i.subtotal) as total_amounts,
count(1) as transaction_count

  from orders as o
  inner join order_items as i
    on i.order_id = o.id
  inner join items as it
    on it.id = i.item_id
  inner join shipping_fees as s
    on s.id = o.delivery_city
  inner join clients as c
    on c.id = o.client_id
  left join order_payments as op
    on op.order_id = o.id
    left join "order_logs" as ol
    on ol."order_id"=o.id

where cast(o.created_at as date) >= '2018-01-01'
--date_trunc('month', (o."created_at" + interval '7 hours'))='2018-03-01'
and
(ol.metadata like '%tanyuska.isabela@giftcard%' or ol.metadata like '%susanti@giftcard%')
 and o.deleted_at is null
  and o.status not in ('5')
  and i.status not in ('6')
  and it."category_id"='2'
--and o.transaction_id in
 -- ('GCIEIM5UCV8ZTRX')
group by 1,2
union all
select  distinct 'E-gift at GCFS' as  type,  cast(o.created_at as date) as tanggal ,
sum(i.subtotal) as total_amounts,
count(1) as transaction_count
  from orders as o
  inner join order_items as i
    on i.order_id = o.id
  inner join items as it
    on it.id = i.item_id
  inner join shipping_fees as s
    on s.id = o.delivery_city
  inner join clients as c
    on c.id = o.client_id
  left join order_payments as op
    on op.order_id = o.id
    left join "order_logs" as ol
    on ol."order_id"=o.id
where cast(o.created_at as date) >= '2018-01-01'
--o.created_at >= '2017-07-31 19:00'
--date_trunc('month', (o."created_at" + interval '7 hours'))='2018-03-01'
and
(ol.metadata like '%tanyuska.isabela@giftcard%' or ol.metadata like '%susanti@giftcard%')
 and o.deleted_at is null
  and o.status not in ('5')
  and i.status not in ('6')
and it."category_id"='22'
 --and o.transaction_id in
  -- ('GCIQ3DRX74UNHFJ')
group by 1,2
)
select type,
 SUM(CASE WHEN "tanggal" = current_date-3 THEN total_amounts ELSE 0 END) AS "3 days before (amount)",
 SUM(CASE WHEN "tanggal" = current_date-3 THEN transaction_count  ELSE 0 END) AS "3 days before (count)",
  SUM(CASE WHEN "tanggal" = current_date-2 THEN total_amounts ELSE 0 END) AS "2 days before (amount)",
 SUM(CASE WHEN "tanggal" = current_date-2 THEN transaction_count  ELSE 0 END) AS "2 days before (count)",
  SUM(CASE WHEN "tanggal" = current_date-1 THEN total_amounts ELSE 0 END) AS "1 days before (amount)",
 SUM(CASE WHEN "tanggal" = current_date-1 THEN transaction_count  ELSE 0 END) AS "1 days before (count)",
   SUM(CASE WHEN "tanggal" >= '2018-01-01' AND "tanggal" <= current_date-1 THEN total_amounts ELSE 0 END) AS "TotalYTD_2018 (amount)",
  SUM(CASE WHEN "tanggal" >= '2018-01-01' AND "tanggal" <= current_date-1 THEN transaction_count ELSE 0 END) AS "TotalYTD_2018 (count)"

from cte
group by type