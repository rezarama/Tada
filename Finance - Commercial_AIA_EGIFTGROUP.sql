
    select t."cardNo", t.amount ,t."createdAt",  egm."groupName", eg."EgiftGroupBatchId",
     eg.code
   from "Transactions" as t
    inner join "CardPrograms" as p on p."programId"=t."programId"
     inner join "Merchants" m on t."MerchantId" = m.id
     inner join "Egifts" e on e."number"=t."cardNo"
     inner join "EgiftGroupPrograms" egp on egp."EgiftId" = e."id"
     inner join "EgiftGroups" eg on eg."id"=egp."EgiftGroupId"
     inner join "EgiftGroupBatches" egb on cast(egb."batchNum" as int)= eg."batchNum"
     inner join "EgiftGroupMasters" egm on egm."id"= egb."EgiftGroupMasterId"
    where t.status = 'accepted'
   and t.type in ('egiftRedemption')
 --  and date_trunc('month', (t."createdAt" + interval '7 hours'))='2018-03-01'
   --and m.id='79'
  -- and m.id='153'
  and m.id='79'