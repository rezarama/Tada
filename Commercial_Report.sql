

select t.id,o."orderType", date_trunc('month', (t."createdAt" + interval '7 hours')) as tanggal,
o.items->0->>'name' as item1,  t.amount, o.items->0->'variants'->0->'quantity' as quantity1, o.items->0->'variants'->0->'price' as price1
,  d.brand as channel_distiributors, m.brand as brands, t."createdAt"

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
and o."orderType"='GCFS' and m.id='570'
  and date_trunc('month', (t."createdAt" + interval '7 hours')) in ('2018-02-01','2018-01-01')