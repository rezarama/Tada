

select t."cardNo", cp."paymentType"  from "Transactions" as t
inner join
"CardPrograms" cp on cp."programId" = t."programId"
where t."cardNo" in ('72109200',
'85034627',
'48482962',
'12118790',
'49277114',
'13627252',
'09584079',
'24418402',
'60097094'

)