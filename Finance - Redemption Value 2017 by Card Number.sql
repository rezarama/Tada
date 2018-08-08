select t."cardNo" as "Card Number",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2016-11-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "November 2016",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2016-12-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "December 2016",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-01-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "January",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-02-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "February",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-03-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "March",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-04-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "April",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-05-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "May",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-06-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "June",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-07-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "July",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-08-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "August",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-09-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "September",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-10-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "October",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-11-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "November",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-12-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "December"


  from "Transactions" t
  where t."MerchantId" in (29)

  group by 1