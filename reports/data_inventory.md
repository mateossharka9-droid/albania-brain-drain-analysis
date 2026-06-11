# Data Inventory

## Purpose

This document explains the raw datasets used in the Albania Brain Drain Analysis project.

## 1. World Bank Albania Indicators

**File:** `data/raw/worldbank/API_ALB_DS2_en_csv_v2_3304.csv`

Used for:

- Population total
- Population growth
- Net migration
- GDP current US dollars
- GDP growth annual percentage
- GDP per capita
- Unemployment rate
- Remittances
- Foreign direct investment

Important indicator codes:

| Indicator | Code |
|---|---|
| Population, total | SP.POP.TOTL |
| Population growth annual % | SP.POP.GROW |
| Net migration | SM.POP.NETM |
| GDP current US$ | NY.GDP.MKTP.CD |
| GDP growth annual % | NY.GDP.MKTP.KD.ZG |
| GDP per capita current US$ | NY.GDP.PCAP.CD |
| Unemployment total % | SL.UEM.TOTL.ZS |
| Remittances received % of GDP | BX.TRF.PWKR.DT.GD.ZS |
| FDI % of GDP | BX.KLT.DINV.WD.GD.ZS |

## 2. World Bank Population Estimates

**File:** `data/raw/population_estimates/Population-EstimatesCSV.csv`

Used for:

- Population by age group
- Working-age population
- Youth population
- Elderly population
- Dependency pressure
- Forecasting support

## 3. Eurostat Migration Flows

**Files:**

- `data/raw/eurostat/eurostat_albanian_citizens_immigration.csv.gz`
- `data/raw/eurostat/eurostat_albanian_citizens_emigration.csv.gz`

Used for:

- Albanian citizens arriving in European reporting countries
- Albanian citizens leaving European reporting countries
- Top destination-country analysis
- Migration pressure trends

Important limitation:

These files do not directly measure all people leaving Albania. They represent movements of Albanian citizens reported by European countries.

## 4. Eurostat Residence Permits

**Files:**

- `data/raw/eurostat/eurostat_first_residence_permits_albania.csv.gz`
- `data/raw/eurostat/eurostat_residence_permits_age_sex_reason_albania.csv.gz`

Used for:

- First residence permits issued to Albanian citizens
- Employment migration
- Education migration
- Family migration
- Permits by age, sex, and reason

Important limitation:

Do not add TOTAL categories together with subcategories such as employment, education, and family.

## 5. Official Reports

**Files:**

- `data/raw/instat_reports/cens-2023-census-botim.pdf`
- `data/raw/instat_reports/population-on-1-january-2025-dt-12062025-anglisht.pdf`
- `data/raw/instat_reports/world-bank_albania-migration-survey-report-2025_eng_interactive.pdf`

Used for:

- Research context
- Population decline evidence
- Migration motivations
- Brain drain discussion
- Policy recommendations

## Next Step

The next project step is to open `notebooks/01_data_understanding.ipynb` and inspect the structure, columns, years, and missing values of each dataset.
