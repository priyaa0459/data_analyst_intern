show databases;
create database sales;
use sales;
drop table orders;
create table orders (order_id int, order_date date, order_amount double(10,2));
select * from orders;
select month(order_date) as order_month, year(order_date) as order_year from orders;
select month(order_date) as order_month, year(order_date) as order_year, sum(order_amount) as total_revenue, count(distinct order_id) as volume from orders where extract(year from order_date) = 2024 group by order_year, order_month order by order_year, order_month;
select month(order_date) as order_month, year(order_date) as order_year, sum(order_amount) as total_revenue, count(distinct order_id) as volume from orders group by order_year, order_month order by total_revenue desc limit 3;



