select date_trunc('month', t."createdAt" + interval '7 hours') as "month", m.brand , sum(t.amount), count(t.id)
  from "Transactions" as t
  inner join "Distributors" as d
    on d.id = t."DistributorId"
  inner join "Merchants" as m
    on m.id = t."MerchantId"
  where t.status = 'accepted'
  and t.type in ('redemption')
  and t."createdAt" + interval '7 hours' >= '20170808'
  and t."createdAt" + interval '7 hours' <= '20180108'
  and d.id = 64

  group by 1,2
  order by 3 desc