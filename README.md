# Customer-churn-analysis-sql-powerbi
End-to-end Business Intelligence project using Excel, SQL Server, and Power BI.

**Customer Churn Analysis: SQL & Power BI**

**Overview**

This project demonstrates a complete end-to-end Business Intelligence workflow analyzing customer churn for a bank.

It includes messy raw data handling, SQL transformations, feature engineering, and interactive Power BI dashboards, designed to uncover actionable insights about customer behavior and churn risk.

The goal: identify high-risk segments, understand churn patterns, and support data-driven retention strategies.

Data Sources

Raw Data: Messy Excel spreadsheet containing customer demographics, account details, and behavior metrics.

Processed Data: SQL Server tables created from the cleaned data, aggregated for analytical purposes.

**The dataset used is anonymized and for portfolio purposes**.


**Project Workflow**

1️⃣ Data Preparation & Cleaning

Started with a messy Excel dataset:

Missing values, inconsistent types, and separate columns that needed combining.

Used Power Query to:

Standardize column formats (numbers, text, decimals)

Combine multiple columns where necessary

Prepare the dataset for SQL ingestion

2️⃣ SQL Transformation & Feature Engineering

Created a SQL Server database and loaded the cleaned data.

Applied data type conversions and transformations using SQL:
-----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------

    SELECT 
    CustomerId,
    
    Surname,
    
    CAST(CreditScore AS INT) AS CreditScore,
    
    Geography,
    
    Gender,
    
    CAST(Age AS INT) AS Age,
    
    CAST(Tenure AS INT) AS Tenure,
    
    CAST(EstimatedSalary AS DECIMAL(18,2)) AS EstimatedSalary,
    
    CAST(Balance AS DECIMAL(18,2)) AS Balance,
    
    CAST(NumOfProducts AS INT) AS NumOfProducts,
    
    HasCrCard,
    
    IsActiveMember,
    
    Exited,

    CASE 
        WHEN Exited = 'Yes' AND CAST(CreditScore AS INT) < 600 AND CAST(Balance AS DECIMAL(18,2)) < 5000 THEN 'High Risk Churner'
        WHEN Exited = 'Yes' AND CAST(CreditScore AS INT) < 650 THEN 'Medium Risk Churner'
        WHEN Exited = 'Yes' THEN 'Churner'
        ELSE 'Non-Churner'
    END AS ChurnCategory,

    CASE 
        WHEN CAST(NumOfProducts AS INT) > 1 AND IsActiveMember = 'Yes' THEN 'Valued Customer'
        WHEN CAST(NumOfProducts AS INT) = 1 AND IsActiveMember = 'Yes' THEN 'Active Single-Product'
        ELSE 'Low Engagement'
    END AS CustomerSegment,

    AVG(CAST(Age AS INT)) OVER(PARTITION BY Geography) AS AvgAgeByCountry,
    AVG(CAST(CreditScore AS INT)) OVER(PARTITION BY Geography) AS AvgCreditScoreByCountry,
    SUM(CAST(Balance AS DECIMAL(18,2))) OVER(PARTITION BY Geography) AS TotalBalanceByCountry,
    COUNT(CustomerId) OVER(PARTITION BY Geography) AS NumCustomersByCountry,

    RANK() OVER(PARTITION BY Geography ORDER BY CAST(Balance AS DECIMAL(18,2)) DESC) AS BalanceRankInCountry

    FROM customers

    ORDER BY Geography, BalanceRankInCountry;




-------------------------------------------------------------------------------------------------------------------------------------------

**Created derived fields for:**

**ChurnCategory – flags churn severity (High Risk, Medium Risk, Churner, Non-Churner)**

**CustomerSegment – groups based on engagement and product usage**

**Calculated country-level aggregates for age, balance, credit score, and customer counts**

3️⃣ Power BI Dashboard & Analysis

Loaded the processed SQL tables into Power BI

Used DAX to create measures and uncover additional insights:

KPIs: Total Customers, Total Churners, Average Age, Average Credit Score, Total Balance

Churn Risk Distribution

Customers by Segment & Geography

Age Group Distribution

Designed an interactive, executive-friendly dashboard with slicers for:

Geography

Gender

Customer Segment

Churn Risk Score

4️⃣ Key Insights

Churn is concentrated in Germany and France, particularly among low-engagement or single-product customers

Mid-range risk scores represent the largest proportion of at-risk customers

Customers aged 30–45 form the largest and most churn-prone demographic

Retention strategies should focus on high-risk segments, emphasizing engagement and product adoption

Tools & Technologies

Microsoft Excel – initial exploration and cleaning, Power Query for data prep

SQL Server – database creation, transformations, and feature engineering

Power BI – interactive dashboard, DAX measures, and visualization
