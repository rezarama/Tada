select o."orderNumber" ,em."egiftName",em.amount ,m.brand,  e.number as "Egift No"
--select o."orderNumber", count(o."orderNumber") as total, sum(em.amount)
  from "OrderEgifts" as oe

  inner join "Orders" as o
    on oe."OrderId" = o.id
  inner join "Egifts" as e
    on oe."EgiftId" = e.id
  inner join "EgiftMasters" as em
    on e."EgiftMasterId" = em.id
  left join "Merchants" as m
    on em."MerchantId" = m.id

  where o."orderNumber" in