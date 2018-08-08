
   select  m.brand, m.company , t."cardNo",
    sum(t.amount) as totalAmount,
   count(t.amount) as totalcount
   from "Transactions" t
 inner join "CardPrograms" cp on t."programId" = cp."programId"
 inner join "Merchants" m on t."MerchantId" = m.id
where  t.type in ('topup','redemption','activation') and t.status = 'accepted' -- and cp."isPointProgram"='f'
and date_trunc('month', (t."createdAt" + interval '7 hours'))='2018-03-01'
--and  t."createdAt" between '2018-03-01' and '2018-03-31'
 --[[ t."createdAt" >= {{start_date}}]]
--   and [[ t."createdAt" <= {{end_date}}]]
   -- and "ApiUserId" in (1701,1756)
group by m.brand, m.company,  t."cardNo"