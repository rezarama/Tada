select o."orderNumber",o."referralCode",max(m.brand)||' '||max(em."egiftName") "itemName"
from "Orders" o 
join "OrderEgifts" oe on o.id=oe."OrderId"
join "Egifts" e on oe."EgiftId"=e.id
join "EgiftMasters" em on e."EgiftMasterId"=em.id
join "Merchants" m on e."mId"=m."mId"
--where "referralCode" = '47316'--'txn1527787461'
where "orderNumber" in