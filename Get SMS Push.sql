select AA.*,BB."content" from(
select m."brand", s."location" , rw.phone as telp,rw."createdAt"  --, ci.no, 
    from  "CardPrograms" cp
    inner join "RewardPrograms" rp
  on cp."id"=rp."RewardedCardProgramId"
  inner join "Merchants" m
  on m.id=cp."MerchantId"
  --  inner join "CardInventories" ci  on ci."programId" = cp."programId"
  left join  "RewardWhitelists" rw
    on rp."id"=rw."RewardProgramId"
  left join "RewardWhitelistTransactions" rt
  on rt."RewardWhitelistId"= rw."id"    and rt.amount=0
  left join "ApiUsers" api
  on rt."ApiUserId"=api.id
  left join "Stores" s
  on api."StoreId" = s.id
  where  cp."MerchantId" in (712)
  and "isRewarded"=false -- and cast(rw."createdAt" as date) between '2018-01-01' and current_date-1
  --and rt.amount=0
)AA	
left join(
select * from "InboundNotifications"
where "type"='sms')BB
on AA."telp"=BB."to" --and "content" like '%!%'
and ("content" like '%Congratulation !%'
or "content" like '%Hai!%'
or "content" like '%Hi!%'
or "content" like '%Anda telah mendapatkan kartu%')
order by "telp", "createdAt"--+6281806763500