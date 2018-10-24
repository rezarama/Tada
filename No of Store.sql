with recursive cte_jan as(
select A."Merchantid",A.brand "Brand", C."programId" "Outlet by ProgramId", count(B."Outlet")"Outlet", A."Member" from(
	
  select m.id "Merchantid",m.brand, count(distinct g.id) "Member" from "GCIUsers" g join "Customers" c on g.phone=c.phone
  join "Merchants" m on c."MerchantId"=m.id
  and (upper(m.company) not ilike '%DUMMY%' and upper(m.company) not ilike '%DEMO%' and upper(m.company) not ilike '%TESTING%'
  and upper(m.company) not ilike '%DUMMIES%' and upper(m.company) not ilike '%NOT USED%' and upper(m.company) not ilike '%TADA%')
  and (upper(m.brand) not ilike '%DUMMY%' and upper(m.brand) not ilike '%DEMO%' and upper(m.brand) not ilike '%TESTING%'
  and upper(m.brand) not ilike '%DUMMIES%' and upper(m.brand) not ilike '%NOT USED%' and upper(m.brand) not ilike '%TADA%' and upper(m.brand) not ilike '%OLD%')
  and date_trunc('month', (g."createdAt"+interval '7 hours'))::date<'2018-02-01'
  group by 1,2
	
  select  m.id "Merchantid",m.brand , count(g."id") as "Member"
  from "Customers" g
  inner join "Merchants" m on m.id=g."MerchantId"
  where (upper(m.company) not ilike '%DUMMY%' and upper(m.company) not ilike '%DEMO%' and upper(m.company) not ilike '%TESTING%'
  and upper(m.company) not ilike '%DUMMIES%' and upper(m.company) not ilike '%NOT USED%' and upper(m.company) not ilike '%TADA%')
  and ( upper(m.brand) not ilike '%OLD%')
  and date_trunc('month', (g."createdAt"+interval '7 hours'))::date<'2018-02-01'
  group by 1,2
	
)A
left join(
select m.id "Merchantid", s.location "Outlet"
from "Distributors" d
inner join "Merchants" m on(m.id=d."MerchantId" or m.brand=d.brand)
inner join "Stores" s on (d.id=s."DistributorId")
--inner join "ApiUsers" api on api."StoreId"=s.id
where (upper(m.company) not ilike '%DUMMY%' and upper(m.company) not ilike '%DEMO%' and upper(m.company) not ilike '%TESTING%'
and upper(m.company) not ilike '%DUMMIES%' and upper(m.company) not ilike '%NOT USED%' and upper(m.company) not ilike '%TADA%')
and (upper(m.brand) not ilike '%DUMMY%' and upper(m.brand) not ilike '%DEMO%' and upper(m.brand) not ilike '%TESTING%'
and upper(m.brand) not ilike '%DUMMIES%' and upper(m.brand) not ilike '%NOT USED%' and upper(m.brand) not ilike '%TADA%' and upper(m.brand) not ilike '%OLD%')
and (location not ilike '%DUMMY%' and location not ilike '%TESTING%')
--and m.id=239
--and "terminalType" ='mSite'
)B
on A."Merchantid"=B."Merchantid" --and A.date=B.date
left join(select "MerchantId",count("programId")"programId" from "CardPrograms" group by 1) C
on A."Merchantid"=C."MerchantId"
group by 1,2,3,5
order by 5 desc
)

, cte_2017 as(
select A."Merchantid",A.brand "Brand", C."programId" "Outlet by ProgramId", count(B."Outlet")"Outlet", A."Member" from(
	
  select m.id "Merchantid",m.brand, count(distinct g.id) "Member" from "GCIUsers" g join "Customers" c on g.phone=c.phone
  join "Merchants" m on c."MerchantId"=m.id
  and (upper(m.company) not ilike '%DUMMY%' and upper(m.company) not ilike '%DEMO%' and upper(m.company) not ilike '%TESTING%'
  and upper(m.company) not ilike '%DUMMIES%' and upper(m.company) not ilike '%NOT USED%' and upper(m.company) not ilike '%TADA%')
  and (upper(m.brand) not ilike '%DUMMY%' and upper(m.brand) not ilike '%DEMO%' and upper(m.brand) not ilike '%TESTING%'
  and upper(m.brand) not ilike '%DUMMIES%' and upper(m.brand) not ilike '%NOT USED%' and upper(m.brand) not ilike '%TADA%' and upper(m.brand) not ilike '%OLD%')
  and date_trunc('year', (g."createdAt"+interval '7 hours'))::date<'2017-01-01'
  group by 1,2
	
  select  m.id "Merchantid",m.brand , count(g."id") as "Member"
  from "Customers" g
  inner join "Merchants" m on m.id=g."MerchantId"
  where (upper(m.company) not ilike '%DUMMY%' and upper(m.company) not ilike '%DEMO%' and upper(m.company) not ilike '%TESTING%'
  and upper(m.company) not ilike '%DUMMIES%' and upper(m.company) not ilike '%NOT USED%' and upper(m.company) not ilike '%TADA%')
  and (upper(m.brand) not ilike '%DUMMY%' and upper(m.brand) not ilike '%DEMO%' and upper(m.brand) not ilike '%TESTING%'
  and upper(m.brand) not ilike '%DUMMIES%' and upper(m.brand) not ilike '%NOT USED%' and upper(m.brand) not ilike '%TADA%' and upper(m.brand) not ilike '%OLD%')
  and date_trunc('year', (g."createdAt"+interval '7 hours'))::date<'2017-01-01'
  group by 1,2
	
)A
left join(
select m.id "Merchantid", s.location "Outlet"
from "Distributors" d
inner join "Merchants" m on(m.id=d."MerchantId" or m.brand=d.brand)
inner join "Stores" s on (d.id=s."DistributorId")
--inner join "ApiUsers" api on api."StoreId"=s.id
where (upper(m.company) not ilike '%DUMMY%' and upper(m.company) not ilike '%DEMO%' and upper(m.company) not ilike '%TESTING%'
and upper(m.company) not ilike '%DUMMIES%' and upper(m.company) not ilike '%NOT USED%' and upper(m.company) not ilike '%TADA%')
and (upper(m.brand) not ilike '%DUMMY%' and upper(m.brand) not ilike '%DEMO%' and upper(m.brand) not ilike '%TESTING%'
and upper(m.brand) not ilike '%DUMMIES%' and upper(m.brand) not ilike '%NOT USED%' and upper(m.brand) not ilike '%TADA%' and upper(m.brand) not ilike '%OLD%')
and (location not ilike '%DUMMY%' and location not ilike '%TESTING%')
--and m.id=239
--and "terminalType" ='mSite'
)B
on A."Merchantid"=B."Merchantid" --and A.date=B.date
left join(select "MerchantId",count("programId")"programId" from "CardPrograms" group by 1) C
on A."Merchantid"=C."MerchantId"
group by 1,2,3,5
order by 5 desc
)

select A."Brand",A."Outlet",A."Outlet by ProgramId", coalesce(A."Member",0)-coalesce(B."Member",0) "Accumulate",A."Member" "Total" 
from cte_jan A left join cte_2017 B on A."Merchantid"=B."Merchantid"
order by 5 desc