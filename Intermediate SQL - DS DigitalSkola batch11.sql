select ...
from ...
where ...
group by ...
having ...
order by ...
limit ...

select 
	order_id, 
	sales, 
	profit, 
	quantity, 
	category, 
	sub_category, 
	cost, 
	total_cost, 
	total_profit
from datasource.order_details_csv

select distinct category
from datasource.order_details_csv


select distinct substring(order_id from position ('AZ' in order_id) for 2)
from datasource.order_details_csv

lower(left('Furniture',1)||
substring('Furniture' from 2 for (char_length('Furniture')-1))
