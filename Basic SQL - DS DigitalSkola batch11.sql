
create table if not exists employee_digitalskola (
	employee_id int4 primary key,
	first_name varchar(11) not null,
	last_name varchar(11) not null,
	email varchar(8) not null,
	phone_number varchar(18) unique not null,
	hire_date varchar(10) not null,
	job_id varchar(10) not null,
	salary float4 unique not null,
	commission_pct float4 not null,
	manager_id int4 unique not null,
	department_id int4 unique not null
)	

insert into batch_11.employees_mfikrif
select * from employee_digitalskola;  

insert into batch_11.employees_mfikrif values (001, 'fikri', 'fadila', 'muh.fikrifadila@gmail.com',
'085784456664','2020-06-20','ENG', 6000, 'olahraga');

update batch_11.employees_mfikrif
set first_name = 'Belajar', last_name = 'SQL', email = 'ds11_sql', hire_date = 'today',  salary = 55123
where employee_id = 100;

select employee_id, first_name, last_name, salary from batch_11.employees_mfikrif;

alter table batch_11.employees_mfikrif add Hobby varchar(255);

update batch_11.employees_mfikrif 
set hobby = 'olahraga' where employee_id = 100;

update batch_11.employees_mfikrif 
set hobby = 'jalan-jalan' where employee_id = 101;

alter table batch_11.employees_mfikrif drop column department_id, drop column manager_id, drop column commission_pct;

delete * from batch_11.employees_mfikrif 
where employee_id <> 100, first_name <> fikri;

truncate table batch_11.employees_mfikrif;

drop table batch_11.employees_mfikrif;
