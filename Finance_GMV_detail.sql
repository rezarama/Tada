/*
select
 date_trunc('month', (t."createdAt" + interval '7 hours')) as month, m.brand, m.company,
 count(1) as transaction_count,
 sum(amount) as total_amounts
   from "Transactions" as t
 inner join "CardPrograms" as cp on cp."programId"=t."programId"
   left join "Merchants" as m on cp."MerchantId" = m.id
where t.status = 'accepted'
and t.type in ('redemption')
and cp."productType" in ('Card')
and date_trunc('month', (t."createdAt" + interval '7 hours'))='2018-06-01'

group by 1,2,3
order by 1 asc
*/




select
 date_trunc('month', (t."createdAt" + interval '7 hours')) as month, m.brand, m.company,
 count(1) as transaction_count,
 sum(amount) as total_amounts
   from "Transactions" as t
 inner join "CardPrograms" as cp on cp."programId"=t."programId"
   left join "Merchants" as m on cp."MerchantId" = m.id
where t.status = 'accepted'
and t.type in ('redemption')
and cp."productType" in ('Tada', 'Tada360')
and date_trunc('month', (t."createdAt" + interval '7 hours'))='2018-06-01'

group by 1,2,3
order by 1 asc



/*
select
 date_trunc('month', (t."createdAt" + interval '7 hours')) as month,  m.brand, m.company,
 count(1) as transaction_count,
 sum(amount) as total_amounts
   from "Transactions" as t

 inner join "CardPrograms" as p on p."programId"=t."programId"
    left join "Merchants" as m on p."MerchantId" = m.id

where t.status = 'accepted'
and t.type in ('activation', 'topup')
and p."productType" in ('Tada', 'Tada360')
and date_trunc('month', (t."createdAt" + interval '7 hours'))='2018-06-01'
group by 1,2,3
order by 1 asc
*/

/*
select
 date_trunc('month', (t."createdAt" + interval '7 hours')) as month,  m.brand, m.company,
 count(1) as transaction_count,
 sum(amount) as total_amounts
   from "Transactions" as t

 inner join "CardPrograms" as p on p."programId"=t."programId"
    left join "Merchants" as m on p."MerchantId" = m.id

where t.status = 'accepted'
and t.type in ('activation', 'topup')
and p."productType" in ('Card')
and date_trunc('month', (t."createdAt" + interval '7 hours'))='2018-06-01'
group by 1,2,3
order by 1 asc

*/


/*

select
date_trunc('month', (t."createdAt" + interval '7 hours')) as month, m.brand, m.company,
 count(1) as transaction_count,
 sum(amount) as total_amounts
   from "Transactions" as t
inner join "CardPrograms" as p on p."programId"=t."programId"
    left join "Merchants" as m on p."MerchantId" = m.id
where t.status = 'accepted'
and t.type in ('redemption')
and p."productType" in ('Giftcard')
and date_trunc('month', (t."createdAt" + interval '7 hours'))='2018-06-01'
group by 1,2,3
order by 1 asc
*/

/*
select
date_trunc('month', (t."createdAt" + interval '7 hours')) as month, m.brand, m.company,
 count(1) as transaction_count,
 sum(amount) as total_amounts
   from "Transactions" as t
inner join "CardPrograms" as p on p."programId"=t."programId"
    left join "Merchants" as m on p."MerchantId" = m.id
where t.status = 'accepted'
and t.type in ('activation', 'topup')
and p."productType" in ('Giftcard')
and date_trunc('month', (t."createdAt" + interval '7 hours'))='2018-06-01'
group by 1,2,3
order by 1 asc
*/

/*
 select
 date_trunc('month', (t."createdAt" + interval '7 hours')) as month, m.brand,m.company,
 count(1) as transaction_count,
 sum(amount) as total_amounts
   from "Transactions" as t

 inner join "CardPrograms" as p on p."programId"=t."programId"
 left join "Merchants" as m on p."MerchantId" = m.id

where t.status = 'accepted'
and t.type in ('egiftRedemption')
--and p."productType" in ('Tada', 'Tada360')
and date_trunc('month', (t."createdAt" + interval '7 hours'))='2018-06-01'
group by 1,2,3
order by 1 asc

*/