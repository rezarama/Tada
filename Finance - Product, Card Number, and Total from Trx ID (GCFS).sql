select o."orderCode", t."cardNo", m.company ,m.brand, c."productType", t.amount
  from "Transactions" as t

  inner join "Orders" as o
    on o."TransactionId" = t.id
  inner join "CardInventories" as i
    on t."distributionId" = i."distributionId"
  inner join "CardPrograms" as c
    on c."programId" = i."programId"
  inner join "Merchants" as m
    on t."MerchantId" = m.id
where o."orderCode" in
('GCI7IEC0KGSJ35X',
'GCI3CZQ1FOEYNU8',
'GCI6GTVSQCD1Y73',
'GCIPX5R20ZHG31L',
'GCI7PNX9RVQUCM3',
'GCISL6EAP7N9F4D',
'GCI8YWB50TLNJAD',
'GCIRHFUXT207SO1',
'GCI2E7NIKWCDRS0',
'GCIE4RLAWUTNZQ5',
'GCI3KSFL4EHTMC9',
'GCIZV73S24K9Y0E',
'GCISOMUF9AYWPRX',
'GCIP1ARQB3DS2V6',
'GCI6PWGX94FB0MC',
'GCIWMELHGYF9BR4',
'GCI1GW68N9FEZHA',
'GCIXUA8PKHLB4G9',
'GCILQ7GCW0T6198',
'GCIKANTLP7EI5GB',
'GCIOC8F6YUR9DHX',
'GCILJ5KT6SC1NWZ',
'GCIWZYSR6U3XV0F',
'GCIH5YF69D1EB7P',
'GCI3ED6K7WTGXCZ',
'GCIW5Y638VTLCJF',
'GCIV31QM940AXR7',
'GCISL04K6ROEQAU',
'GCIVX0DF2TNEUAZ')