select m.company, c.no, c.balance,  c."expiredAt", p."programName"
  from "CardInventories" as c

  inner join "CardPrograms" as p
    on c."programId" = p."programId"
  left join "Merchants" as m
    on m.id = p."MerchantId"


  where c."expiredAt" <= '20170731'
  and c."expiredAt" >= '20160601'
  and p."productType" = 'Tada'
  and c."hasExpiry" = true

  order by 4 asc