select m.brand, cp."programName", count(ci.id), sum (ci.balance)
  from "CardInventories" as ci

  inner join "CardPrograms" as cp on cp."programId" = ci."programId"
  inner join "Merchants" as m on cp."MerchantId" = m.id

  where ci."activatedAt" is not null
  and ci."expiredAt" >= '2017-11-08'
  and cp."productType" = 'Tada'

  group by 1,2
  order by 4 desc