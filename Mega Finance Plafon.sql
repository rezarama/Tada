select ci.no "No", name "Name","programName",  sum(ci.balance)"Plafond", ci.status "Status"
from "Customers"  c
join "CustomerGiftcards" cg on c.id=cg."CustomerId"
join "CardInventories" ci on ci.id=cg."CardInventoryId"
join "CardPrograms" cp on ci."programId"=cp."programId"
--join "Transactions" t on ci.no=t."cardNo"
where c."MerchantId"=320 and cp."programId"='3000203180019'
group by 1,2,3,5
union
select ci.no "No", name "Name","programName",  sum(ci.balance)"Plafond", ci.status "Status"
from "GCIUsers"  c
join "GCIUserGiftcards" cg on c.id=cg."GCIUserId"
join "CardInventories" ci on ci.id=cg."relationId"
join "CardPrograms" cp on ci."programId"=cp."programId"
--join "Transactions" t on ci.no=t."cardNo"
where cp."MerchantId"=320 and cp."programId"='3000203180019'
group by 1,2,3,5

---

select ci.no "No", name "Name", sum(ci.balance)"Plafond", ci.status "Status"
from "Customers"  c
join "CustomerGiftcards" cg on c.id=cg."CustomerId"
join "CardInventories" ci on ci.id=cg."CardInventoryId"
--join "Transactions" t on ci.no=t."cardNo"
where c."MerchantId"=320
group by 1,2,4