/*
select  m.brand, m.company, g."phone", cast(gci."addedAt" as date) as tanggal , ci.no
  from "GCIUsers" g
  inner join "GCIUserGiftcards" gci on g.id = gci."GCIUserId"
  inner join "CardInventories" ci on gci."relationId" = ci.id
  inner join "CardPrograms" cp on ci."programId" = cp."programId"
   inner join "Merchants" m on m.id=cp."MerchantId"
where --cp."MerchantId" = 13
 gci."relationType" = 'CardInventory'
 and cast(gci."addedAt" as date) < '2018-01-01'
 -- and
-- and date_trunc('month', (gci."addedAt"))='2018-03-01'
-- and (gci."addedAt" >= '2018-03-01'
-- and  gci."addedAt" <= '2018-03-31')
--  group by 1,2,3
  order by cast(gci."addedAt" as date) desc
  */

  select   m.brand, m.company, cast(ci."createdAt" as date) as tanggal , ci.no
  from "CardInventories" ci
  inner join "CardPrograms" cp on ci."programId" = cp."programId"
   inner join "Merchants" m on m.id=cp."MerchantId"
where --cp."MerchantId" = 13
-- gci."relationType" = 'CardInventory'
ci."createdAt" is not null
 and cp."productType" not in ('Tada360','Tada','Card')
 and cast(ci."createdAt" as date) < '2018-01-01'
 -- and
--and date_trunc('year', (ci."createdAt"))='2017-01-01'
-- and (gci."addedAt" >= '2018-03-01'
-- and  gci."addedAt" <= '2018-03-31')
--  group by 1,2,3
  order by cast(ci."createdAt" as date) desc