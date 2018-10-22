select p."productType", i."balance", i.no , m."company"

from "CardInventories" as i

  inner join "CardPrograms" as p
    on p."programId"=i."programId"
  left join "CardVerifications" as c
    on c."distributionId"=i."distributionId"
  inner join "Merchants" as m
    on p."MerchantId"=m."id"

    where p."productType"='Giftcard'
    and i."balance" > 0
    and i."expiredAt" > now()
    group by 1,2,3,4
    order by 2 desc