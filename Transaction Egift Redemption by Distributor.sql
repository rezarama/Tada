select date_trunc('day', (t."createdAt" + interval '7 hours')) as  "Transaction at", t."cardNo" "Egift Number",em."itemName" "Item Name",t.amount "Total Amount", s.location "Location",em."egiftName", m.brand "Issuer", cp."programName" "Program Name"
  from "Transactions" t

  inner join "Egifts" as e on t."programId" = e."programId"
  inner join "EgiftMasters" as em on e."EgiftMasterId" = em.id
  inner join "Merchants" as m on t."MerchantId" = m.id
  inner join "Stores" as s on t."StoreId" = s.id
  inner join "CardPrograms" as cp on cp."programId" = t."programId"

  where t."DistributorId" = 252
  and t.type = 'egiftRedemption'
  and t.status = 'accepted'

  group by 1,2,3,4,5,6,7,8
  order by 1 desc