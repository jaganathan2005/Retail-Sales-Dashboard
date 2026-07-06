CREATE DATABASE superstore_db;
USE superstore_db;

-- 1. TOTAL REVENUE, PROFIT, ORDERS SUMMARY
SELECT 
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit,
COUNT(DISTINCT `Order ID`) AS Total_Orders,
ROUND(SUM(profit)/sum(sales)*100,2) AS Profit_Margin_Percent
FROM orders;

-- 2. Sales by Year (Trend Analysis)
select 
Year(`Order Date`) AS Year,
round(sum(Sales),2) AS Total_Sales,
round(sum(Profit),2) AS Total_Profit,
count(distinct `Order Date`) AS Total_Orders
From orders
group by Year(`Order Date`)
order by Year; 

-- 3. Sales by Region
select 
Region,
round(sum(Sales),2) AS Total_Sales,
round(sum(Profit),2) AS Total_Profit,
count(distinct `Order ID`) AS Total_Orders,
Round(sum(Profit)/sum(Sales)*100,2) AS Profit_Margin_Percent
From orders
Group by Region
Order by Total_Sales Desc;

--  4. Sales by Category
select 
Category,
round(sum(Sales),2) AS Total_Sales,
round(sum(Profit),2) AS Total_Profit,
count(distinct `Order ID`) AS Total_Orders,
Round(sum(Profit)/sum(Sales)*100,2) AS Profit_Margin_Percent
From orders
Group by Category
Order by Total_Sales Desc;

-- 5. Sub Category Analysis
SELECT 
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit)/SUM(Sales)*100, 2) AS Profit_Margin_Percent
FROM orders
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;

-- 6. Customer Segment Analysis
select 
Segment,
round(sum(Sales),2) as Total_Sales,
round(sum(Profit),2) as Total_Profit,
count(distinct `Order ID`) as Total_Orders,
round(sum(Profit)/sum(Sales)*100,2) as Profit_Margin_Percent,
round(sum(Sales)/count(distinct `Order ID`),2) as Avg_Order_Value
from orders
group by Segment
order by Total_Sales Desc;

-- 7. Top 10 States by Sales
select 
State,
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit,
COUNT(DISTINCT `Order ID`) AS Total_Orders,
ROUND(SUM(Profit)/sum(Sales)*100,2) AS Profit_Margin_Percent
FROM Orders 
GROUP BY State 
ORDER BY Total_Sales Desc
LIMIT 10;

-- 8. Discount Impact Analysis
select 
`Sub-Category`,
round(Avg(Discount)*100,2) AS Avg_Discount_Percent,
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit,
ROUND(SUM(Profit)/sum(Sales)*100,2) AS Profit_Margin_Percent
From orders 
Group by `Sub-Category`
order by Avg_Discount_Percent Desc;

--  9. Ship Mode Analysis
SELECT 
`Ship Mode`,
COUNT(DISTINCT `Order ID`) AS Total_Orders,
ROUND(AVG(`Days to Ship`),1) AS Avg_Days_to_Ship,
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit,
ROUND(SUM(Profit)/sum(Sales)*100,2) AS Profit_Margin_Percent
FROM orders
GROUP BY `Ship Mode`
ORDER BY Avg_Days_to_Ship;

-- 10. Loss Making Orders Analysis
select 
`Sub-Category`,
`Region`,
count(*) as Loss_Orders,
round(sum(Profit),2) AS Total_Loss,
round(avg(Discount)*100,2) AS Avg_Discount_Percent
From orders 
where Profit < 0
group by `Sub-Category`,`Region`
order by Total_Loss limit 10;

