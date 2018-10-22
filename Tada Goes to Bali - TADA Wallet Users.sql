
select g.name,
g.phone "Phone Number", g.email "Email Address", ci.no as "Card Number",
cp."programName" "Program Name", date_trunc('day', g."createdAt") "Day", mc."company" as "Merchant Name"
  from "GCIUsers" g

  inner join "GCIUserGiftcards" gci on g.id = gci."GCIUserId"
  inner join "CardInventories" ci on gci."relationId" = ci.id
  inner join "CardPrograms" cp on ci."programId" = cp."programId"
  inner join "Merchants" mc on mc.id= cp."MerchantId"
where
   gci."relationType" = 'CardInventory'
   and g."createdAt" >= '2018-04-25'
   and mc."id"=772
   order by  g."createdAt" desc