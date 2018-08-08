select ci.no as "Card Number",m.brand as "Company Brand",cp."programName" as "Program Name", ci."activatedAt" as "Activation", cp."productType" as "Product"
  , ci.balance as "Balance", ci."expiredAt" as "Expired"
  from "CardInventories" as ci

  left join "CardPrograms" as cp on ci."programId" = cp."programId"
  left join "Merchants" as m on  cp."MerchantId" = m.id

  where ci.status = 'activated'
  and ci."activatedAt" is not null
  and cp."MerchantId" = 207