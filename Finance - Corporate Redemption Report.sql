select m.brand as "Issuer",
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
  end) as "January 2017",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-02-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "February 2017",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-03-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "March 2017",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-04-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "April 2017",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-05-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "May 2017",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-06-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "June 2017",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-07-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "July 2017",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-08-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "August 2017",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-09-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "September 2017",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-10-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "October 2017",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-11-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "November 2017",
  sum  (
  case
  when date_trunc('month', t."createdAt") = '2017-12-01' and t.type in ('redemption') and t.status = 'accepted' then t.amount
  else 0
  end) as "December 2017"
  from "Transactions" t

  inner join "Merchants" m on t."MerchantId" = m.id
  group by 1