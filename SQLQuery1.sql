 select * from pizza_sales;

 SELECT SUM(total_price) As Total_Revenue from pizza_sales;

 SELECT SUM(total_price) / COUNT(DISTINCT order_id) as Avg_Order_Value FROM pizza_sales;
 
 SELECT SUM(quantity) As Total_Pizza_sold from pizza_sales;

 SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_Per_Order FROM pizza_sales;
 --Day
SELECT DATENAME(DW, order_date) AS order_day,COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales
GROUP BY DATENAME(DW, order_date);
--Month
SELECT DATENAME(MONTH, order_date) AS order_day,COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date) Order by total_orders Desc  ;

Select pizza_category ,sum (total_price)*100 / (select sum (total_price) from pizza_sales) AS PCT
from pizza_sales Where MONTH(order_date)=1  GROUP BY pizza_category;

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_sales, CAST(SUM(total_price) * 100.0 / (SELECT SUM(total_price) 
FROM pizza_sales WHERE DATEPART(QUARTER, order_date) = 1) AS DECIMAL(10,2)) AS pct
FROM pizza_sales WHERE DATEPART(QUARTER, order_date) = 1 GROUP BY pizza_size ORDER BY pct DESC;

Select top 5 pizza_name ,sum(total_price) as Total_revenue from pizza_sales
GROUP BY pizza_name order by Total_revenue Desc;
Select top 5 pizza_name ,sum(total_price) as Total_revenue from pizza_sales
GROUP BY pizza_name order by Total_revenue asc;

Select top 5 pizza_name ,sum(quantity) as Total_quantity from pizza_sales
GROUP BY pizza_name order by Total_quantity desc;
Select top 5 pizza_name ,sum(quantity) as Total_quantity from pizza_sales
GROUP BY pizza_name order by Total_quantity asc;

Select top 5 pizza_name ,COUNT(DISTINCT(order_id)) as Total_Orders from pizza_sales
GROUP BY pizza_name order by Total_Orders asc;
Select top 5 pizza_name ,COUNT(DISTINCT(order_id)) as Total_Orders from pizza_sales
GROUP BY pizza_name order by Total_Orders DESC;



