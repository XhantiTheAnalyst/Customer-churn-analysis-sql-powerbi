Customer Churn Analysis – SQL & Power BI
📌 Project Overview

This project demonstrates an end-to-end Business Intelligence workflow analyzing bank customer churn.
The objective was to identify high-risk customer segments, uncover key churn drivers, and support data-driven retention strategies using SQL-based feature engineering and an interactive Power BI dashboard.

🎯 Objective

Analyze customer churn behavior across demographics and geographies

Identify high-risk churn segments

Transform raw data into actionable insights for business decision-making

📂 Project Files

bank_churn_messy.xlsx – Original raw dataset split across multiple sheets

customers.xlsx – Cleaned and merged dataset using Power Query (duplicates removed)

bank_churn_analysis_script.sql – SQL script for data transformation and feature engineering

churn_dashboard.pbix – Interactive Power BI dashboard

dashboard.png – Dashboard screenshot

🔄 Workflow
1️⃣ Data Preparation (Excel & Power Query)

Imported raw Excel sheets containing customer churn data

Combined multiple sheets using Power Query

Standardized column formats and corrected inconsistencies

Removed duplicates and validated data quality

Exported a clean dataset (customers.xlsx) for SQL ingestion

2️⃣ SQL Transformation & Feature Engineering

Created a SQL Server table from the cleaned Excel dataset

Converted data types (Age, Balance, CreditScore, etc.)

Engineered derived fields using SQL logic:

ChurnCategory – classifies customers by churn risk

CustomerSegment – groups customers by engagement and product usage

Generated country-level aggregates

Ranked customers based on balance to support segmentation analysis

3️⃣ Power BI Dashboard & Analysis

Loaded transformed SQL data into Power BI

Built an interactive dashboard with slicers for:

Geography

Gender

Customer Segment

Created key KPIs:

Total Customers

Total Balance

Average Age

Average Credit Score

Visualizations include:

Customers by Segment

Churn Risk Distribution

Age Distribution

Used DAX measures to calculate churn-related metrics and enhance analytical insights

📊 Key Insights

Churn is concentrated in Germany and France, particularly among low-engagement or single-product customers

Mid-range churn risk customers represent the largest proportion of at-risk users

Customers aged 30–45 form the largest and most churn-prone demographic

Retention strategies should prioritize engagement improvement and product adoption within high-risk segments

💼 Business Value

Enables stakeholders to quickly identify churn-prone customer groups

Supports targeted retention campaigns by geography and customer profile

Provides an interactive, self-service dashboard for ongoing churn monitoring

🧠 Skills Demonstrated

Data cleaning & preparation

Power Query transformations

SQL-based feature engineering

Customer segmentation analysis

Aggregations and ranking logic

Dashboard design and data storytelling

Translating analysis into business insights

🛠 Tools & Technologies

Microsoft Excel – Data exploration, cleaning, and Power Query

SQL Server – Data transformation, feature engineering, and analysis

Power BI – Data modeling, DAX measures, and interactive dashboards
