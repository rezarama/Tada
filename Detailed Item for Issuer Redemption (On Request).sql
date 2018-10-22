select t.no as "Transaction No", o."orderNumber" as "Order Number", t."cardNo" as "Card No", m.brand, t."createdAt" + '07:00' as Date, c."productType", t.amount
  , o.items->0->'name' as item1, o.items->0->'variants'->0->'quantity' as quantity1, o.items->0->'variants'->0->'price' as price1
 , o.items->1->'name' as item2, o.items->1->'variants'->0->'quantity' as quantity2, o.items->1->'variants'->0->'price' as price2
 , o.items->0->'name' as item4, o.items->0->'variants'->1->'quantity' as quantity4, o.items->0->'variants'->1->'price' as price4
 , o.items->2->'name' as item3, o.items->2->'variants'->0->'quantity' as quantity3, o.items->2->'variants'->0->'price' as price3
 , d.brand as "Channel"
  from "Transactions" as t

  inner join "CardInventories" as i
    on t."distributionId" = i."distributionId"
  inner join "CardPrograms" as c
    on c."programId" = i."programId"
  left join "Distributors" as d
    on d.id = t."DistributorId"
  LEFT join "Orders" as o
    on o."TransactionId" = t.id
  left join "Merchants" as m
    on t."MerchantId" = m.id

where t.status = 'accepted'
  and t.type  in ( 'redemption', 'egiftRedemption' )
  and t."DistributorId" = 64
  and t."createdAt" > '20170825'


  order by t."createdAt" asc