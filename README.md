**Customer Churn Analysis: SQL & Power BI**
Overview

This project demonstrates an end-to-end Business Intelligence workflow analyzing bank customer churn. The objective of this project was to analyze bank customer churn to identify high-risk segments, uncover key drivers of churn, and support data-driven retention strategies.

Files

bank_churn_messy.xlsx – original messy dataset, split across two sheets

customers.xlsx – cleaned and merged dataset using Power Query, with duplicates removed

bank_churn_analysis_script.sql – SQL script for manipulating the data in the customer table, transforming data, and generating derived fields (ChurnCategory, CustomerSegment)

churn_dashboard.pbix – interactive Power BI dashboard

dashboard.png – screenshot of the dashboard

**Workflow**


1️⃣ Data Preparation (Excel)

Imported raw Excel sheets (bank_churn_messy.xlsx)

Combined multiple sheets using Power Query

Cleaned and standardized columns

Removed duplicates and ensured consistency

Saved as customers.xlsx for SQL ingestion

2️⃣ SQL Transformation & Feature Engineering

Created a SQL Server table from customers.xlsx

Converted data types (Age, Balance, CreditScore, etc.)

Engineered key fields:

ChurnCategory – classifies churn risk

CustomerSegment – groups customers by engagement and product usage

Calculated country-level aggregates and ranked customers by balance

3️⃣ Power BI Dashboard

Loaded SQL table into Power BI

Built interactive visuals with slicers for Geography, Gender, and Customer Segment

Key metrics: Total Customers, Total Balance, Average Age, Average Credit Score

Visualizations: Customers by Segment, Churn Risk Distribution, Age Distribution

Used DAX to uncover additional insights

Key Insights

Churn is concentrated in Germany and France, especially among low-engagement or single-product customers

Mid-range risk scores represent the largest proportion of at-risk customers

Customers aged 30–45 form the largest and most churn-prone demographic

Retention strategies should focus on high-risk segments, emphasizing engagement and product adoption

Tools & Technologies

Microsoft Excel – data exploration, cleaning, and Power Query for data prep

SQL Server – table creation, transformations, and feature engineering

Power BI – interactive dashboard creation, data modeling, and DAX measures
