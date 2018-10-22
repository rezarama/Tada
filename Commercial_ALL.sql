select t.id, t.amount, o."orderType",
o.items->0->>'name' as item1, o.items->0->'variants'->0->'quantity' as quantity1, o.items->0->'variants'->0->'price' as price1
,  d.brand, m.brand as brands

from "Transactions" as t
  inner join "Merchants" as m
    on m.id=t."MerchantId"
  inner join "CardPrograms" as c
    on c."programId" = t."programId"
  inner join "Distributors" as d
    on d.id = t."DistributorId"
  inner join "Orders" as o
    on o."TransactionId" = t.id

where t.status='accepted'
 and t.type in ('redemption')
 --and m.brand like '%Commonwealth%'
-- and m.id=677
--  and c."productType" in ('Tada','Tada360')