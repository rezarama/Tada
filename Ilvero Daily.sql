with recursive cte as(
select to_char(t."createdAt"+interval '7 hours','yyyy-mm-dd hh24:mi:ss')"createdAt",
t.id,
--Cust Name,
--Cust Phone,
t."cardNo" "Egift No",
--cardNo
cp."programName",
--activation store
s.location,
t.type,
t.amount,
t.status,
t."MerchantId"
from "Transactions" t
join "CardPrograms" cp on t."programId"=cp."programId"
join "Stores" s on t."StoreId"=s.id
where t.type='egiftRedemption'
and t.status='accepted'
and t."MerchantId"=890
),
--egift from order
cte_2 as(
select ci.no,c.name,c.phone,zz.number,zz.location from "CardInventories" ci
	join "CustomerGiftcards" cg on cg."CardInventoryId"=ci.id
	join "Customers" c on c.id=cg."CustomerId"
	join(
select A."cardNo",
	A.number,
	B.location 
	from(
	  select
         t."cardNo",
	     e.number
      from
         "Transactions" as t 
         inner join "CardPrograms" cp on t."programId" = cp."programId" 
         inner join "Merchants" as m on m.id = t."MerchantId" 
         inner join "Orders" as o on o."TransactionId" = t.id 
         left join "OrderEgifts" as oe on oe."OrderId" = o.id 
         left join "Egifts" as e on e.id = oe."EgiftId" 
      where
         t.status = 'accepted'
		 and e.status='used'
		 and t.type in('redemption','walletRedemption')
         and m.id=890
      order by
         1 desc
	) A
	left join (select "cardNo",location from "Transactions" t
		 join "Stores" s on t."StoreId"=s.id
		 where type='activation' and status='accepted'
			  and t."MerchantId"=890) B
	on A."cardNo"=B."cardNo"
	)ZZ on ci.no=ZZ."cardNo"
),
--egift from sign up bonus
cte_3 as(
	select ci.no,yy.name,yy.phone,yy."Egift No",b.location from(
	select g.name,g.phone,cte."Egift No",g."id", cte."MerchantId"
	from cte as cte
	left join "Egifts" e on e.number=cte."Egift No"
	join "GCIUserGiftcards" gci on e.id=gci."relationId"
	join "GCIUsers" g on gci."GCIUserId"=g.id
	where gci."relationType"='Egift'
	and left(cte."programName",6)='Reward'
	) YY
	left join "GCIUserGiftcards" gci on yy."id"=gci."GCIUserId"
	left join "CardInventories" ci on gci."relationId"=ci.id
	join "CardPrograms" cp on cp."programId"=ci."programId" and cp."MerchantId"=yy."MerchantId"
	left join (select "cardNo",location from "Transactions" t
			 join "Stores" s on t."StoreId"=s.id
			 where type='activation' and status='accepted'
			  and t."MerchantId"=890) B
	on b."cardNo"=ci.no
	where gci."relationType"='CardInventory'
)



select a."createdAt",
a.id,
coalesce(b.name,c.name)"name",
coalesce(b.phone,c.phone)phone,
a."Egift No",
coalesce(b.no,c.no)"cardNo",
a."programName",
coalesce(b.location,c.location)"location",
a.location,
a.type,
a.amount,
a.status from cte a
left join cte_2 b on a."Egift No"=b.number
left join cte_3 c on a."Egift No"=c."Egift No"