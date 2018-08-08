select t.no, t."cardNo", m.company , c."productType"
  from "Transactions" as t

  inner join "CardInventories" as i
    on t."distributionId" = i."distributionId"
  inner join "CardPrograms" as c
    on c."programId" = i."programId"
  inner join "Merchants" as m
    on t."MerchantId" = m.id


where t.no in ('67271708161123028240')