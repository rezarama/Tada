with recursive date as(
SELECT to_char(generate_series(min, max, '1 month'), 'MON') AS "MON"
FROM (
  SELECT date_trunc('month', min("createdAt")) AS min, 
         date_trunc('month', max("createdAt")) AS max
  FROM "CardInventories"
  WHERE extract(Year from "createdAt"::date)=2017) sub
)
,cte as(
select m.brand "Brand",to_char(ci."createdAt"::date,'MON')date,status,coalesce(count(no),0)"Count" from "CardInventories" ci
inner join "CardPrograms" cp on ci."programId"=cp."programId"
inner join "Merchants" m on cp."MerchantId"=m.id
where cp."MerchantId" in(79,153,682,688,390,
904,211,369,689,625,681,224,36,221,37,38,205,
182,310,45,214,17,215,187)
and extract(Year from ci."createdAt"::date)=2018
group by 1,2,3
)
select b."Brand",a."MON",b.status "Status","Count"
from date a left join cte b on a."MON"=b.date