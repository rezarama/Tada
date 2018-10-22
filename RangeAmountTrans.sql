select m.brand, count(t.id) as totaltran, sum(t.amount) as totalamount
 from "Transactions" t
 inner join "CardPrograms" cp on t."programId" = cp."programId"
 inner join "Merchants" m on t."MerchantId" = m.id

 where t."MerchantId" in (200, 13, 193,177,179)
 and cp."productType" = 'Giftcard'
 and t.type = 'redemption' and t.status = 'accepted'
 and t."createdAt" between '2018-01-01' and '2018-02-01'
 and --  t."amount" <= 50000
 --(t."amount" >50000 and t."amount" <= 100000)
 (t."amount" >100000 and t."amount" <= 200000)
-- t."amount" > 200000
group by m.brand