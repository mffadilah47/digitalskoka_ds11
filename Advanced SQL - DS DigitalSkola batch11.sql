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
where created_at between '2018-10-01 00:00:00' and '2018-12-31 23:59:59'
group by product_id
having sum(quantity) > avg(quantity) 
order by total_transactions desc
limit 5;

select s.type 
from datasource_sql_ds11.store as s
inner join (
	select quantity, sum(quantity) as total_transactions 
	from datasource_sql_ds11.transaction as t
		inner join (
			select city
			from datasource_sql_ds11.customer 
			where city = 'Jakarta'
			) as c
		on t.customer_id = c.id
	group by quantity
	limit 1)
