with cte as(
select
  1 id,
  m.brand "Merchant",
  'Total Advocate' "Type",
  coalesce(count(distinct coalesce("GCIUserId",0)),0) "Sum"
from
  "RewardWhitelists" rw
  inner join "RewardPrograms" rp on rw."RewardProgramId" = rp.id
  inner join "Merchants" m on rp."MerchantId" = m.id
where
   m."id" = 919
      and rp.type = 'referral'
      --and rw."createdAt" >= '2018-06-04'
	  and m.company NOT ILIKE '%DUMMY%'
	  and m.company NOT ILIKE '%TEST%'
	  and m.company NOT ILIKE '%NOT USED%'
	  and m.company NOT ILIKE '%OLD%'
 	  and m.brand NOT ILIKE '%DUMMY%'
	  and m.brand NOT ILIKE '%TEST%'
	  and m.brand NOT ILIKE '%NOT USED%'
	  and m.brand NOT ILIKE '%OLD%'
group by 2
)

select "Type","Sum" from(
select a.id,
--case when a."Merchant" is null then b."Merchant" else a."Merchant" end "Merchant",
case when a."Type" is null then b."Type" else a."Type" end "Type",
sum(case when a."Sum"=0 then b."Sum" else a."Sum" end )"Sum"
from
(select * from cte
union
select 1,null,null,0
where not exists(select * from cte))A
join (select
  1 id,
  m.brand "Merchant",
  'Total Advocate' "Type",
  count(distinct "ReferrerId") "Sum"
from
  "RewardReferralUsers" rru
  inner join "RewardPrograms" rp on rru."RewardProgramId" = rp.id
  inner join "Merchants" m on rp."MerchantId" = m.id
where
   m."id" = 919
      and rp.type = 'referral'
      --and rw."createdAt" >= '2018-06-04'
	  and m.company NOT ILIKE '%DUMMY%'
	  and m.company NOT ILIKE '%TEST%'
	  and m.company NOT ILIKE '%NOT USED%'
	  and m.company NOT ILIKE '%OLD%'
 	  and m.brand NOT ILIKE '%DUMMY%'
	  and m.brand NOT ILIKE '%TEST%'
	  and m.brand NOT ILIKE '%NOT USED%'
	  and m.brand NOT ILIKE '%OLD%'
group by 2)B
on a.id=b.id
group by 1,2

UNION
select  2,
      --m.brand,
      'Total Referred Sign Up',
      count(c."id")
        from
          "CardPrograms" cp
          inner join "RewardPrograms" rp on cp."id" = rp."RewardedCardProgramId"
          inner join "RewardReferralUsers" rru on rp."id" = rru."RewardProgramId"
		  inner join "GCIUsers" g on rru."GCIUserId"=g.id
		  left join "Customers" c on g.phone=c.phone
          inner join "Merchants" m on m.id = cp."MerchantId" and c."MerchantId"=m.id
        where
          rp.type = 'referral'
		  --and rru.source='referral_code'
          and m."id" = 919
          and rru."createdAt"::date<=current_date-1 and c."createdAt"::date<=current_date-1
		  and c."confirmedAt" is not null
          --and rru."createdAt" >= '2018-06-04'
		  and m.company NOT ILIKE '%DUMMY%'
	  and m.company NOT ILIKE '%TEST%'
	  and m.company NOT ILIKE '%NOT USED%'
	  and m.company NOT ILIKE '%OLD%'
 	  and m.brand NOT ILIKE '%DUMMY%'
	  and m.brand NOT ILIKE '%TEST%'
	  and m.brand NOT ILIKE '%NOT USED%'
	  and m.brand NOT ILIKE '%OLD%'
	  	  --group by 2
UNION
select
      3,
      --brand,
      'Total Referred who do Purchase',
      count(*)
    from(
        select
          t."cardNo",
          m.brand,
		  count(t.id)
        from
          "Transactions" t
		  inner join "RewardReferralUsers" rru on t."cardNo" = rru."cardNo"
		  inner join "Merchants" m on t."MerchantId"=m.id
		  inner join "GCIUsers" g on rru."GCIUserId"=g.id
		  left join "Customers" c on g.phone=c.phone and c."MerchantId"=m.id
        where
          t."MerchantId" = 919
          and t.type in('topup','walletTopup')
          --and t."createdAt" >= '2018-06-04'
          and t.status = 'accepted'
          and t."createdAt"::date<=current_date-1
          and t."cardNo" in (
            select
              "cardNo"
            from
              "RewardReferralUsers" rru
              inner join "RewardPrograms" rp on rru."RewardProgramId" = rp.id
            where
              rp."MerchantId" = 919
              and rp.type = 'referral'
              --and rru."createdAt" >= '2018-06-04'
              --and rru."source" = 'referral'
          )
		and m.company NOT ILIKE '%DUMMY%'
	  and m.company NOT ILIKE '%TEST%'
	  and m.company NOT ILIKE '%NOT USED%'
	  and m.company NOT ILIKE '%OLD%'
 	  and m.brand NOT ILIKE '%DUMMY%'
	  and m.brand NOT ILIKE '%TEST%'
	  and m.brand NOT ILIKE '%NOT USED%'
	  and m.brand NOT ILIKE '%OLD%'
		group by 1,2
      ) A --group by 2
UNION
select
      4,
      --m.brand,
      'Total Revenue from Referral',
      coalesce(sum(coalesce(t.amount, 0)),0)
    from
      "Transactions" t
	  inner join "RewardReferralUsers" rru on t."cardNo" = rru."cardNo"
	  inner join "RewardPrograms" rp on rru."RewardProgramId" = rp.id
	  inner join "Merchants" m on t."MerchantId"=m.id
    where
      m."id" = 919
       and t.type in('topup', 'walletTopup')
      --and t."createdAt" >= '2018-06-04'
      and t.status = 'accepted'
	  and rp.type = 'referral'
	  and t."createdAt"::date<=current_date-1
	  and m.company NOT ILIKE '%DUMMY%'
	  and m.company NOT ILIKE '%TEST%'
 	  and m.brand NOT ILIKE '%DUMMY%'
	  and m.brand NOT ILIKE '%TEST%'
	  --group by 2
UNION
select
	    5,
	    --m.brand,
      'Total Commission Allocated',
	    coalesce(sum(coalesce(rcv."commissionValue",0)),0)"CommissionValue"
	  from
	    "RewardPrograms" rp
	  inner join "RewardCommissions" rc on rc."RewardProgramId"=rp.id
	  inner join "RewardCommissionValues" rcv on rcv."RewardCommissionId"=rc.id
	  inner join "Merchants" m on m.id=rp."MerchantId"
	  where m.id=919
	  and rcv."createdAt"::date<=current_date-1
	  and m.company NOT ILIKE '%DUMMY%'
	  and m.company NOT ILIKE '%TEST%'
	  and m.company NOT ILIKE '%NOT USED%'
	  and m.company NOT ILIKE '%OLD%'
 	  and m.brand NOT ILIKE '%DUMMY%'
	  and m.brand NOT ILIKE '%TEST%'
	  and m.brand NOT ILIKE '%NOT USED%'
	  and m.brand NOT ILIKE '%OLD%'
	  --and rcv."createdAt">='2018-06-04'
	  --and not exists(select 1 from "ReferralCodes" rco where rco."RewardProgramId"=rp.id)
	  --group by 2
ORDER BY id
)A
order by id