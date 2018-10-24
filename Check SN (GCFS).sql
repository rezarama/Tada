select o.transaction_id,coalesce(eo.message,'')||coalesce(doi.message,'')
from order_items  oi 
join orders o on oi.order_id=o.id
left join ereload_orders eo on eo.order_item_id=oi.id
left join dtcell_orders doi on doi.order_item_id=oi.id
where (left(eo.message,2)='SN' or doi.message ilike '%SN%')
and o.transaction_id in ()