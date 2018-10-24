select "cardNo" "Card", to_char(t."createdAt" + interval '7 hours','yyyy-mm-dd hh24:mi:ss') as "Date",
s.location "Location", api.id "Terminal Id", api.username "Terminal Name", sum(t.amount) "Total"
from "Transactions" t
 inner join "CardPrograms" cp on t."programId" = cp."programId"
 inner join "Merchants" m on t."MerchantId" = m.id
 inner join "Stores" s on t."StoreId"=s.id
 inner join "ApiUsers" api on t."ApiUserId"=api.id
where  t.status = 'accepted' and cp."isPointProgram"='t'
and t."createdAt"::date >= '2018-09-01' and cp."MerchantId" = 981
and t.type='adjustment' and "username" in ('migrasi')
group by 1,2,3,4,5
order by "Date" desc