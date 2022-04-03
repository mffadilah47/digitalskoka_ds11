select c.gender, c.city, c.email, count(c.id) as customer_more_than_10_transactions
from datasource_sql_ds11.customer c
inner join 
	(
	select customer_id, count(customer_id)
	from datasource_sql_ds11.transaction 
	group by customer_id 
	having count(customer_id) >= 10
	) as t
on c.id = t.customer_id 
where gender = 'Female' and city = 'Jakarta' and email = 'Gmail'
group by c.gender, c.city, c.email;

select product_id, sum(quantity) as total_transactions
from datasource_sql_ds11.transaction
where created_at between '2018-10-01 00:00:00' and '2018-12-31 23:59:59' and store_id = '2'
group by product_id
having sum(quantity) > avg(quantity) 
order by total_transactions desc
limit 5;

select 
case
	when city = 'Jakarta' then 'Jakarta'
	else 'Luar Jakarta'
end as region, 
case
	when gender = 'Male' then 'Male'
	else 'Female'
end as gender,
t.type,
sum(t.quantity) as total_transaction
from datasource_sql_ds11.customer  
join 
	(
	select s.type, customer_id, sum(quantity) as quantity
	from datasource_sql_ds11.transaction  
	join 
		(
		select id, type
		from datasource_sql_ds11.store  
		) as s
	on store_id = s.id
	group by s.type, customer_id
	) as t
on id = t.customer_id
group by t.type, gender, region
order by sum(t.quantity) desc
limit 4;