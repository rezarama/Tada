select g.name "Name" , g.phone "Phone Number", g.email "Email Address", ci.no as "Card Number"
, cp."programName" "Program Name", date_trunc('day', g."createdAt") "Activation Day"
  from "GCIUsers" g
  inner join "GCIUserGiftcards" gci on g.id = gci."GCIUserId"
  inner join "CardInventories" ci on gci."relationId" = ci.id
  inner join "CardPrograms" cp on ci."programId" = cp."programId"
where cp."MerchantId" = 13
  and gci."relationType" = 'CardInventory'
group by 1,2,3,4,5,6
  order by 6 desc