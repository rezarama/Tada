select A."cardNo",B.brand, A.code, A."generatorType", A."groupName", A."amount" from(
select t."cardNo", egm."groupName", eb."generatorType",
   eg.code, em."MerchantId" "Issuer", sum(t.amount) "amount"
   from "Transactions" as t
    inner join "CardPrograms" as p on p."programId"=t."programId"
     inner join "Merchants" m on t."MerchantId" = m.id
     inner join "Egifts" e on e."number"=t."cardNo"
	 left join "EgiftMasters" as em on em.id = e."EgiftMasterId"
	 inner join "EgiftBatches" eb ON eb."id" = e."EgiftBatchId"
     inner join "EgiftGroupPrograms" egp on egp."EgiftId" = e."id"
     inner join "EgiftGroups" eg on eg."id"=egp."EgiftGroupId"
     inner join "EgiftGroupBatches" egb on cast(egb."batchNum" as int)= eg."batchNum"
     inner join "EgiftGroupMasters" egm on egm."id"= egb."EgiftGroupMasterId"
    where t.status = 'accepted'
  group by 1,2,3,4,5
)A
left join "Merchants" as B on a."Issuer"=b.id
where A."cardNo" in