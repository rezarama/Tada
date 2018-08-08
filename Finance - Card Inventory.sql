select m.brand as "Merchant"
  ,count
    (case
    when ci."activatedAt" is not null and ci.status = 'activated' and ci."expiredAt" >= '20171231'and ci.balance = 0 then ci.id end) "Cards Total(0)"
  ,sum
    (case
    when ci."activatedAt" is not null and ci.status = 'activated' and ci."expiredAt" >= '20171231'and ci.balance = 0 then ci.balance end) "Cards Balance (0)"
    ,count
    (case
    when ci."activatedAt" is not null and ci.status = 'activated' and ci."expiredAt" >= '20171231'and ci.balance > 0 and ci.balance <= 50000 then ci.id end) "Cards Total(1-50)"
  ,sum
    (case
    when ci."activatedAt" is not null and ci.status = 'activated' and ci."expiredAt" >= '20171231'and ci.balance > 0 and ci.balance <= 50000 then ci.balance end) "Cards Balance (1-50)"
    ,count
    (case
    when ci."activatedAt" is not null and ci.status = 'activated' and ci."expiredAt" >= '20171231'and ci.balance > 50000 and ci.balance <= 100000 then ci.id end) "Cards Total(50-100)"
  ,sum
    (case
    when ci."activatedAt" is not null and ci.status = 'activated' and ci."expiredAt" >= '20171231'and ci.balance > 50000 and ci.balance <= 100000 then ci.balance end) "Cards Balance (50-100)"
    ,count
    (case
    when ci."activatedAt" is not null and ci.status = 'activated' and ci."expiredAt" >= '20171231'and ci.balance > 100000 and ci.balance <= 200000 then ci.id end) "Cards Total(101-200)"
  ,sum
    (case
    when ci."activatedAt" is not null and ci.status = 'activated' and ci."expiredAt" >= '20171231'and ci.balance > 100000 and ci.balance <= 200000 then ci.balance end) "Cards Balance (101-200)",
    count
    (case
    when ci."activatedAt" is not null and ci.status = 'activated' and ci."expiredAt" >= '20171231'and ci.balance > 200000 then ci.id end) "Cards Total(201)"
  ,sum
    (case
    when ci."activatedAt" is not null and ci.status = 'activated' and ci."expiredAt" >= '20171231'and ci.balance > 200000 then ci.balance end) "Cards Balance (201)"

    from "CardInventories" ci

  inner join "CardPrograms" cp on ci."programId" = cp."programId"
  inner join "Merchants" m on cp."MerchantId" = m.id

  group by 1
  order by 10 desc