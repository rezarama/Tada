
select g.name,
g.phone "Phone Number", ci.no as "Card Number",
cp."programName" "Program Name", date_trunc('day', t."createdAt") "Day", mc."company" as "Merchant Name"
  ,cp."MerchantId", mc."brand"  , t.type , count(t."amount") as "total transaksi"  ,sum(t."amount")  as "Total Amount"
  from "GCIUsers" g
  inner join "GCIUserGiftcards" gci on g.id = gci."GCIUserId"
  inner join "CardInventories" ci on gci."relationId" = ci.id
  inner join "CardPrograms" cp on ci."programId" = cp."programId"
  inner join "Transactions" t on t."cardNo" = ci.no
  inner join "Merchants" mc on mc.id= cp."MerchantId"
where
   gci."relationType" = 'CardInventory' and (t.type = 'redemption' and t.status = 'accepted')
  and t."MerchantId"=772 and --(t."createdAt" between '2018-03-22' and '2018-03-28')
  t."createdAt" >='2018-04-26'
group by 1,2,3,4,5,6,7,8,9