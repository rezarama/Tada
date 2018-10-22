    select t."cardNo", t.amount ,t."createdAt",
     eg.code
   from "Transactions" as t
     inner join "Egifts" e on e."number"=t."cardNo"
     inner join "EgiftGroupPrograms" egp on egp."EgiftId" = e."id"
     inner join "EgiftGroups" eg on eg."id"=egp."EgiftGroupId"
 where-- t.status = 'accepted'
   --and t.type in ('egiftRedemption')
 --  and date_trunc('month', (t."createdAt" + interval '7 hours'))='2018-03-01'
   --and m.id='79'
  -- and m.id='153'
  --and m.id='79'
  --and
  eg.code in ('2y1l96c9',
'69oau26g',
'6zb9gkn4',
'3nnb4ap6',
'ihx1rko6',
'1kp8kpmy',
'1lni14h7',
'c635gvk4',
'f01dkrx5',
'753fse4f',
'3kshl2gb',
'q9o2vlle',
'56x76mom',
'uans1gv5',
'o1znxe9f',
'etebydf6',
'x6k9pvts',
'jx09l9ct',
't35m3y8g',
'ectm1kmg',
'e4y43sns',
'gtg0gk2n',
'sxn82wu7',
'mqliaquf',
'7p2avcud',
'mqqv0ott',
'xlncpmqg',
'4f27rmcx',
'cv1dmeu1',
'impr8031',
'cz0cukt0',
'xce8rm9e',
'txeb96rp',
'gdg7fg59',
'2gl0zcf2',
'k12rn0yz',
'c491kvs3',
'i7bt4sr3',
'uwumdqsf',
'cvew6g1n')