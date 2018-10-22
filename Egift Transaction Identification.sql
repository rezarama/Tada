select oe."createdAt" + interval '7 hours' as "Day", o."orderNumber", g.phone, o."cardNo", em."egiftName", o.total,m.brand, o.status
  from "OrderEgifts" as oe

  inner join "Orders" as o
    on o.id = oe."OrderId"
  inner join "Egifts" as e
    on e.id = oe."EgiftId"
  inner join "EgiftMasters" as em
    on em.id = e."EgiftMasterId"
  inner join "Merchants" as m
    on em."MerchantId" = m.id
  left join "GCIUsers" as g
    on g.id = o."requesterId"

  where [[ (oe."createdAt" + interval '7 hours'):: date >= {{date_start}}]]
  and [[ (oe."createdAt" + interval '7 hours'):: date <= {{date_end}}]]

  order by 1 desc