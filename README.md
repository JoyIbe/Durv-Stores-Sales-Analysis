# Durv Stores Sales Analysis Project Using Power BI built-in tools.

## Table of Contents
- [Overview](#overview)
- [Problem Statement](#problem-statement)
- [Tool and Methodology](#tools-and-methodology)
- [Analysis Findings](#analysis-findings)
- [Key Insights and Recommendations](#key-insights-and-recommendations)
- [Limitation](#limitation)
- [Link to Viz](#link-to-viz)
- [Conclusion ](#conclusion)

## Overview

The analysis provides insights into Durv stores business health from Jan 2023-Aug 2024. Identifying trends to help drive strategic decision-making for business growth.

## Problem Statement:
This company operates in diverse regions, selling various products through multiple channels. Therefore, understanding sales performance, customer behaviours, and product performance is critical for optimizing operations and enhancing profitability.

## Tools and Methodology:

### Tools: 
Power Query: Used power query to clean and restructure data for modelling to optimize performance speed.

Dax: Employed Dax functionalities to create a new table and calculate specific measures for key metrics and custom visuals.

Power BI: To build the interactive dashboard.

### Method:
Data Cleaning: This process of data cleaning carried out in this project includes handling missing values, inconsistencies, incorrect spellings and  standardization.

![Uncleaned dataset](https://github.com/user-attachments/assets/c1d995a0-201d-4919-bbdf-cf1699d16277)

![Cleaned dataset](https://github.com/user-attachments/assets/466008b9-e534-4cad-ac53-31e2bac09bd0)



Data Processing: With Power Bi's Dax functionalities, I created calculated measures to show valuable metrics and customized visuals to aid clarity in understanding trends.

Data Modelling: Modelling this data allows for multiple tables with lesser column information to speed up processing time, reduce redundancy and increase efficiency.

Data Visualization: Built a two pages interactive dashboards to properly communicate findings that will lead to a significant increase in business growth for the new year.


## Analysis Findings:

### Sales Performance Report

![Durv Sales Performance View](https://github.com/user-attachments/assets/5956f443-6da8-4787-8a28-f430ce36db8c)

- Key Metrics Summary
  
Metric|2023|2024|YoY % Change
|---|---|---|---|
Total Sales| $78.264K| $49.780K|	▼ -46.73%
Total Revenue| $240.376K|	$140.052K|	▲ +58.26%
Total COGS|	$55.702K|	$34.314K|	▼ -62.55%
Gross Profit|	$184.674K|	$105.738K|	▲ +20.82%

While total sales have decreased by 46.73%, total revenue and gross profit have increased, indicating better pricing, cost efficiency, or higher-margin products being sold.
COGS has significantly reduced (-62.55%), contributing to improved profit margins.


- Sales Performance Trends for recent year:
  
Daily Sales: Sales exhibit fluctuations with a sharp decline during specific weekdays.

Monthly Sales: Strong performance in March and June with slight dips in February and August. Monthly sales consistently fail to meet the target monthly sales.

Monthly Revenue: Following similar trend, revenue peaks in March and July but underperform in February and August.

- Revenue and Sales by Customer Segments: Retail generates the highest revenue at $130K, followed by Wholesale. Subscriptions are the weakest-performing segment.

- Sales and Revenue by Sales Channel: Marketplace and Online Direct are top-performing sales channels. Wholesale lags in both sales and revenue.

- Revenue by Region: Latin America is the top-performing region for revenue generation. Followed by Middle East & Africa, then Europe.
  
``
Note: In the revenue by region chart visual, purple markers refer to the total revenue, while the grey refer to the total revenue for the current year.
This is so that we can gain deeper dive into revenue growth. Contrasting current year revenue to total showed that even though North America leads Asia Pacific in the total revenue generated, in the current year (2024), Asia Pacific has generated more revenue than North America.
While Latin America, Middle East & Africa and Europe still maintained same position. ``

- Product Performance:
Top Performing Categories:
Electronics > Fashion > Sports & Outdoors > Home Appliance > Health & Beauty drive the highest revenue, gross margin, and consistent sales performance.
Books & Media and Wearables also exhibit strong performance.
Weak Categories:
Categories like Groceries and Fitness Equipment have lower revenue and sales performance.


### Product Performance and Customer Behaviour Report

![Durv Product and Customer Behaviour Performance View](https://github.com/user-attachments/assets/786cc8b4-3fb8-47d7-904f-cb8a951c99e4)

- Key Metrics Summary
Total Customers: 213, Total Sales Rep: 20, Total Quantity Sold: 4116, Total Products: 247,209. 


#### Product Performance Analysis:

- Return Status: High return and pending return rates indicate potential product quality issues or mismatched customer expectations.

- Inventory Status: Low stock and out-of-stock levels are high (877 combined), indicating inventory management challenges that may affect customer satisfaction and sales.

- Top Product Trends: Sweater Dress dominates sales, but low volumes for products like the Gaming Laptop suggest areas for improvement.

#### Customer Behaviour Analysis:

- Total Customers per Segment: Retail has the largest customer base, while Subscriptions have the smallest customer base.

- Discounts per Customer Segment: The Retail segment receives the highest discount rates, while Subscriptions have minimal discounts, which may affect growth in this area.

- COGS vs Sales by Customers: As COGS increases, sales also tend to increase. The trend suggests that customers purchasing higher-cost products are also driving higher sales volumes.

- Total Customers per Sales Channel: Marketplace, Online Direct, and Retail are the top channel for acquiring customers, with Wholesale lagging slightly.

#### Sales Rep Performance: 

- Customer Assessment: The overall assessment shows that more customers satisfaction is being prioritized by many sales representative. However, numbers show a low negative feedback that should be rectified by superiors.

---

### Key Insights and Recommendations: 

1. Despite a sales drop, Revenue and Gross Profit are increasing due to cost control (COGS reduction) and higher-margin product categories.

2. Focus on Latin America as the top revenue generator. Explore opportunities in underperforming regions like Middle East & Africa.

3. Prioritize products like Electronics, Fashion, etc and increase stock and marketing focus on top-performing categories for business growth. Then, improve performance in low-selling categories like Fitness equipment.

4. Strengthen Marketplace and Online Direct channels as they drive high revenue. Then focus on improving retail and wholesale performance with better pricing strategies for high revenue opportunities.

5. Regional Expansion: Focus marketing efforts on Latin America and Europe, while identifying growth strategies for underperforming regions.

6. Investigate root causes of sales drop and improve weekday sales strategies.

7. Improve Product Quality and Return Processes: Investigate the reasons behind high product returns. Implement better quality control and customer feedback mechanisms.

8. Streamline the return process to ensure pending returns are resolved quickly.

9. Optimize Inventory Management: Address low stock and out-of-stock issues by implementing a smarter inventory management system to improve product availability.

10. Prioritize stocking high-demand products like Sweater Dress and Digital Cameras. Then focus on marketing and promoting underperforming products like the Gaming Laptop and Ski Boots to drive higher demand.

11. Offer better incentives or exclusive discounts to attract more subscribing customers.

12. Address the high number of negative customer assessments by providing targeted training to sales reps. Use feedback to improve customer service and resolve issues effectively.

13. Annual bonus incentives for top performing sales reps. 

14. Promote products that have a higher COGS but yield substantial revenue (e.g., premium electronics or fitness equipment).
Generally, analyze ways to reduce the COGS for products with strong sales performance to improve overall profit margins.
Negotiate better supplier terms or consider alternative suppliers for high-cost products.

### Limitation:

1. About 10% of missing date values.
2. Incomplete 2024 data, Only Jan-Aug was provided.

### Link to Viz:
[Power BI](https://app.powerbi.com/reportEmbed?reportId=c86dd125-9bca-4b77-b21f-41f1baea46b1&autoAuth=true&ctid=0801c8b7-f6a9-44a2-8891-282fd58fab33)

### Conclusion:
Durv Stores has achieved strong revenue and profit growth despite a sales decline, thanks to cost efficiencies and high-margin products. They've also shown strong growth in total customers and products performace but challenges remain in product returns, inventory management, and customer satisfaction. By addressing these areas and focusing on high-performing regions, optimize product offerings, improving channel performance, the subscription model, inventory optimization, and sales rep performance, Durv Stores can achieve more consistent growth and higher customer satisfaction.

### Code: Using PostgreSQL, I solved 16 business problems.See (Query)[]
```sql
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
```
