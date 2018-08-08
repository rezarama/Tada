Select m.brand as "Company", p."productType" as "Product", count(no) as "Total Card", sum(balance) as "Total Balance"
  from "CardInventories" as c

  inner join "CardPrograms" as p
    on c."programId" = p."programId"
  inner join "Merchants" as m
    on p."MerchantId" = m.id

  WHERE status='activated'
    and balance >0
    and ("expiredAt" is null or "expiredAt" > NOW())
    group by m.brand, p."productType"
    order by 4 desc;