select distinct em."itemName" as egift, count(t.id), sum(t.amount)
  from "Transactions" as t

  inner join "Distributors" as d
    on d.id = t."DistributorId"
  inner join "Egifts" as e
    on e."programId" = t."programId"
  inner join public."EgiftMasters" as em
    on em.id = e."EgiftMasterId"

where t.status = 'accepted'
  and t."updatedAt" >= '20170101'
  and d.id = 14



group by 1

order by 2 desc