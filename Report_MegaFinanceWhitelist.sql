  select rw.* from  "CardPrograms" cp inner join "RewardPrograms" rp
  on cp."id"=rp."RewardedCardProgramId"
  inner join  "RewardWhitelists" rw
  on rp."id"=rw."RewardProgramId"
  where cp."MerchantId" in ('320','686','687')