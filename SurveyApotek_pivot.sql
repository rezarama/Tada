/*select c."phone",  b.question, b.answers FROM "public"."SurveyAnswers" a
inner join "Answers"  b
on a."id"=b."SurveyAnswerId" inner join  "GCIUsers" c
on a."GCIUserId"=c."id"
--where a."MerchantId"=153
where a."MerchantId"in ('705')
--where a."MerchantId"in ('387')
and b.id < 10370
order by b.id asc
*/


/*
 select  c."phone",  b.question, b.answers FROM "public"."SurveyAnswers" a
inner join "Answers"  b
on a."id"=b."SurveyAnswerId" inner join  "GCIUsers" c
on a."GCIUserId"=c."id"
--where a."MerchantId"=153
where a."MerchantId"in ('772')
--and b.id between '4027' and '10370'
--and  date_trunc('month', (a."createdAt"))='2018-04-01'
--order by b.id asc
*/

/*
 select  c."phone",  b.question, b.answers FROM "public"."SurveyAnswers" a
inner join "Answers"  b
on a."id"=b."SurveyAnswerId" inner join  "GCIUsers" c
on a."GCIUserId"=c."id"
--where a."MerchantId"=153
where a."MerchantId"in ('705') and a."SurveyId"='211'
--and b.id between '4027' and '10370'
--and  date_trunc('month', (a."createdAt"))='2018-04-01'
--order by b.id asc

*/

/*

select  c."phone",  b.question, b.answers--, cast(a."createdAt" as date) as tanggal
FROM "public"."SurveyAnswers" a
inner join "Answers"  b
on a."id"=b."SurveyAnswerId" inner join  "GCIUsers" c
on a."GCIUserId"=c."id"
--where a."MerchantId"=153
where a."MerchantId"in ('206') and a."SurveyId"='245'
and cast(a."createdAt" as date) >current_date-7 and cast(a."createdAt" as date) <= current_date-1
order by cast(a."createdAt" as date) asc

*/




select  c."phone",  b.question,
replace(replace(replace(b.answers::varchar,'"'::varchar,''::varchar),'{'::varchar,''::varchar),'}'::varchar,''::varchar)"answers"
FROM "SurveyAnswers" a
inner join "Answers"  b on a."id"=b."SurveyAnswerId"
inner join  "GCIUsers" c on a."GCIUserId"=c."id"
where a."MerchantId"in ('705')
and  date_trunc('month', (a."createdAt"))='2018-06-01'