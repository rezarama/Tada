select c.name "Name", ci.no "Card Number", cp."programName" "Program", c.phone "Phone Number", c.email "Email", ci.balance "Last Balance", date_trunc('day',ci."activatedAt") "Activation Date", date_trunc('day',ci."expiredAt") "Expired Date"
  from "Customers" c

  inner join "CustomerGiftcards" cg on c.id = cg."CustomerId"
  inner join "CardInventories" ci on cg."CardInventoryId" = ci.id
  inner join "CardPrograms" cp on ci."programId" = cp."programId"

  where  c."MerchantId" =  13
  group by 1,2,3,4,5,6,7,8
  order by 7 desc