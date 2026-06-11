# Research Report

## Title

**Albania’s Brain Drain: A Data-Driven Analysis of Migration, Employment and Economic Development**

## Abstract

This project studies Albania’s brain drain using public datasets from the World Bank, Eurostat, population estimates, and official migration-related reports. The analysis focuses on population decline, net migration, European migration-flow indicators, first residence permits, unemployment, GDP growth, and demographic structure.

The project applies a low-level academic and portfolio-style data analytics workflow. Data was cleaned using Python and Pandas, structured into processed datasets, loaded into a PostgreSQL database, analyzed through exploratory and statistical methods, forecasted to 2035, and presented in a Power BI dashboard.

The findings suggest that Albania’s brain drain is connected to demographic decline, negative net migration, labour-market pressure, education and employment migration channels, and long-term changes in the working-age and elderly population.

## 1. Introduction

Brain drain refers to the movement of educated, skilled, or economically active people away from their home country. For Albania, this issue is important because migration can affect the labour force, education system, innovation capacity, tax base, public services, and long-term development.

This project studies Albania’s brain drain from a data analytics perspective. Instead of relying only on general opinion, it uses public datasets to examine population trends, migration indicators, residence permits, economic indicators, and demographic risk.

## 2. Problem Statement

Albania has experienced long-term demographic and migration challenges. Population decline, negative migration, and the movement of young and working-age people abroad can create pressure on the economy and society.

The main problem investigated in this project is whether economic and demographic indicators are connected to migration and brain drain from Albania.

## 3. Research Question

**What economic and demographic factors are connected to migration and brain drain from Albania?**

## 4. Research Objectives

The objectives of the project are:

1. Analyze Albania’s population trend since 2000.
2. Examine net migration and migration pressure.
3. Identify major European destination countries for Albanian citizens.
4. Analyze first residence permits by reason.
5. Study the connection between unemployment, GDP growth, and migration indicators.
6. Examine Albania’s youth, working-age, and elderly population structure.
7. Create simple forecasts to 2035.
8. Present the results in a Power BI dashboard.

## 5. Data Sources

The project uses the following data sources:

- World Bank Albania indicator dataset
- World Bank Population Estimates
- Eurostat migration-flow datasets
- Eurostat first residence permit datasets
- INSTAT and official population reports
- World Bank Albania migration survey/report context

The World Bank data was mainly used for population, GDP, unemployment, net migration, remittances, and FDI indicators. Eurostat data was used to study Albanian citizens arriving in European reporting countries and first residence permits issued to Albanian citizens.

## 6. Methodology

The project followed these steps:

1. Raw data collection
2. Dataset understanding
3. Data cleaning and transformation
4. Feature engineering
5. PostgreSQL database design
6. Exploratory data analysis
7. Statistical correlation analysis
8. Forecasting to 2035
9. Power BI dashboard development
10. Final reporting

Python and Pandas were used for cleaning and transformation. PostgreSQL was used to create a database with dimension and fact tables. Power BI was used to build the final dashboard.

## 7. Data Cleaning and Preparation

The World Bank data was transformed from wide format into long format and then reshaped into analysis-ready tables. Eurostat data was cleaned by filtering relevant rows and separating total categories from subcategories to reduce double counting risk.

A master analysis dataset was created by merging indicators by year. Additional features were created, including:

- Net migration rate per 1,000 population
- Residence permits per 100,000 population
- Employment permit share
- Education permit share
- Family permit share
- Migration pressure index
- Working-age and elderly population indicators

## 8. Database Design

The project includes a PostgreSQL database with dimension and fact tables.

Dimension tables include:

- date_dimension
- country_dimension
- indicator_dimension
- age_dimension
- migration_reason_dimension

Fact tables include:

- fact_population
- fact_economy
- fact_unemployment
- fact_net_migration
- fact_migration_flows
- fact_residence_permits

This structure supports analytical queries and shows how the cleaned data can be organized in a business-intelligence-ready format.

## 9. Exploratory Data Analysis

### Population

Albania’s population in 2000 was approximately **3,089,027**. The latest available population value is **2,377,128** in **2024**.

The population change from 2000 to the latest available year is approximately **-711,899**, or **-23.05%**.

This confirms that population decline is a major issue in the Albanian demographic context.

### Migration

The latest available net migration value is **-24,230** in **2025**.

The strongest negative net migration year in the dataset is **2000**, with a value of **-60,531**.

Negative net migration is a sign of migration pressure and population loss.

### Destination Countries

The processed Eurostat migration data identifies **Germany** as the top recorded destination country in the available dataset, with **16,828,903** recorded immigration observations.

This should be interpreted as Albanian citizens recorded as arriving in European reporting countries, not as a complete direct count of emigration from Albania.

### Residence Permits

Residence permit data helps explain migration channels. It separates migration into reasons such as employment, education, family, and other categories.

Latest available total first residence permits in the master dataset: **74,903** in **2025**.

Latest residence permit reason breakdown:

|   year | reason_code   | reason             |   total_permits |   total_reason_subcategory_permits |   reason_share |
|-------:|:--------------|:-------------------|----------------:|-----------------------------------:|---------------:|
|   2025 | FAM           | Family reasons     |           35478 |                              54164 |       0.655011 |
|   2025 | EDUC          | Education reasons  |           11102 |                              54164 |       0.20497  |
|   2025 | EMP           | Employment reasons |            7584 |                              54164 |       0.140019 |

## 10. Economy and Employment

The latest available unemployment rate is **10.93%** in **2025**.

The latest available GDP growth rate is **4.05%** in **2024**.

The latest available GDP per capita is **11,378 USD** in **2024**.

These indicators are relevant because weak employment opportunities, income gaps, and limited career growth can encourage migration. However, economic indicators alone do not fully explain brain drain.

## 11. Statistical Analysis

The project tested relationships between migration indicators and economic indicators using Pearson and Spearman correlation.

Correlation results:

| x_variable                            | y_variable                    |   n_observations |   pearson_r |   pearson_p_value |   spearman_rho |   spearman_p_value | significance_5_percent   |
|:--------------------------------------|:------------------------------|-----------------:|------------:|------------------:|---------------:|-------------------:|:-------------------------|
| unemployment_total_percent            | net_migration                 |               26 |     -0.4857 |            0.0119 |        -0.3563 |             0.074  | Significant              |
| gdp_growth_annual_percent             | net_migration                 |               25 |     -0.5791 |            0.0024 |        -0.5377 |             0.0056 | Significant              |
| gdp_per_capita_current_usd            | net_migration                 |               25 |      0.5753 |            0.0026 |         0.5646 |             0.0033 | Significant              |
| remittances_percent_gdp               | net_migration                 |               25 |     -0.8403 |            0      |        -0.6362 |             0.0006 | Significant              |
| population_growth_annual_percent      | net_migration                 |               25 |     -0.7849 |            0      |        -0.6223 |             0.0009 | Significant              |
| unemployment_total_percent            | total_first_residence_permits |               18 |     -0.0918 |            0.7172 |        -0.4097 |             0.0913 | Not significant          |
| gdp_growth_annual_percent             | total_first_residence_permits |               17 |      0.5614 |            0.019  |         0.7426 |             0.0006 | Significant              |
| unemployment_total_percent            | migration_pressure_index      |               25 |     -0.7729 |            0      |        -0.7732 |             0      | Significant              |
| gdp_growth_annual_percent             | migration_pressure_index      |               25 |     -0.3601 |            0.0771 |        -0.2738 |             0.1853 | Not significant          |
| residence_permits_per_100k_population | migration_pressure_index      |               17 |      1      |            0      |         1      |             0      | Significant              |

The statistical results should be interpreted carefully. Correlation does not prove causation. A statistically significant relationship only shows that two variables move together in the available data, not that one directly causes the other.

## 12. Demographic Structure

The latest available working-age population is **1,549,119** in **2025**.

The latest available elderly share is **17.62%** in **2025**.

The latest available dependency ratio is **52.04** in **2025**.

This part of the analysis is important because brain drain can reduce the labour force while the elderly population grows. This can affect pensions, healthcare, tax revenue, public services, and long-term productivity.

## 13. Forecasting

The project created simple forecasts to 2035 using trend-based models such as Linear Regression, Moving Average baseline, and ARIMA.

2035 forecast summary:

| indicator_label         | model                   |   year |   forecast_value |
|:------------------------|:------------------------|-------:|-----------------:|
| Population              | ARIMA(1,1,1)            |   2035 |      2.19752e+06 |
| Net Migration           | ARIMA(1,1,1)            |   2035 | -24271.5         |
| First Residence Permits | Moving Average Baseline |   2035 |      2.21982e+06 |

Forecasts should be interpreted as scenarios, not exact predictions. Migration and population trends can change due to policy decisions, economic shocks, education opportunities, labour-market conditions, and destination-country rules.

## 14. Power BI Dashboard Summary

The Power BI dashboard contains five pages:

1. Executive Summary
2. Migration Analysis
3. Economy and Employment
4. Demographic Risk
5. Forecasting

The dashboard visualizes the main population, migration, economy, employment, residence permit, demographic, and forecasting results.

## 15. Key Findings

The main findings are:

1. Albania has experienced population decline since 2000.
2. Net migration shows migration pressure in the available data.
3. European destination countries are important in Albanian migration patterns.
4. Residence permit data shows that migration is connected to employment, education, and family reasons.
5. Economic indicators such as unemployment and GDP growth help explain part of the migration context.
6. The working-age and elderly population structure creates long-term demographic risk.
7. Forecasts suggest that demographic and migration pressure may continue if historical trends continue.

## 16. Policy Recommendations

Based on the analysis, possible policy recommendations include:

1. Improve youth employment opportunities.
2. Increase wages and career development pathways.
3. Strengthen higher education and professional training.
4. Support return migration and diaspora engagement.
5. Create incentives for skilled workers to remain in Albania.
6. Improve regional development outside Tirana.
7. Use migration and labour-market data for evidence-based policymaking.

## 17. Limitations

This project has several limitations:

- Eurostat immigration data records Albanian citizens arriving in European reporting countries. It is used as a proxy for mobility, not a direct measure of all emigration from Albania.
- Residence permit TOTAL categories and subcategories must be handled separately to avoid double counting.
- Some indicators have missing values.
- Correlation analysis does not prove causation.
- Forecasts are trend-based and should not be interpreted as exact future outcomes.
- The project is a low-level academic and portfolio-style analysis, not a published scientific study.

## 18. Conclusion

This project shows that Albania’s brain drain is connected to a combination of demographic, economic, and migration-related factors. Population decline, negative net migration, residence permit demand, unemployment, GDP trends, and changing age structure all contribute to the broader issue.

The project demonstrates the full data analytics lifecycle, from raw public data to cleaning, database design, analysis, forecasting, dashboard development, and final reporting.

## 19. References

- World Bank Open Data
- World Bank Population Estimates
- Eurostat migration flow datasets
- Eurostat residence permit datasets
- INSTAT population and census reports
- World Bank Albania migration survey/report

## 20. Appendix

Project outputs include:

- Cleaned CSV files
- PostgreSQL schema and SQL queries
- Jupyter notebooks
- Exploratory charts
- Statistical analysis results
- Forecasting results
- Power BI dashboard
- README and LinkedIn materials
