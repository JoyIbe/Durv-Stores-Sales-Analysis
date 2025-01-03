DROP TABLE IF EXISTS durv_stores;
CREATE TABLE durv_stores(
SalesID int,
Product_Name varchar(30),	
Product_Category varchar(30),
Sales_Date date,	
Sales_Amount_$	int,
Quantity_Sold int,	
Region	varchar(30),
Customer_ID varchar(20),	
Customer_Segment	varchar(30),
SalesRep_ID varchar(20),	
Discount_Applied float,
Cost_Of_Goods_Sold_$ int,
Sales_Channel varchar(30),	
Inventory_Status varchar(30),	
Return_Status varchar(30),	
Customer_Feedback varchar(30),	
Customer_assessment_of_Sales_Rep varchar(20)
);

SELECT * FROM durv_stores;

-- Primary KPIs:
Total Sales: SELECT SUM(sales_amount_$) FROM durv_stores;

Total Revenue: ALTER TABLE durv_stores ADD COLUMN revenue int;
			   UPDATE durv_stores
			   SET revenue = sales_amount_$ * quantity_sold;
			   SELECT SUM(revenue) FROM durv_stores;

Total COGS:   SELECT SUM(cost_of_goods_sold_$) FROM durv_stores;

Groos Profit: ALTER TABLE durv_stores ADD COLUMN gross_profit int;
			  UPDATE durv_stores
			  SET gross_profit = revenue - cost_of_goods_sold_$;
			  SELECT SUM(gross_profit) FROM durv_stores;

--1. Which products have the highest total sales amount?
	SELECT product_name, SUM(Sales_amount_$) AS sales 
	FROM durv_stores
	GROUP BY 1
	ORDER BY 2 DESC
	LIMIT 1;


--2. What are the top-selling product categories in each region?
	SELECT product_category, region, SUM(sales_amount_$) AS sales,
	RANK () OVER(PARTITION BY region ORDER BY SUM(sales_amount_$) DESC) AS rank
	FROM durv_stores
	GROUP BY 1, 2;

--3. How does applying discounts affect sales amounts and quantities sold? 
	SELECT
	    CASE 
	        WHEN discount_applied = 0 THEN 'No Discount'
	        WHEN discount_applied <= 0.1 THEN '0-10% Discount'
	        WHEN discount_applied <= 0.2 THEN '10-20% Discount'
	        WHEN discount_applied <= 0.3 THEN '20-30% Discount'
	        ELSE '>30% Discount'
	    END AS discount_range,
	    COUNT(*) AS total_count,
	    SUM(quantity_sold) AS total_quantity,
	    SUM(sales_amount_$) AS total_sales,
	    ROUND(AVG(quantity_sold),3) AS avg_quantity_per_sale,
	    ROUND(AVG(revenue),3) AS avg_revenue_per_sale
	FROM durv_stores
	GROUP BY 1
	ORDER BY 1;


--4. Which customer segments contribute the most revenue? Are there segments with low activity that need targeted marketing?
	SELECT  customer_segment, SUM(revenue) 
	FROM durv_stores
	GROUP BY 1
	ORDER BY 2 DESC;
-- Output shows that retail, followed by wholesale generates the most revenue. While institutional customers > Middle income, shows very poor revenue performance and is desperate need for strategic marketing.

--5. How many repeat customers exist, and what percentage of total sales do they contribute?
	WITH CTE AS (
	SELECT customer_id, 
		COUNT(*) AS total_count, 
		sales_amount_$, 
		SUM(sales_amount_$) AS total_sales
	FROM durv_stores
	GROUP BY 1,3 
	) 
	SELECT customer_id, 
		total_count, 
		ROUND((sales_amount_$::numeric/total_sales) * 100, 0) AS percentage
		FROM CTE
	WHERE total_count > 1
	ORDER BY 2 DESC; 
-- Output shows 223 repeated customers with their various total sales percentage 

--6. What are the common patterns in customer feedback, and how do they vary across product categories or regions?
 SELECT * FROM durv_stores;
	SELECT customer_feedback, COUNT(*), product_category
	FROM durv_stores
	GROUP BY 1,3
	ORDER BY 2 DESC;
	
--7. Which products frequently have an "Out of Stock" inventory status?
	SELECT product_name, COUNT(inventory_status)
	FROM durv_stores
	WHERE inventory_status = 'Out of Stock'
	GROUP BY 1
	ORDER BY 2 DESC;

--8. Which product categories experience the highest return rates? Are there patterns linked to specific customer segments?
	SELECT product_category, 
		customer_segment,
	    COUNT(*) AS total_orders
	FROM durv_stores
	WHERE return_status = 'Returned'
	GROUP BY 1, 2
	ORDER BY 3 DESC;
	
--9. Which top 5 sales reps generate the most revenue, and how do their customer assessments compare
	SELECT salesrep_id, customer_assessment_of_sales_rep, SUM(revenue)
	FROM durv_stores
	GROUP BY 1,2
	ORDER BY 3 DESC
	LIMIT 5;

--10. Which regions generate the highest and lowest revenue? 
	SELECT region, SUM(revenue)  revenue
	FROM durv_stores
	GROUP BY 1
	ORDER BY 2 DESC;
--Output returned Latin America as highest and Asia Pacific as Lowest

--11. How do sales channels perform in terms of revenue, cost of goods sold, and customer satisfaction?
	SELECT sales_channel, 
		SUM(revenue) revenue, 
		SUM(cost_of_goods_sold_$) cogs
	FROM durv_stores
	GROUP BY 1
	ORDER BY 2 DESC;

--12. Which products or categories have the highest cost of goods sold (COGS) compared to revenue?
	SELECT product_category, 
		SUM(revenue) revenue, 
		SUM(cost_of_goods_sold_$) cogs
	FROM durv_stores
	GROUP BY 1
	ORDER BY 3 DESC;


	SELECT product_name, 
		SUM(revenue) revenue, 
		SUM(cost_of_goods_sold_$) cogs
	FROM durv_stores
	GROUP BY 1
	ORDER BY 3 ;
--Output shows none; revenue remains higher than cost of goods

--13. What are the primary reasons for product returns?
SELECT * FROM durv_stores

	SELECT
	   customer_feedback,
		COUNT(return_status) AS total_returns,
	    SUM(quantity_sold) AS total_quantity_returned
	FROM durv_stores
	WHERE return_status = 'Returned'
	GROUP BY 1;


--14. Which 10 customers have the highest return rates?
	SELECT
	   DISTINCT customer_id,
	   COUNT(return_status) AS total_returns,
	   SUM(quantity_sold) AS total_quantity_returned
	FROM durv_stores
	WHERE return_status = 'Returned'
	GROUP BY 1
	ORDER BY 2 DESC
	LIMIT 10;

--15. How have sales trends changed over time?
	SELECT 
	    DATE_TRUNC('year', sales_date) AS year, 
	    SUM(sales_amount_$) AS total_sales, 
	    COUNT(*) AS total_transactions
	FROM 
	    durv_stores
	GROUP BY 1
	ORDER BY 1;

--OR 

	SELECT 
	   EXTRACT('year' FROM sales_date) AS year, 
	   SUM(sales_amount_$) AS total_sales, 
	   COUNT(*) AS total_transactions
	FROM 
	    durv_stores
	GROUP BY 1
	ORDER BY 1;

	
--16. Which products are consistently underperforming across different regions?
	SELECT product_name, 
		sales_amount_$, 
		revenue, 
		region,
		SUM(sales_amount_$) OVER (PARTITION BY region) total_sales
	FROM durv_stores
	GROUP BY 1,2,3,4
	ORDER BY 3
	LIMIT 100;


