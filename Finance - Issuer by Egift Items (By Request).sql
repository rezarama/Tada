select e.number as "Egift No", o."orderNumber"
  from "OrderEgifts" as oe

  inner join "Orders" as o
    on o.id = oe."OrderId"
  inner join "Egifts" as e
    on e.id = oe."EgiftId"
  left join "Transactions" as t
    on o."TransactionId" = t.id


  where e.number in ('21950704', '74447012')