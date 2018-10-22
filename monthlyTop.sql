
 select m."brand", t.type, t."cardNo" , sum(t."amount") , count(t.type)
 from "Transactions" t

 inner join "CardPrograms" cp on t."programId" = cp."programId"
 inner join "Merchants" m on t."MerchantId" = m.id

 where t.type in ('redemption', 'topup') and t.status = 'accepted'
 and t."createdAt" between '2018-01-01' and '2018-01-31'
group by 1,2,3
having sum(t."amount") >= 200000 and  count(t.type) >= 2
order by t."cardNo" asc