create database pizzaSales;
use pizzasales;

select * from pizzasales.pizza_sales;

--- 01.Total Revenue: The sum of the total price of all pizza orders
select sum(total_price) "Total revenue" from pizza_sales;

--- 02.Average Order Value: The average amount spent per order, calculated by dividing the total revenue by the total number of orders. 
select (sum(total_price) / count(distinct order_id)) "Average order value" from pizza_sales;

--- 03.Total Pizzas Sold: The sum of the quantities of all pizza sold.
select sum(quantity) "Total Pizzas Sold" from pizza_sales;

--- 04.Total Orders: The total number of orders placed.
select count(distinct order_id) "Total Orders" from pizza_sales;

--- 05.Average Pizza Per Order: The average number of pizzas sold per order,calculated by dividing the total number of pizzas sold by the total number of orders
select (sum(quantity) / count(distinct order_id)) "Average Pizza Per Order" from pizza_sales;

--- 06.Daily trend for total Orders: the daily trend of total orders over a specific time period.
select date_format(str_to_date(order_date,"%d-%m-%Y"),"%a") as "Daily Trends" , count(distinct order_id) "Total Orders" 
from pizza_sales group by date_format(str_to_date(order_date,"%d-%m-%Y"),"%a") 
order by date_format(str_to_date(order_date,"%d-%m-%Y"),"%w");

--- 07.Hourly Trend for Total Orders: the hourly trend of total orders throughout that daystr
select date_format(str_to_date(order_time,"%T"),"%H") "Order Hours",count(distinct order_id) "Total Orders" 
from pizza_sales group by date_format(str_to_date(order_time,"%T"),"%H")
order by date_format(str_to_date(order_time,"%T"),"%H");

--- 08.Percentage of Sales by Pizza Category: the distribution of sales across different pizza categories.
select pizza_category, cast(sum(total_price) as decimal(10,2)) "Total Revenue",
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) "PCT"
from pizza_sales group by pizza_category;

--- 09.Percentage of Sales by Pizza Size
select pizza_size , cast(sum(total_price) as decimal(10,2)) "Total Revenue",
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) "PCT"
from pizza_sales group by pizza_size;

--- 10.Total Pizza Sold by Pizza Category
select pizza_category,sum(quantity) "Total Pizza" from pizza_sales group by pizza_category;

--- 11.Top 5 Best Sellers by Revenue, Total Quantity and Total Orders
select pizza_name , sum(quantity) as Total_Pizza_Sold,sum(total_price) "Total Revenue" , count(distinct order_id) "Total Orders"
from pizza_sales group by pizza_name order by Total_Pizza_Sold desc limit 5;

--- 12.Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders
select pizza_name, sum(quantity) as Total_Pizza_Sold , sum(total_price) "Total Revenue", count(distinct order_id) "Total Orders"
from pizza_sales group by pizza_name order by Total_Pizza_Sold asc limit 5;