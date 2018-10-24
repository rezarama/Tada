select g.phone,g.name,g.email,ci.no,m.brand from "GCIUsers" g--4517840346294918
join "GCIUserGiftcards" gci on g.id=gci."GCIUserId"
join "CardInventories" ci on gci."relationId"=ci.id
join "CardPrograms" cp on ci."programId"=cp."programId"
join "Merchants" m on cp."MerchantId"=m.id
where ci.status='activated'
and g."confirmedAt" is not null
and ci."expiredAt">=current_date
and m.brand not ILIKE '%DEMO%'
and m."mId"='4517'
and g.phone in()