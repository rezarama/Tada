
select  date_trunc('month', (ci."activatedAt" + interval '7 hours')) as MonthActivatedDate, count(ci.no) as TotalCard
from "CardInventories" ci
  inner join "CardPrograms" cp on ci."programId" = cp."programId"
   inner join "Merchants" m on m.id=cp."MerchantId"
where --cp."MerchantId" = 38 and  cp.id in (1140,1134,1139,553)
--and "expiredAt" < '2018-04-25'
ci."activatedAt" is not null
group by 1