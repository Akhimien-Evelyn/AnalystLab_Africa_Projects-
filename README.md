# AnalystLab_Africa_Projects-
This repository contains projects completed during my AnalystLab Internship. Each project explores different aspect of data analysis, problem solving and applied research. The repository demonstrates skills in data collection, cleaning, visualization and reporting while showcasing practical applications of analytical methods.
# PROJECT 1 - WEEK 1
# ONLINE RETAIL DATASET
A complete data cleaning and exploratory data analysis (EDA) project on the Online Retail Dataset, completed as part of the AnalystLab Africa Data Analytics Internship Program — Batch B (June–August 2026).

This project demonstrates the full data analyst workflow: 

- dataset understanding → cleaning → SQL-based exploration → KPI calculation → dashboard visualization.
- The dataset contains transactional data from a UK-based online retailer specializing in unique, all-occasion gifts — many of whose customers are wholesalers.

## 📌 Project Overview
- Dataset - Online Retail Dataset (Kaggle)
- Period Covered - December 2010 – December 2011
- Raw Records - 541,909
- Clean Records - 524,878

### Tools - UsedSQL Server (SSMS), Microsoft Excel

## 🎯 Objectives
- Clean and validate a messy real-world transactional dataset
- Explore data patterns using SQL queries
- Calculate core business KPIs (Revenue, AOV, Cancellation Rate, etc.)
- Build a visual, interactive Excel dashboard
- Document every cleaning decision and its rationale

## 🔍 Exploratory Data Analysis — Key Findings

- 📈 Strong Q4 Seasonality — Revenue peaks sharply from September to November, hitting £1.5M in November 2011, driven by pre-Christmas wholesale demand.
- 🇬🇧 UK Market Dominance — The United Kingdom generates ~83% of total revenue (£9M of £10.6M). Netherlands, Ireland (EIRE), Germany, and France represent the next-largest international markets.
- 🎁 Top Products are Giftable Items — Best-selling products (Regency Cakestand, Party Bunting, White Heart T-Light Holder) align with the retailer's "all-occasion gifts" positioning.
- 🔁 High One-Time Buyer Rate — Roughly 58% of customers placed only 1–2 orders in the year, highlighting a retention opportunity through loyalty or re-engagement campaigns.

## 🛠️ Methodology

1. Dataset Understanding (SQL)

Loaded the dataset into SQL Server, profiled column data types, identified InvoiceNo + StockCode as the composite key (since InvoiceNo alone repeats across line items), and classified columns into numerical, categorical, and temporal features.

2. Data Cleaning (Excel)

Cleaned using Excel for the CSV/notebook deliverable, auditable cleaning log.

3. Exploratory Data Analysis (SQL)

Queried for:
- Summary statistics (mean, median, min, max, std dev) using AVG(), PERCENTILE_CONT(), STDEV()
- Top-selling products and most purchased products
- Highest revenue-generating countries
- Monthly sales trends
- Customer purchasing behavior and segmentation

4. Visualization (Excel)

Built an interactive dashboard with KPI cards and charts (line, bar, pie) sourced from dynamically calculated tables.
<img width="1827" height="675" alt="ONLINE RETAIL DASHBOARD" src="https://github.com/user-attachments/assets/e6de677f-e3d6-4b7a-b1f4-dc84e7c80345" />




# PROJECT 2 - WEEK 2
# NETFLIX TITLES
A complete data analytics project on the Netflix Titles dataset (8,807 titles, 1925–2021), covering data cleaning, exploratory data analysis, SQL querying, Power BI–style visualizations, and strategic recommendations.
## 📌 Project Overview
This project takes the raw Netflix Titles dataset from Kaggle and walks through a full analytics pipeline:

- Data understanding — profiling rows, columns, data types, and feature classes
- Data cleaning — handling nulls, fixing data entry errors, deriving new fields
- Exploratory Data Analysis (EDA) — uncovering patterns in content type, genre, geography, and ratings
- SQL analysis — loading the cleaned data into a relational table and querying it
- Visualization — building a Power BI–style interactive dashboard
- Insights & recommendations — translating findings into actionable strategy

## Project Overview
- Source - Netflix Movies and TV Shows — Kaggle
- Original size - 8,807 rows × 12 columns
- Cleaned size - 8,794 rows × 17 columns
- Time period - 1925 – 2021
- Granularity - One row per title (Movie or TV Show)

### 🛠️ Tools Used
Excel — data cleaning and transformation
SQL (SQL Server / T-SQL syntax) — relational analysis
Power BI (DAX measures, Power Query M) — dashboarding

## 📊 Key Insights
- Movies dominate the catalog — 69.6% (6,131 titles) vs. 30.4% TV Shows (2,676 titles)
- Explosive growth, then plateau — content additions grew 25× from 82 (2015) to 2,016 (2019), before slowing in 2020–2021
- US-India concentration — the United States (32%) and India (11%) supply 43% of all titles, despite 85+ countries represented
- Adult-skewed catalog — 56.4% of titles carry mature ratings (TV-MA, R, NC-17); only ~6% target young children
- TV Shows rarely renew — 67% of TV Shows last only one season
- Movie runtime is conventional — average 99.6 minutes, closely matching theatrical norms
- Dramas and Comedies lead genres — together accounting for ~32% of all titles

## 📈 Dashboard
An interactive Power BI–style dashboard was built covering:

- Type Distribution (Movie vs. TV Show)
- Title by audience segment
- Total Titles per released year (trend line)
- Top countries by title count
- Total Titles per month added (trend line)

<img width="1490" height="751" alt="NETFLIX TITLE DASHBOARD" src="https://github.com/user-attachments/assets/e1bc55a0-885b-4016-a5b5-3a2a65397107" />







# CREATED BY:
## Akhimien Evelyn
Data Analytics Intern — AnalystLab Africa Batch B

LinkedIn: https://tinyurl.com/mpe7h358
