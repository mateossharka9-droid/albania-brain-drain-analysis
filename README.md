# Albania Brain Drain Analysis

## Albania’s Brain Drain: A Data-Driven Analysis of Migration, Employment and Economic Development

This project is a complete data analytics portfolio project focused on Albania’s brain drain problem. It analyzes how migration, population decline, unemployment, GDP growth, residence permits, and demographic change are connected.

The project follows the full data analytics workflow:

**Raw public data → data cleaning → PostgreSQL database → exploratory analysis → statistical analysis → forecasting → Power BI dashboard → final reporting**

---

## Project Overview

Brain drain is an important issue for Albania because migration can affect the labour force, education system, public services, economic growth, and long-term demographic structure.

This project studies Albania’s brain drain using public datasets from the World Bank, Eurostat, population estimates, and official reports. The goal is not to publish a scientific paper, but to build a strong academic and portfolio-style data analytics project.

The analysis focuses on:

* Population decline
* Net migration
* Albanian citizens arriving in European reporting countries
* Residence permits by reason
* GDP growth
* GDP per capita
* Unemployment
* Remittances
* Foreign direct investment
* Youth population
* Working-age population
* Elderly population
* Forecasting to 2035

---

## Research Question

**What economic and demographic factors are connected to migration and brain drain from Albania?**

---

## Sub-Questions

1. Has Albania experienced population decline since 2000?
2. Which years show the strongest migration pressure?
3. Where are Albanian citizens migrating in Europe?
4. Is there a relationship between unemployment and migration?
5. Is there a relationship between GDP growth and migration?
6. Are Albanian migration patterns connected to employment, education, and family residence permits?
7. How is Albania’s age structure changing?
8. What could happen to Albania’s population by 2035 if current trends continue?
9. What are the economic and demographic consequences of brain drain?
10. What policy recommendations could reduce migration pressure?

---

## Tools and Technologies Used

* Python
* Pandas
* NumPy
* Matplotlib
* SciPy
* Statsmodels
* Scikit-learn
* PostgreSQL
* SQL
* Power BI
* Jupyter Notebook
* Markdown
* Git and GitHub

---

## Data Sources

The project uses public datasets and reports from:

* World Bank Albania indicators
* World Bank Population Estimates
* Eurostat migration flow data
* Eurostat first residence permit data
* INSTAT census and population reports
* World Bank Albania migration survey/report

---

## Important Data Interpretation Note

Eurostat migration flow data is used as a **proxy** for Albanian citizens’ international mobility.

This means that the Eurostat immigration dataset shows Albanian citizens recorded as arriving in European reporting countries. It does **not** directly measure every person leaving Albania.

Residence permit data was also handled carefully because total categories and subcategories can create double counting if they are summed together incorrectly.

Because of this, the project avoids treating Eurostat values as exact direct emigration totals from Albania.

---

## Project Workflow

### 1. Data Understanding

The project starts by reviewing all available datasets and identifying what each file can be used for.

Main outputs:

* Dataset inventory
* Data source explanation
* Initial limitations

Notebook:

```text
notebooks/01_data_understanding.ipynb
```

---

### 2. Data Cleaning and ETL

Raw datasets were cleaned and transformed using Python and Pandas.

Cleaning steps included:

* Column cleaning
* Year extraction
* Data type conversion
* Missing value handling
* Wide-to-long reshaping
* Eurostat category filtering
* Residence permit category separation
* Avoiding double counting of total and subcategory rows

Main outputs:

```text
data/processed/worldbank_selected_indicators_clean.csv
data/processed/population_clean.csv
data/processed/economy_clean.csv
data/processed/unemployment_clean.csv
data/processed/net_migration_clean.csv
data/processed/migration_flows_country_clean.csv
data/processed/residence_permits_country_clean.csv
data/processed/master_analysis_dataset.csv
```

Notebook:

```text
notebooks/02_data_cleaning.ipynb
```

---

### 3. Data Quality Audit

A data quality audit was created to check:

* Missing values
* Duplicate rows
* Invalid years
* Invalid numeric values
* Outliers
* Coverage by year
* Coverage by indicator
* Dataset limitations

Output:

```text
reports/data_quality_report.md
```

---

### 4. PostgreSQL Database Design

The cleaned data was structured into a PostgreSQL database using dimension and fact tables.

Dimension tables:

```text
date_dimension
country_dimension
indicator_dimension
age_dimension
migration_reason_dimension
```

Fact tables:

```text
fact_population
fact_economy
fact_unemployment
fact_net_migration
fact_migration_flows
fact_residence_permits
```

SQL files:

```text
sql/schema.sql
sql/load_data.sql
sql/queries.sql
```

---

### 5. Exploratory Data Analysis

The EDA section investigates trends in:

* Population
* Net migration
* Eurostat migration flows
* Top destination countries
* Residence permits by reason
* GDP growth
* Unemployment
* Demographic structure

Main outputs:

```text
visuals/population_trend.png
visuals/migration_trend.png
visuals/gdp_unemployment_trend.png
visuals/top_migration_destinations.png
visuals/residence_permits_by_reason.png
visuals/correlation_matrix.png
reports/eda_summary.md
```

Notebook:

```text
notebooks/03_exploratory_analysis.ipynb
```

---

### 6. Statistical Analysis

The project performs correlation analysis between migration and economic/demographic indicators.

Tests include:

* Net migration vs unemployment
* Net migration vs GDP growth
* Net migration vs GDP per capita
* Net migration vs remittances
* Population growth vs net migration
* Residence permits vs unemployment
* Residence permits vs GDP growth

Methods used:

* Pearson correlation
* Spearman correlation
* p-values
* Business-language interpretation

Outputs:

```text
data/processed/statistical_correlation_results.csv
reports/statistical_analysis_report.md
```

Notebook:

```text
notebooks/04_statistical_analysis.ipynb
```

---

### 7. Forecasting to 2035

The project creates simple forecasts to 2035 for selected indicators.

Forecasted indicators include:

* Population
* Net migration
* First residence permits

Models used:

* Moving average baseline
* Linear Regression
* ARIMA

Evaluation metrics:

* MAE
* RMSE
* R² where appropriate

Outputs:

```text
data/processed/forecast_results_2035.csv
data/processed/forecast_model_comparison.csv
data/processed/forecast_best_models.csv
data/processed/forecast_2035_summary.csv
reports/forecasting_report.md
```

Notebook:

```text
notebooks/05_forecasting.ipynb
```

---

### 8. Demographic Structure Analysis

This section studies Albania’s population structure.

Indicators include:

* Youth population
* Working-age population
* Elderly population
* Youth share
* Working-age share
* Elderly share
* Dependency ratio
* Old-age dependency ratio
* Youth dependency ratio

Outputs:

```text
data/processed/demographic_structure_clean.csv
data/processed/demographic_structure_wide.csv
data/processed/master_analysis_dataset_with_demographics.csv
reports/demographic_structure_report.md
```

Notebook:

```text
notebooks/07_demographic_structure.ipynb
```

---

### 9. Power BI Dashboard

The project includes Power BI-ready datasets and dashboard documentation.

Dashboard pages:

1. Executive Summary
2. Migration Analysis
3. Economy and Employment
4. Demographic Risk
5. Forecasting

Power BI data files:

```text
dashboard/powerbi_data/main_yearly_dashboard.csv
dashboard/powerbi_data/migration_yearly_dashboard.csv
dashboard/powerbi_data/migration_destinations_dashboard.csv
dashboard/powerbi_data/residence_permits_reason_dashboard.csv
dashboard/powerbi_data/demographics_dashboard.csv
dashboard/powerbi_data/forecast_dashboard.csv
dashboard/powerbi_data/forecast_2035_summary_dashboard.csv
```

Dashboard documentation:

```text
dashboard/powerbi_dashboard.pbix
dashboard/dashboard_documentation.md
dashboard/dax_measures.md
```

---

### 10. Final Reporting

The final reporting notebook generates:

```text
reports/executive_summary.md
reports/research_report.md
```

Notebook:

```text
notebooks/06_final_insights.ipynb
```

---

## Repository Structure

```text
albania-brain-drain-analysis/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── notebooks/
│   ├── 01_data_understanding.ipynb
│   ├── 02_data_cleaning.ipynb
│   ├── 03_exploratory_analysis.ipynb
│   ├── 04_statistical_analysis.ipynb
│   ├── 05_forecasting.ipynb
│   ├── 06_final_insights.ipynb
│   ├── 07_demographic_structure.ipynb
│   └── 08_powerbi_preparation.ipynb
│
├── sql/
│   ├── schema.sql
│   ├── load_data.sql
│   └── queries.sql
│
├── dashboard/
│   ├── powerbi_data/
│   ├── dashboard_documentation.md
│   └── dax_measures.md
|   |__ powerbi_dashboard.pbix 
│
├── reports/
│   ├── executive_summary.md
│   ├── research_report.md
│   ├── data_quality_report.md
│   ├── eda_summary.md
│   ├── statistical_analysis_report.md
│   ├── forecasting_report.md
│   └── demographic_structure_report.md
│
├── visuals/
│   ├── dashboard_screenshots/
│   └── analysis charts
│
├── src/
│   ├── etl/
│   ├── analysis/
│   ├── forecasting/
│   └── visualization/
│
├── README.md
├── requirements.txt
├── .gitignore
└── LICENSE
```

---

## How to Run the Project

### 1. Clone the repository

```bash
git clone https://github.com/mateossharka9-droid/albania-brain-drain-analysis.git
cd albania-brain-drain-analysis
```

---

### 2. Create a virtual environment

On Windows:

```bash
python -m venv .venv
.venv\Scripts\activate
```

On macOS/Linux:

```bash
python -m venv .venv
source .venv/bin/activate
```

---

### 3. Install requirements

```bash
pip install -r requirements.txt
```

---

### 4. Run the notebooks

Run the notebooks in this order:

```text
01_data_understanding.ipynb
02_data_cleaning.ipynb
03_exploratory_analysis.ipynb
04_statistical_analysis.ipynb
05_forecasting.ipynb
07_demographic_structure.ipynb
08_powerbi_preparation.ipynb
06_final_insights.ipynb
```

---

## PostgreSQL Setup

### 1. Create database

Create a PostgreSQL database named:

```text
albania_brain_drain
```

---

### 2. Run schema

```bash
psql -U postgres -d albania_brain_drain -f sql/schema.sql
```

On Windows, if `psql` is not recognized, use the full path, for example:

```powershell
& "C:\Program Files\PostgreSQL\18\bin\psql.exe" -U postgres -d albania_brain_drain -f sql/schema.sql
```

---

### 3. Load data

```bash
psql -U postgres -d albania_brain_drain -f sql/load_data.sql
```

Windows full-path example:

```powershell
& "C:\Program Files\PostgreSQL\18\bin\psql.exe" -U postgres -d albania_brain_drain -f sql/load_data.sql
```

---

### 4. Run analytical queries

```bash
psql -U postgres -d albania_brain_drain -f sql/queries.sql
```

---

## Power BI Dashboard

To recreate the Power BI dashboard:

1. Open Power BI Desktop.
2. Go to `Home → Get Data → Text/CSV`.
3. Import the CSV files from:

```text
dashboard/powerbi_data/
```

4. Use the dashboard documentation file:

```text
dashboard/dashboard_documentation.md
```

5. Use DAX measures from:

```text
dashboard/dax_measures.md
```

Recommended dashboard pages:

```text
Executive Summary
Migration Analysis
Economy and Employment
Demographic Risk
Forecasting
```

---

## Dashboard Preview

Add dashboard screenshots here after exporting them from Power BI:

```markdown
![Executive Summary](visuals/dashboard_screenshots/executive_summary.png)

![Migration Analysis](visuals/dashboard_screenshots/migration_analysis.png)

![Economy and Employment](visuals/dashboard_screenshots/economy_employment.png)

![Demographic Risk](visuals/dashboard_screenshots/demographic_risk.png)

![Forecasting](visuals/dashboard_screenshots/forecasting.png)
```


---

## Key Findings

The final findings are available in:

```text
reports/executive_summary.md
reports/research_report.md
reports/eda_summary.md
reports/statistical_analysis_report.md
reports/forecasting_report.md
reports/demographic_structure_report.md
```

Main themes identified by the project:

1. Albania has experienced population decline since 2000.
2. Net migration indicates migration pressure.
3. European destinations are important in Albanian mobility patterns.
4. Residence permits show that migration is connected to employment, education, and family reasons.
5. Economic indicators such as unemployment and GDP growth help explain part of the migration context.
6. Age-structure change creates long-term demographic risk.
7. Forecasts suggest possible future pressure if historical trends continue.

---

## Limitations

This project has several important limitations:

* Eurostat migration data is a proxy for Albanian citizens’ mobility into European reporting countries.
* Eurostat immigration values should not be interpreted as a complete direct count of all emigration from Albania.
* Residence permit total categories and subcategories must be handled separately to avoid double counting.
* Some indicators have missing values.
* Correlation analysis does not prove causation.
* Forecasts are trend-based scenarios, not exact future predictions.
* This is a low-level academic and portfolio project, not a published scientific study.

---

## Future Improvements

Possible future improvements include:

* Improve Eurostat filtering and validation with official metadata.
* Add wage indicators if reliable data is available.
* Add education-level migration indicators if available.
* Improve forecasting using more advanced models.
* Add confidence intervals to forecasts.
* Create a more advanced interactive Power BI dashboard.
* Add regional analysis inside Albania if data is available.
* Compare Albania with other Western Balkan countries.

---

## Skills Demonstrated

This project demonstrates:

* Data cleaning
* Data transformation
* Exploratory data analysis
* Statistical analysis
* Forecasting
* PostgreSQL database design
* SQL querying
* Power BI dashboarding
* Data storytelling
* Research-style reporting
* GitHub project documentation

---

## Author

**Mateos Sharka**
AI Student
GitHub: `mateossharka9-droid`

---

## Project Status

Completed as an academic and portfolio-level data analytics project.
