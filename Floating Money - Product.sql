Select p."productType" as product, count(no) as tot_card, sum(balance) as tot_bal
  from "CardInventories" as c

  inner join "CardPrograms" as p
    on c."programId" = p."programId"
  inner join "Merchants" as m
    on p."MerchantId" = m.id

  WHERE status='activated'
    and balance >0
    and ("expiredAt" is null or "expiredAt" > NOW())
    group by p."productType"
    order by tot_card desc;