SELECT * FROM pizza_runner.customer_orders;

DROP TABLE IF EXISTS customer_orders_temp ;

create TEMPORARY TABLE customer_orders_temp as
select order_id,customer_id,pizza_id ,order_time ,
case when exclusions is null then ""
	when exclusions like 'null' then "" 
	else exclusions
end as exclusions,
case when extras is null then "" 
	when extras like 'null' then "" 
	else extras
end as extras
from customer_orders ;

select * from customer_orders_temp
order by customer_id ;