
select  m.brand, date_trunc('month', (gci."addedAt")) as tanggal , count(gci."GCIUserId") as total
  from "GCIUsers" g
  inner join "GCIUserGiftcards" gci on g.id = gci."GCIUserId"
  inner join "CardInventories" ci on gci."relationId" = ci.id
  inner join "CardPrograms" cp on ci."programId" = cp."programId"
   inner join "Merchants" m on m.id=cp."MerchantId"
where-- cp."MerchantId" = 704 and
 gci."relationType" = 'CardInventory' -- and
  --gci."addedAt" >= '2018-01-01'
  -- and  gci."addedAt" <= '2018-02-26'
    and cast(gci."addedAt" as date) >= '2018-01-01' AND cast(gci."addedAt" as date) <= '2018-03-31'
  group by 1,2
 -- order by cast(gci."addedAt" as date) desc