with cte as(
SELECT e."id", e."batchNum", e."number"
	, case when e."status"='activated' and "expiredAt"<current_date then 'Expired' else e."status" end status
	, e."programId", e."amount", e."usedAt", e."expiredAt", e."createdAt", m."brand" as "merchantName", m.company "CompanyMerchant"
	, i."brand" as "issuerName", i.company "CompanyIssuer", cp."programName", eb."generatorType", ag."brand" as "aggregatorName"
	, cp."paymentType"
from "Egifts" e
INNER JOIN "Merchants" m ON m."id" = e."MerchantId"
INNER JOIN "Merchants" i ON i."id" = e."IssuerId"
INNER JOIN "CardPrograms" cp ON cp."programId" = e."programId"
INNER JOIN "EgiftBatches" eb ON eb."id" = e."EgiftBatchId"
LEFT JOIN "Distributors" ag ON ag."distributorType" = 'aggregator' 
 and eb."generatorType"='Aggregator' 
and ag."id"=eb."generatorId"
--WHERE e."IssuerId" = 1 
ORDER BY e."createdAt" DESC  
)
select cte.* from cte
where cte.status='Expired'
and cte."createdAt" >= '2018-01-01'