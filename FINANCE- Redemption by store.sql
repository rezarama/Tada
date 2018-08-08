select t."cardNo" , t."amount", s.location
 from "Transactions" as t
 inner join "CardPrograms" as c
   on c."programId" = t."programId"
 inner join "Stores" as s
   on s.id = t."StoreId"
where t.status = 'accepted'
 and t.type in ('redemption')
 and t."MerchantId" in ('179')
 and  t."createdAt" between '2018-02-01' and '2018-03-01'
 order by  t."createdAt" desc