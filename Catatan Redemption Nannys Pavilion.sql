select date_trunc('day', t."createdAt") "Day" ,t.id,s.location "Store" , em."itemName" ,t.amount
  from "Transactions" t

  inner join "Stores" as s on t."StoreId" = s.id
  inner join "CardPrograms" as cp on t."programId" = cp."programId"
  inner join "Egifts"  as e on cp."programId" = e."programId"
  inner join "EgiftMasters" as em on em.id = e."EgiftMasterId"

  where t."DistributorId" = 50
  and t.status = 'accepted'
  and t.type = 'egiftRedemption'

  group by 1,2,3,4,5
  order by 1 desc