select
   a."Transaction Day",
   a."cardNo" "Card No",
   a."orderType" "Order Type",
   case
      when
         "orderType" = 'Egift' 
      then
         '1' 
      when
         "orderType" = 'BuyBack' 
      then
         '1' 
      else
         a.quantity1::int 
   end
   "Quantity",
   case
      when
         "orderType" = 'Egift' 
      then
         a.amount::numeric(12,2)
	  when
         "orderType" = 'GCFS'
	  then
         a."price1"::numeric(12,2)
      else
         a."Total Amount"::numeric(12,2)
   end
   "Price", a."Channel", a."Issuer",
   case
      when
         "orderType" = 'Egift' 
      then
         coalesce(b."brand", '') || ' ' || coalesce("egiftName", '')
	  when
         "orderType" = 'GCFS'
	  then
         a.item1
      else
         "orderType" 
   end
   "Item", 
   a."tod" "Order Code", "orderNumber" "Order Number",
   sum(
   case
      when
         a."orderType" = 'Egift'
      then
         a.amount::numeric(12,2)
      else
         a."Total Amount"::numeric(12,2)
   end
) "Total Amount" 
from
   (
      select
         to_char(t."createdAt" + interval '7 hours', 'yyyy-mm-dd hh24:mi:ss') as "Transaction Day",
         t."cardNo",
         t.amount::varchar "Total Amount",
         o."orderType",
         o.items -> 0 ->> 'name' as item1,
         o.items -> 0 -> 'variants' -> 0 ->> 'quantity' as quantity1,
         o.items -> 0 -> 'variants' -> 0 ->> 'price' as price1,
         d.brand "Channel",
         em."itemName" "Egift Name",
         em."MerchantId" "IssuerEgift",
         em.amount::varchar,
         em."egiftName",
         m."brand" "Issuer",
         t."id" as tid,
         o.id as oid,
         o."orderCode" as tod,
	     o."orderNumber",
         m.company
      from
         "Transactions" as t 
         inner join
            "CardPrograms" cp 
            on t."programId" = cp."programId" 
         inner join
            "Merchants" as m 
            on m.id = t."MerchantId" 
         inner join
            "Distributors" as d 
            on d.id = t."DistributorId" 
         inner join
            "Orders" as o 
            on o."TransactionId" = t.id 
         left join
            "OrderEgifts" as oe 
            on oe."OrderId" = o.id 
         left join
            "Egifts" as e 
            on e.id = oe."EgiftId" 
         left join
            "EgiftMasters" as em 
            on em.id = e."EgiftMasterId" 
      where
         t.status = 'accepted' 
         and t.type in 
         (
            'redemption'
         )
         and date_trunc('month', t."createdAt" + interval '7 hours')::date between '2018-01-01'  and '2018-09-01' 
      order by
         1 desc 
   )
   a 
   left join
      "Merchants" as b 
      on a."IssuerEgift" = b.id 
where
   (
      upper(a.company) not ilike '%DUMMY%' 
      and upper(a.company) not ilike '%DEMO%' 
      and upper(a.company) not ilike '%TESTING%' 
      and upper(a.company) not ilike '%DUMMIES%' 
      and upper(a.company) not ilike '%NOT USED%' 
      and upper(a.company) not ilike '%TADA%'
   )
group by
   1,
   2,
   3,
   4,
   5,
   6,
   7,
   8,
   9,
   10