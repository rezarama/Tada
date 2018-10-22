select o.recepient_name, o.recepient_email,o.recepient_phone_number, c.name
  from orders as o

  inner join clients as c
    on c.id = o.client_id

order by 4 asc