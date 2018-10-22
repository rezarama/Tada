select u.phone as "Phone Number", u.name as "Name", count(i.id) as "Amount of Cards and Egifts"
  from "GCIUsers" as u
left join "GCIUserGiftcards" as g
  on u.id = g."GCIUserId"
inner join "CardInventories" as i
  on i.id = g."relationId"

group by 1,2
order by 3 desc