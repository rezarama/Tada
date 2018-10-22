
select distinct(s."location") as store_code, count(t.id)
 from "Transactions" as t
 inner join "CardPrograms" as c
   on c."programId" = t."programId"
 inner join "Stores" as s
   on s.id = t."StoreId"
where t.status = 'accepted'
 and t.type in ('redemption','activation','topup')
 and t."MerchantId" = 13
group by 1
order by 2 desc