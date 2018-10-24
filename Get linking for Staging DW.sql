select left("CardBridgeId", strpos("CardBridgeId", 'Y')-1) from(
select gci."GCIUserId"::varchar||'Y'||cg."CustomerId"::varchar "CardBridgeId", gci."relationType"
from "GCIUserGiftcards" gci
join "CustomerGiftcards" cg on gci."relationId"=cg."CardInventoryId"
where "relationId"='1334633'
)A

select right("CardBridgeId",length("CardBridgeId")-strpos("CardBridgeId", 'Y')) from(
select gci."GCIUserId"::varchar||'Y'||cg."CustomerId"::varchar "CardBridgeId", gci."relationType"
from "GCIUserGiftcards" gci
join "CustomerGiftcards" cg on gci."relationId"=cg."CardInventoryId"
where "relationId"='1334633'
)A

select left("ff", strpos("ff", 'Y')-1) from(
select a||'Y'||b "ff" from(
select 122 a,230 b
union select 20,1234)A
)B 

select right("ff",length("ff")-strpos("ff", 'Y')) from(
select a||'Y'||b "ff" from(
select 12 a,230 b
union select 20,12234  )A
)B 