select date_trunc('month', t."createdAt" + interval '7 hours'), m.brand merchant, d.brand channel , count (t.id), sum (t.amount)
  from "Transactions" t

  inner join "Distributors"  d on t."DistributorId" = d.id
  inner join "CardPrograms" cp on t."programId" = cp."programId"
  inner join "Merchants" m on t."MerchantId" = m.id

  where t."createdAt" + interval '7 hours' >= '20170808'
  and t."createdAt" + interval '7 hours' < '20180108'
  and t.type = 'redemption'
  and t.status = 'accepted'
  and cp."productType" != 'Giftcard'
  and d.company not ilike '%dumm%'
  and m.company not ilike '%dumm%'
  and m.company not ilike '%test%'

  group by 1,2,3
  order by 5 desc