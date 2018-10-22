select date_Trunc('month', t."createdAt") as month, count (t.id), sum (t.amount)
  from "Transactions" as t

  where t.status = 'accepted'
  and t.type = 'egiftRedemption'
  and t."DistributorId" = 14

  group by 1
  order by 1 asc