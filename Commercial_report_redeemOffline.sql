
select t.id,  date_trunc('month', (t."createdAt" + interval '7 hours')) as month, t.amount, m.brand as merchant , ds.brand as chanelOffline
from "Transactions" as t
  inner join "Merchants" as m
    on m.id=t."MerchantId"
  inner join "CardPrograms" as c
    on c."programId" = t."programId"
    inner join "ApiUsers" as ap
    on ap.id=t."ApiUserId"
    inner join "Stores" as st
    on st.id=ap."StoreId"
    inner join "Distributors" as ds
    on ds.id=st."DistributorId"
where t.status='accepted' and c."productType" in ('Tada360')
and t."createdAt" >= '2017-01-01' and  t."createdAt" <= '2017-12-31'
--and date_trunc('month', (t."createdAt" + interval '7 hours'))='2018-03-01'
  and t.type in ('redemption') --and m.id='207'
  --and m.id=38