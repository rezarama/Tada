select g.name "Name" , g.phone "Phone Number", g.email "Email Address", ci.no as "Card Number", cp."programName" "Program Name", date_trunc('day', g."createdAt") "Day", mc."company" as "Merchant Name"

  from "GCIUsers" g

  inner join "GCIUserGiftcards" gci on g.id = gci."GCIUserId"
  inner join "CardInventories" ci on gci."relationId" = ci.id
  inner join "CardPrograms" cp on ci."programId" = cp."programId"
  inner join "Merchants" mc on mc.id= cp."MerchantId"

where --cp."MerchantId" in ('320','686','687')
 -- and
  gci."relationType" = 'CardInventory'

group by 1,2,3,4,5,6,7
  order by 6 desc