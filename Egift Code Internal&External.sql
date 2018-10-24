--egift external code
select eg.code,e.number,e.code,ve.number 
from "EgiftGroups" eg 
left join "EgiftGroupPrograms" egp on eg."id"=egp."EgiftGroupId"
left join "Egifts" e on egp."EgiftId" = e."id"
left join "VoucherExternals" ve on e.id=ve."EgiftId"
where e.code in

--egift internal code
select * from "Egifts" e
join "Transactions" t on e.number=t."cardNo" and e."programId"=t."programId"
where number='27730670'--513250