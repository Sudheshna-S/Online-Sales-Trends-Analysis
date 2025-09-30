Create database Sales_Trends;

use Sales_Trends;

show tables;

rename table `online sales data` to orders;

select * from orders;

-- Use EXTRACT(YEAR FROM Date) and EXTRACT(MONTH FROM Date) to get year and month. 
-- For total revenue use SUM(Total Revenue), for orders use COUNT(DISTINCT Transaction ID)

SELECT EXTRACT(YEAR FROM Date) AS year,
	EXTRACT(MONTH FROM Date) AS month,
    SUM(`Total Revenue`) AS monthly_revenue,
    COUNT(DISTINCT `Transaction ID`) AS order_volume
FROM  orders
GROUP BY 
    EXTRACT(YEAR FROM Date),
    EXTRACT(MONTH FROM Date)
ORDER BY  year, month;

-- Top-Performing Months

SELECT 	EXTRACT(MONTH FROM Date) AS month,
		`Total Revenue` AS monthly_revenue
FROM orders
ORDER BY monthly_revenue DESC LIMIT 5;

-- Average Revenue and Units Sold Per Order

SELECT 
    AVG(`Total Revenue`) AS avg_order_revenue,
    AVG(`Units Sold`) AS avg_units_per_order
FROM 
    orders;
 
 -- Maximum and Minimum Order Value Per Month

SELECT
    EXTRACT(YEAR FROM Date) AS year,
    EXTRACT(MONTH FROM Date) AS month,
    MAX(`Total Revenue`) AS max_order_value,
    MIN(`Total Revenue`) AS min_order_value
FROM 
    orders
GROUP BY 
    year, month
ORDER BY 
    year, month;
    
-- Best Selling Category by Month

SELECT
    EXTRACT(YEAR FROM Date) AS year,
    EXTRACT(MONTH FROM Date) AS month,
    `Product Category`,
    SUM(`Units Sold`) AS total_units_sold
FROM 
    orders
GROUP BY 
    year, month, `Product Category`
ORDER BY 
    year, month, total_units_sold DESC;
    
-- Orders and Revenue by Region

SELECT
    Region,
    COUNT(DISTINCT `Transaction ID`) AS orders,
    SUM(`Total Revenue`) AS total_revenue
FROM
    orders
GROUP BY 
    Region
ORDER BY 
    total_revenue DESC;
    
-- Distinct Products Sold Each Month

SELECT
    EXTRACT(YEAR FROM Date) AS year,
    EXTRACT(MONTH FROM Date) AS month,
    COUNT(DISTINCT `Product Name`) AS unique_products_sold
FROM
    orders
GROUP BY
    year, month
ORDER BY
    year, month;




