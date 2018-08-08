select t."createdAt", d.brand, t.type, o.items->0->'name' as item1, o."orderType" , t.status
  from "Transactions" as t

  inner join "Merchants" as m
    on t."MerchantId" = m.id
  inner join "Distributors" as d
    on d.id = t."DistributorId"
  left join "Orders" as o
    on o."TransactionId" = t.id

where  t."cardNo" in ('4512041254001610')