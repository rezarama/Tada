select c.name "Name", ci.no "Card Number", cp."programName" "Program", c.phone "Phone Number", c.email "Email",
ci.balance "Last Balance", date_trunc('day',ci."activatedAt") "Activation Date",
date_trunc('day',ci."expiredAt") "Expired Date"
  from "Customers" c

  inner join "CustomerGiftcards" cg on c.id = cg."CustomerId"
  inner join "CardInventories" ci on cg."CardInventoryId" = ci.id
  inner join "CardPrograms" cp on ci."programId" = cp."programId"

  where  c."MerchantId" =  13 and ci."expiredAt" > '2018-02-10'
  and ci.balance > 0
  and ci.no not in
  (
  select ci.no
  from "GCIUsers" g
  inner join "GCIUserGiftcards" gci on g.id = gci."GCIUserId"
  inner join "CardInventories" ci on gci."relationId" = ci.id
  inner join "CardPrograms" cp on ci."programId" = cp."programId"
where cp."MerchantId" = 13
  and gci."relationType" = 'CardInventory')
  group by 1,2,3,4,5,6,7,8
  order by 7 desc