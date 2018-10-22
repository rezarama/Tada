

  select t.no as cardno , t.type, t.amount, t."createdAt", ds.brand as chanel, m.brand, t.status
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
where t.status='accepted'
  and date_trunc('month', (t."createdAt" + interval '7 hours')) in ('2018-02-01','2018-01-01')
  and t.type in ('topup')  and m.id='570'