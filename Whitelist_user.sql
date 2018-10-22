  select rw.* from  "CardPrograms" cp inner join "RewardPrograms" rp
  on cp."id"=rp."RewardedCardProgramId"
  inner join  "RewardWhitelists" rw
  on rp."id"=rw."RewardProgramId"
  where cp."MerchantId" in ('320','686','687')

  /*


   select rw.* , rt.* from  "CardPrograms" cp inner join "RewardPrograms" rp
  on cp."id"=rp."RewardedCardProgramId"
  inner join  "RewardWhitelists" rw
    on rp."id"=rw."RewardProgramId"
  inner join "RewardWhitelistTransactions" rt
  on rt."RewardWhitelistId"= rw."id"
  where cp."MerchantId" in ('701')
  and rt.amount=0
  */