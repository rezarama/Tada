SELECT "EgroupCode", string_agg("EgiftCode", ', ')"EgiftCode",string_agg("externalCode", ', ') AS "externalCode"
     FROM  (
        select eg.code "EgroupCode", t."cardNo"::varchar "EgiftCode",ve.number "externalCode"
   from "Transactions" as t
    inner join "CardPrograms" as p on p."programId"=t."programId"
     inner join "Merchants" m on t."MerchantId" = m.id
     inner join "Egifts" e on e."number"=t."cardNo"
     inner join "EgiftGroupPrograms" egp on egp."EgiftId" = e."id"
     inner join "EgiftGroups" eg on eg."id"=egp."EgiftGroupId"
     inner join "EgiftGroupBatches" egb on cast(egb."batchNum" as int)= eg."batchNum"
     inner join "EgiftGroupMasters" egm on egm."id"= egb."EgiftGroupMasterId"
	 inner join "VoucherExternals" ve on e.id=ve."EgiftId"
    where t.status = 'accepted'
   --and t.type in ('egiftRedemption')
   and eg.code in () 
)A GROUP  BY 1