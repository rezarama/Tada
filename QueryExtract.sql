/*select  distinct g.name, m.brand, g."phone", cast(gci."addedAt" as date) as tanggal , ci.no as cardno
--count(gci."GCIUserId") as total
  from "GCIUsers" g
  inner join "GCIUserGiftcards" gci on g.id = gci."GCIUserId"
  inner join "CardInventories" ci on gci."relationId" = ci.id
  inner join "CardPrograms" cp on ci."programId" = cp."programId"
   inner join "Merchants" m on m.id=cp."MerchantId"
where cp."MerchantId" = 705 and
 gci."relationType" = 'CardInventory' -- and
  --gci."addedAt" >= '2018-01-01'
  -- and  gci."addedAt" <= '2018-02-26'
 -- group by 1,2,3
  order by cast(gci."addedAt" as date) desc

  */



/*
with cte as (
select  m.brand, cast(t."createdAt" as date) as tanggal , sum(t.amount) as totalAmount ,
0 as totalcount
from "Transactions" t
 inner join "CardPrograms" cp on t."programId" = cp."programId"
 inner join "Merchants" m on t."MerchantId" = m.id
where  t.type = 'activation' and t.status = 'accepted'
--and cp."isPointProgram"='f'
 --t."createdAt" between '2017-01-01' and '2017-12-31'
--   and "ApiUserId" in (1701,1756)
group by m.brand ,  cast(t."createdAt" as date)
--order by sum(t.amount) desc
union all
select  m.brand, cast(t."createdAt" as date) as tanggal , 0 as totalAmount ,
count(t.amount) as totalcount
from "Transactions" t
 inner join "CardPrograms" cp on t."programId" = cp."programId"
 inner join "Merchants" m on t."MerchantId" = m.id
where  t.type = 'activation' and t.status = 'accepted'
--and cp."isPointProgram"='f'
 --t."createdAt" between '2017-01-01' and '2017-12-31'
  -- and "ApiUserId" in (1701,1756)
group by m.brand ,  cast(t."createdAt" as date)
--order by sum(t.amount) desc
)
select
  "brand",
  SUM(CASE WHEN "tanggal" = current_date-3 THEN totalAmount ELSE 0 END) AS "3 days before (amount)",
  SUM(CASE WHEN "tanggal" = current_date-3 THEN totalcount  ELSE 0 END) AS "3 days before (count)",
  SUM(CASE WHEN "tanggal" =current_date-2  THEN totalAmount ELSE 0 END) AS "2 days before (amount)",
  SUM(CASE WHEN "tanggal" = current_date-2 THEN totalcount  ELSE 0 END) AS "2 days before (count)",
  SUM(CASE WHEN "tanggal" = current_date-1  THEN totalAmount ELSE 0 END) AS "yesterday (amount)" ,
  SUM(CASE WHEN "tanggal" = current_date-1 THEN totalcount  ELSE 0 END) AS "yesterday (count)",
  SUM(CASE WHEN "tanggal" >= '2018-01-01' AND "tanggal" <= current_date-1 THEN totalAmount ELSE 0 END) AS "TotalYTD_2018 (amount)",
  SUM(CASE WHEN "tanggal" >= '2018-01-01' AND "tanggal" <= current_date-1 THEN totalcount ELSE 0 END) AS "TotalYTD_2018 (count)"

FROM cte
GROUP BY 1
ORDER BY 6 DESC

*/
/*
select distinct  ap.username , st."location"
from
"ApiUsers" as ap
    inner join "Stores" as st
    on st.id=ap."StoreId"
     inner join "Distributors" as ds
    on ds.id=st."DistributorId"
     where  ds."dId"='27077'


    */

/*
    select a.merchant, a."type", sum(a.amount) from (
select t."cardNo", to_char(t."createdAt",'yyyy-mm-dd hh24:mi:ss')"transactionDate", t."type", t.amount
,m.brand as merchant, ap.id as "terminalId", ap."username" "terminalName",st."location" "store", t."status"
from "Transactions" as t
inner join "CardPrograms" as c on c."programId" = t."programId"
inner join "Merchants" as m on m.id=t."MerchantId"
inner join "ApiUsers" as ap on ap.id=t."ApiUserId"
inner join "Stores" as st on st.id=ap."StoreId"
where t.status='accepted'
and t."createdAt" >= '2018-01-01' and t."createdAt" < '2018-06-01'
--and date_trunc('month', (t."createdAt" + interval '7 hours'))='2018-03-01'
and t.type in ('redemption')
and m.id in ('704','701','689','700','714','712','744','177','743')
and ap.id not in ('989890','72916','51652001','347347','31866000')
and c."programId"not in ('1002703180049','1002202180013','1002803180055','1001704180074','1002603180047','1002603180048','1002103180044','1002903180058')

order by 2 desc
) a
group by a.merchant, a."type"

*/

/*
 --select a.merchant, a."type", sum(a.amount) from (
select t."cardNo", to_char(t."createdAt",'yyyy-mm-dd hh24:mi:ss')"transactionDate", t."type", t.amount
,m.brand as merchant, ap.id as "terminalId", ap."username" "terminalName",st."location" "store", t."status"
from "Transactions" as t
inner join "CardPrograms" as c on c."programId" = t."programId"
inner join "Merchants" as m on m.id=t."MerchantId"
inner join "ApiUsers" as ap on ap.id=t."ApiUserId"
inner join "Stores" as st on st.id=ap."StoreId"
where t.status='accepted'
and t."createdAt" >= '2018-01-01' and t."createdAt" < '2018-06-01'
--and date_trunc('month', (t."createdAt" + interval '7 hours'))='2018-03-01'
and t.type in ('activation')
and m.id in ('704','701','689','700','714','712','744','177','743','786','783','761','785','788','787','758','798','792','777','800','790','802','796','833')
and ap.id not in ('989890','72916','51652001','347347','31866000','41727000','83854009','3916000','27421000','61064444','87997000','58864000','72823000','99638007','57029000','5912000','1113000','87834008','65576000')
and c."programId"not in ('1002703180049','1002202180013','1002803180055','1001704180074','1002603180047','1002603180048','1002103180044','1002903180058','1001005180108','1000205180097','1001005180112','1000205180089','1000205180096','1000205180102','1001505180122','1000705180103','1001605180129')

order by 2 desc
--) a
--group by a.merchant, a."type"


*/



 select distinct(s."location") as store_code, count(t.id) as jumlah, sum(t.amount) as total
 from "Transactions" as t
 inner join "CardPrograms" as c
   on c."programId" = t."programId"
 inner join "Stores" as s
   on s.id = t."StoreId"
where t.status = 'accepted'
 and t.type in ('activation')
 and t."createdAt" >='20180501' and t."createdAt" < '20180601'
 and t."MerchantId" = 177
group by 1
order by 1 asc