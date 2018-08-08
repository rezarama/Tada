 with cte as (

 select  t.type , cp."productType",
 cast(t."createdAt" + interval '7 hours' as date) as tanggal,
 count(1) as transaction_count,
 sum(amount) as total_amounts
   from "Transactions" as t
 inner join "CardPrograms" as cp on cp."programId"=t."programId"
   left join "Merchants" as m on cp."MerchantId" = m.id
where t.status = 'accepted'
and t.type in ('redemption', 'activation', 'topup')
and cp."productType" in ('Tada', 'Tada360','Giftcard','Card')
--and cast(t."createdAt" + interval '7 hours' as date) = current_date-1
and cast(t."createdAt" + interval '7 hours' as date) > '2017-12-31'
group by 1,2,3
--order by 1 asc
union all
select  t.type, 'egiftRedemption' as "productType",
 cast(t."createdAt" + interval '7 hours' as date) as tanggal,
 count(1) as transaction_count,
 sum(amount*2) as total_amounts
   from "Transactions" as t
 inner join "CardPrograms" as cp on cp."programId"=t."programId"
   left join "Merchants" as m on cp."MerchantId" = m.id
where t.status = 'accepted'
and t.type in ('egiftRedemption')
--and cast(t."createdAt" + interval '7 hours' as date) = current_date-1
and cast(t."createdAt" + interval '7 hours' as date) > '2017-12-31'
group by 1,2,3
--order by 1 asc
)
select type, "productType",
 SUM(CASE WHEN "tanggal" = current_date-3 THEN total_amounts ELSE 0 END) AS "3 days before (amount)",
 SUM(CASE WHEN "tanggal" = current_date-3 THEN transaction_count  ELSE 0 END) AS "3 days before (count)",
  SUM(CASE WHEN "tanggal" = current_date-2 THEN total_amounts ELSE 0 END) AS "2 days before (amount)",
 SUM(CASE WHEN "tanggal" = current_date-2 THEN transaction_count  ELSE 0 END) AS "2 days before (count)",
  SUM(CASE WHEN "tanggal" = current_date-1 THEN total_amounts ELSE 0 END) AS "1 days before (amount)",
 SUM(CASE WHEN "tanggal" = current_date-1 THEN transaction_count  ELSE 0 END) AS "1 days before (count)",
   SUM(CASE WHEN "tanggal" >= '2018-01-01' AND "tanggal" <= current_date-1 THEN total_amounts ELSE 0 END) AS "TotalYTD_2018 (amount)",
  SUM(CASE WHEN "tanggal" >= '2018-01-01' AND "tanggal" <= current_date-1 THEN transaction_count ELSE 0 END) AS "TotalYTD_2018 (count)"

from cte
group by type, "productType"