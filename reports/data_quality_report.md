
# Data Quality Report

## Project

**Albania’s Brain Drain: A Data-Driven Analysis of Migration, Employment and Economic Development**

## Purpose of This Report

This report documents the quality of the cleaned datasets used in the analysis.  
The purpose is to identify missing values, duplicate records, year coverage, invalid values, outliers, and limitations before conducting exploratory data analysis, statistical testing, forecasting, and dashboard development.

---

## 1. Processed Dataset Summary

| file_name                                          |   rows |   columns |   duplicate_rows |   total_missing_values |   year_min |   year_max |
|:---------------------------------------------------|-------:|----------:|-----------------:|-----------------------:|-----------:|-----------:|
| economy_clean.csv                                  |    125 |         7 |                0 |                      0 |       2000 |       2024 |
| master_analysis_dataset.csv                        |     26 |        22 |                0 |                    106 |       2000 |       2025 |
| migration_flows_clean.csv                          |   3955 |         8 |                0 |                      0 |       2015 |       2024 |
| migration_flows_country_clean.csv                  |   3859 |         8 |                0 |                      0 |       2015 |       2024 |
| net_migration_clean.csv                            |     26 |         7 |                0 |                      0 |       2000 |       2025 |
| population_clean.csv                               |     50 |         7 |                0 |                      0 |       2000 |       2024 |
| residence_permits_age_sex_reason_clean.csv         | 233840 |        17 |                0 |                      0 |       2010 |       2025 |
| residence_permits_age_sex_reason_country_clean.csv | 233160 |        17 |                0 |                      0 |       2010 |       2025 |
| residence_permits_clean.csv                        |   2302 |        12 |                0 |                      0 |       2008 |       2025 |
| residence_permits_country_clean.csv                |   2156 |        12 |                0 |                      0 |       2008 |       2025 |
| residence_permits_reason_breakdown_clean.csv       |   1620 |        12 |                0 |                      0 |       2008 |       2025 |
| residence_permits_total_clean.csv                  |    536 |        12 |                0 |                      0 |       2008 |       2025 |
| unemployment_clean.csv                             |     26 |         7 |                0 |                      0 |       2000 |       2025 |
| worldbank_albania_clean.csv                        |    440 |         7 |                0 |                      0 |       1960 |       2025 |
| worldbank_selected_indicators_clean.csv            |    227 |         7 |                0 |                      0 |       2000 |       2025 |

---

## 2. Missing Values in Master Dataset

| column                                |   missing_values |   missing_percent |
|:--------------------------------------|-----------------:|------------------:|
| eurostat_emigration_from_europe       |               16 |             61.54 |
| eurostat_immigration_to_europe        |               16 |             61.54 |
| residence_permits_per_100k_population |                9 |             34.62 |
| education_permits                     |                8 |             30.77 |
| family_permits                        |                8 |             30.77 |
| employment_permit_share               |                8 |             30.77 |
| family_permit_share                   |                8 |             30.77 |
| education_permit_share                |                8 |             30.77 |
| employment_permits                    |                8 |             30.77 |
| total_first_residence_permits         |                8 |             30.77 |
| gdp_current_usd                       |                1 |              3.85 |
| fdi_percent_gdp                       |                1 |              3.85 |
| gdp_growth_annual_percent             |                1 |              3.85 |
| gdp_per_capita_current_usd            |                1 |              3.85 |
| net_migration_rate_per_1000           |                1 |              3.85 |
| population_growth_annual_percent      |                1 |              3.85 |
| remittances_percent_gdp               |                1 |              3.85 |
| population_total                      |                1 |              3.85 |
| migration_pressure_index              |                1 |              3.85 |
| year                                  |                0 |              0    |
| net_migration                         |                0 |              0    |
| unemployment_total_percent            |                0 |              0    |

---

## 3. Duplicate Row Summary

| file_name                                          |   duplicate_rows |
|:---------------------------------------------------|-----------------:|
| economy_clean.csv                                  |                0 |
| master_analysis_dataset.csv                        |                0 |
| migration_flows_clean.csv                          |                0 |
| migration_flows_country_clean.csv                  |                0 |
| net_migration_clean.csv                            |                0 |
| population_clean.csv                               |                0 |
| residence_permits_age_sex_reason_clean.csv         |                0 |
| residence_permits_age_sex_reason_country_clean.csv |                0 |
| residence_permits_clean.csv                        |                0 |
| residence_permits_country_clean.csv                |                0 |
| residence_permits_reason_breakdown_clean.csv       |                0 |
| residence_permits_total_clean.csv                  |                0 |
| unemployment_clean.csv                             |                0 |
| worldbank_albania_clean.csv                        |                0 |
| worldbank_selected_indicators_clean.csv            |                0 |

---

## 4. Invalid Year Summary

| file_name                                          |   invalid_year_rows |   min_year |   max_year |
|:---------------------------------------------------|--------------------:|-----------:|-----------:|
| economy_clean.csv                                  |                   0 |       2000 |       2024 |
| master_analysis_dataset.csv                        |                   0 |       2000 |       2025 |
| migration_flows_clean.csv                          |                   0 |       2015 |       2024 |
| migration_flows_country_clean.csv                  |                   0 |       2015 |       2024 |
| net_migration_clean.csv                            |                   0 |       2000 |       2025 |
| population_clean.csv                               |                   0 |       2000 |       2024 |
| residence_permits_age_sex_reason_clean.csv         |                   0 |       2010 |       2025 |
| residence_permits_age_sex_reason_country_clean.csv |                   0 |       2010 |       2025 |
| residence_permits_clean.csv                        |                   0 |       2008 |       2025 |
| residence_permits_country_clean.csv                |                   0 |       2008 |       2025 |
| residence_permits_reason_breakdown_clean.csv       |                   0 |       2008 |       2025 |
| residence_permits_total_clean.csv                  |                   0 |       2008 |       2025 |
| unemployment_clean.csv                             |                   0 |       2000 |       2025 |
| worldbank_albania_clean.csv                        |                   0 |       1960 |       2025 |
| worldbank_selected_indicators_clean.csv            |                   0 |       2000 |       2025 |

---

## 5. Numeric Quality Summary

| file_name                                          | column                                |   missing_values |   negative_values |   zero_values |        min_value |        max_value |
|:---------------------------------------------------|:--------------------------------------|-----------------:|------------------:|--------------:|-----------------:|-----------------:|
| economy_clean.csv                                  | year                                  |                0 |                 0 |             0 |   2000           |   2024           |
| economy_clean.csv                                  | value                                 |                0 |                 1 |             0 |     -3.31376     |      2.70464e+10 |
| master_analysis_dataset.csv                        | year                                  |                0 |                 0 |             0 |   2000           |   2025           |
| master_analysis_dataset.csv                        | fdi_percent_gdp                       |                1 |                 0 |             0 |      2.99003     |     10.9068      |
| master_analysis_dataset.csv                        | gdp_current_usd                       |                1 |                 0 |             0 |      3.58457e+09 |      2.70464e+10 |
| master_analysis_dataset.csv                        | gdp_growth_annual_percent             |                1 |                 1 |             0 |     -3.31376     |      8.96958     |
| master_analysis_dataset.csv                        | gdp_per_capita_current_usd            |                1 |                 0 |             0 |   1160.42        |  11377.8         |
| master_analysis_dataset.csv                        | net_migration                         |                0 |                26 |             0 | -60531           |  -9347           |
| master_analysis_dataset.csv                        | population_growth_annual_percent      |                1 |                25 |             0 |     -1.54316     |     -0.269017    |
| master_analysis_dataset.csv                        | population_total                      |                1 |                 0 |             0 |      2.37713e+06 |      3.08903e+06 |
| master_analysis_dataset.csv                        | remittances_percent_gdp               |                1 |                 0 |             0 |      8.40939     |     17.2281      |
| master_analysis_dataset.csv                        | unemployment_total_percent            |                0 |                 0 |             0 |     10.669       |     19.023       |
| master_analysis_dataset.csv                        | eurostat_emigration_from_europe       |               16 |                 0 |             0 |      3.46603e+06 |      6.62551e+06 |
| master_analysis_dataset.csv                        | eurostat_immigration_to_europe        |               16 |                 0 |             0 |      4.47748e+06 |      1.0484e+07  |
| master_analysis_dataset.csv                        | total_first_residence_permits         |                8 |                 0 |             0 |  74903           |      3.44261e+06 |
| master_analysis_dataset.csv                        | education_permits                     |                8 |                 0 |             0 |  11102           | 525927           |
| master_analysis_dataset.csv                        | employment_permits                    |                8 |                 0 |             0 |   7584           |      1.23166e+06 |
| master_analysis_dataset.csv                        | family_permits                        |                8 |                 0 |             0 |  35478           | 992164           |
| master_analysis_dataset.csv                        | net_migration_rate_per_1000           |                1 |                25 |             0 |    -19.5955      |     -3.47541     |
| master_analysis_dataset.csv                        | residence_permits_per_100k_population |                9 |                 0 |             0 |  71229.5         | 142605           |
| master_analysis_dataset.csv                        | employment_permit_share               |                8 |                 0 |             0 |      0.101251    |      0.399904    |
| master_analysis_dataset.csv                        | education_permit_share                |                8 |                 0 |             0 |      0.116881    |      0.219611    |
| master_analysis_dataset.csv                        | family_permit_share                   |                8 |                 0 |             0 |      0.264842    |      0.473653    |
| master_analysis_dataset.csv                        | migration_pressure_index              |                1 |                 0 |             0 |     14.8076      | 142615           |
| migration_flows_clean.csv                          | year                                  |                0 |                 0 |             0 |   2015           |   2024           |
| migration_flows_clean.csv                          | value                                 |                0 |                 0 |           645 |      0           |      6.99728e+06 |
| migration_flows_country_clean.csv                  | year                                  |                0 |                 0 |             0 |   2015           |   2024           |
| migration_flows_country_clean.csv                  | value                                 |                0 |                 0 |           645 |      0           |      1.97712e+06 |
| net_migration_clean.csv                            | year                                  |                0 |                 0 |             0 |   2000           |   2025           |
| net_migration_clean.csv                            | value                                 |                0 |                26 |             0 | -60531           |  -9347           |
| population_clean.csv                               | year                                  |                0 |                 0 |             0 |   2000           |   2024           |
| population_clean.csv                               | value                                 |                0 |                25 |             0 |     -1.54316     |      3.08903e+06 |
| residence_permits_age_sex_reason_clean.csv         | year                                  |                0 |                 0 |             0 |   2010           |   2025           |
| residence_permits_age_sex_reason_clean.csv         | value                                 |                0 |                 0 |        111390 |      0           |      3.50465e+06 |
| residence_permits_age_sex_reason_country_clean.csv | year                                  |                0 |                 0 |             0 |   2010           |   2025           |
| residence_permits_age_sex_reason_country_clean.csv | value                                 |                0 |                 0 |        111301 |      0           | 967215           |
| residence_permits_clean.csv                        | year                                  |                0 |                 0 |             0 |   2008           |   2025           |
| residence_permits_clean.csv                        | value                                 |                0 |                 0 |            36 |      0           |      3.82156e+06 |
| residence_permits_country_clean.csv                | year                                  |                0 |                 0 |             0 |   2008           |   2025           |
| residence_permits_country_clean.csv                | value                                 |                0 |                 0 |            36 |      0           | 967345           |
| residence_permits_reason_breakdown_clean.csv       | year                                  |                0 |                 0 |             0 |   2008           |   2025           |
| residence_permits_reason_breakdown_clean.csv       | value                                 |                0 |                 0 |            34 |      0           | 790070           |
| residence_permits_total_clean.csv                  | year                                  |                0 |                 0 |             0 |   2008           |   2025           |
| residence_permits_total_clean.csv                  | value                                 |                0 |                 0 |             2 |      0           | 967345           |
| unemployment_clean.csv                             | year                                  |                0 |                 0 |             0 |   2000           |   2025           |
| unemployment_clean.csv                             | value                                 |                0 |                 0 |             0 |     10.669       |     19.023       |
| worldbank_albania_clean.csv                        | year                                  |                0 |                 0 |             0 |   1960           |   2025           |
| worldbank_albania_clean.csv                        | value                                 |                0 |                93 |            10 | -70165           |      2.70464e+10 |
| worldbank_selected_indicators_clean.csv            | year                                  |                0 |                 0 |             0 |   2000           |   2025           |
| worldbank_selected_indicators_clean.csv            | value                                 |                0 |                52 |             0 | -60531           |      2.70464e+10 |

---

## 6. Outlier Summary

| column                          |   outlier_count |       lower_bound |      upper_bound |
|:--------------------------------|----------------:|------------------:|-----------------:|
| population_total                |               0 |       2.03051e+06 |      3.56977e+06 |
| net_migration                   |               0 |  -92049.4         |  23215.6         |
| gdp_growth_annual_percent       |               1 |      -1.84        |      9.64        |
| gdp_per_capita_current_usd      |               1 |   -1202.05        |  10157.5         |
| unemployment_total_percent      |               0 |       5.18        |     22.84        |
| eurostat_immigration_to_europe  |               0 |       3.41771e+06 |      1.3486e+07  |
| eurostat_emigration_from_europe |               0 |       1.77165e+06 |      9.22602e+06 |
| total_first_residence_permits   |               1 |  992172           |      4.30066e+06 |
| migration_pressure_index        |               0 | -162343           | 270616           |

---

## 7. Coverage by Year

|   year |   available_indicators |
|-------:|-----------------------:|
|   2000 |                     12 |
|   2001 |                     12 |
|   2002 |                     12 |
|   2003 |                     12 |
|   2004 |                     12 |
|   2005 |                     12 |
|   2006 |                     12 |
|   2007 |                     12 |
|   2008 |                     20 |
|   2009 |                     20 |
|   2010 |                     20 |
|   2011 |                     20 |
|   2012 |                     20 |
|   2013 |                     20 |
|   2014 |                     20 |
|   2015 |                     22 |
|   2016 |                     22 |
|   2017 |                     22 |
|   2018 |                     22 |
|   2019 |                     22 |
|   2020 |                     22 |
|   2021 |                     22 |
|   2022 |                     22 |
|   2023 |                     22 |
|   2024 |                     22 |
|   2025 |                     10 |

---

## 8. Coverage by Indicator

| indicator                             |   available_years |   missing_years |   first_available_year |   last_available_year |
|:--------------------------------------|------------------:|----------------:|-----------------------:|----------------------:|
| fdi_percent_gdp                       |                25 |               1 |                   2000 |                  2024 |
| gdp_current_usd                       |                25 |               1 |                   2000 |                  2024 |
| gdp_growth_annual_percent             |                25 |               1 |                   2000 |                  2024 |
| gdp_per_capita_current_usd            |                25 |               1 |                   2000 |                  2024 |
| net_migration                         |                26 |               0 |                   2000 |                  2025 |
| population_growth_annual_percent      |                25 |               1 |                   2000 |                  2024 |
| population_total                      |                25 |               1 |                   2000 |                  2024 |
| remittances_percent_gdp               |                25 |               1 |                   2000 |                  2024 |
| unemployment_total_percent            |                26 |               0 |                   2000 |                  2025 |
| eurostat_emigration_from_europe       |                10 |              16 |                   2015 |                  2024 |
| eurostat_immigration_to_europe        |                10 |              16 |                   2015 |                  2024 |
| total_first_residence_permits         |                18 |               8 |                   2008 |                  2025 |
| education_permits                     |                18 |               8 |                   2008 |                  2025 |
| employment_permits                    |                18 |               8 |                   2008 |                  2025 |
| family_permits                        |                18 |               8 |                   2008 |                  2025 |
| net_migration_rate_per_1000           |                25 |               1 |                   2000 |                  2024 |
| residence_permits_per_100k_population |                17 |               9 |                   2008 |                  2024 |
| employment_permit_share               |                18 |               8 |                   2008 |                  2025 |
| education_permit_share                |                18 |               8 |                   2008 |                  2025 |
| family_permit_share                   |                18 |               8 |                   2008 |                  2025 |
| migration_pressure_index              |                25 |               1 |                   2000 |                  2024 |

---

## 9. Data Limitations

The datasets used in this project come from reliable public sources, but they have several limitations:

1. World Bank indicators are available for different time periods depending on the indicator.
2. Eurostat immigration data measures Albanian citizens arriving in European reporting countries. It does not directly measure people leaving Albania.
3. Eurostat emigration data measures Albanian citizens leaving European reporting countries. It does not directly measure emigration from Albania.
4. Residence permit data can include TOTAL categories and subcategories. These must be separated to avoid double counting.
5. EU aggregate rows must not be mixed with individual country rows in the same calculation.
6. Some indicators have missing values for recent years.
7. Forecasting results should be interpreted carefully because migration and population trends are affected by policy, economic shocks, labour markets, education, wages, and international conditions.

---

## 10. Source Reliability Notes

The main data sources used in this project are:

- World Bank Open Data
- World Bank Population Estimates
- Eurostat migration and residence permit datasets
- INSTAT census and population reports
- World Bank Albania Migration Survey

These are considered reliable public data sources. However, differences in methodology, reporting coverage, and update frequency may affect comparability across datasets.

---

## 11. Conclusion

The cleaned datasets are suitable for a low-level academic and portfolio-style data analytics project.  
However, the final analysis must clearly explain missing values, proxy indicators, and limitations.  
The project should avoid overclaiming results and should distinguish between direct migration measures and proxy indicators such as Eurostat residence permits and immigration into European countries.
