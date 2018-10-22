
select a.item1 , count(a.item1) from (
select t.id, t.amount, o."orderType",
o.items->0->>'name' as item1, o.items->0->'variants'->0->'quantity' as quantity1, o.items->0->'variants'->0->'price' as price1
,  d.brand, em."egiftName"

from "Transactions" as t
  inner join "Merchants" as m
    on m.id=t."MerchantId"
  inner join "CardPrograms" as c
    on c."programId" = t."programId"
  inner join "Distributors" as d
    on d.id = t."DistributorId"
  inner join "Orders" as o
    on o."TransactionId" = t.id
  left join "OrderEgifts" as oe
    on oe."OrderId" = o.id
  left join "Egifts" as e
    on e.id = oe."EgiftId"
  left join "EgiftMasters" as em
    on em.id = e."EgiftMasterId"


where t.status='accepted'
  and t.type in ('redemption')
  and t."updatedAt" >= '2018-03-01'
--  and c."productType" in ('Tada','Tada360')

  )a

  group by  a.item1
  order by count(a.item1) desc