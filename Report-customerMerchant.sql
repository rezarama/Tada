select c.*, cp."programName" "Program", mc."brand"
  from "Customers" c

  inner join "CustomerGiftcards" cg on c.id = cg."CustomerId"
  inner join "CardInventories" ci on cg."CardInventoryId" = ci.id
  inner join "CardPrograms" cp on ci."programId" = cp."programId"
  inner join "Merchants" mc on mc.id= cp."MerchantId"