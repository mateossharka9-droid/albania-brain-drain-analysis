# Forecasting Report

## Project

Albania’s Brain Drain: A Data-Driven Analysis of Migration, Employment and Economic Development

## Purpose

This report presents simple forecasts to 2035 for key indicators related to Albania's brain drain analysis.

The forecasted indicators are:

- Population
- Net Migration
- First Residence Permits

## Models Used

Three forecasting approaches were used:

1. Moving Average Baseline
2. Linear Regression
3. ARIMA(1,1,1)

## Model Comparison

| indicator                     | indicator_label         | model                   |              mae |             rmse |         r2 |   train_start_year |   train_end_year |   test_start_year |   test_end_year |   observations |
|:------------------------------|:------------------------|:------------------------|-----------------:|-----------------:|-----------:|-------------------:|-----------------:|------------------:|----------------:|---------------:|
| population_total              | Population              | Moving Average Baseline | 155719           | 164657           |  -8.46806  |               2000 |             2019 |              2020 |            2024 |             25 |
| population_total              | Population              | Linear Regression       |  95661.4         |  96953.1         |  -2.28263  |               2000 |             2019 |              2020 |            2024 |             25 |
| population_total              | Population              | ARIMA(1,1,1)            |  58638.2         |  64664.4         |  -0.460254 |               2000 |             2019 |              2020 |            2024 |             25 |
| net_migration                 | Net Migration           | Moving Average Baseline |   7135           |   8248.83        |  -1.50993  |               2000 |             2020 |              2021 |            2025 |             26 |
| net_migration                 | Net Migration           | Linear Regression       |  20284.2         |  20998.9         | -15.2656   |               2000 |             2020 |              2021 |            2025 |             26 |
| net_migration                 | Net Migration           | ARIMA(1,1,1)            |   5754.06        |   7375.2         |  -1.00644  |               2000 |             2020 |              2021 |            2025 |             26 |
| total_first_residence_permits | First Residence Permits | Moving Average Baseline |      1.2317e+06  |      1.63374e+06 |  -0.152764 |               2008 |             2022 |              2023 |            2025 |             18 |
| total_first_residence_permits | First Residence Permits | Linear Regression       |      1.17639e+06 |      1.79655e+06 |  -0.393965 |               2008 |             2022 |              2023 |            2025 |             18 |
| total_first_residence_permits | First Residence Permits | ARIMA(1,1,1)            |      1.12408e+06 |      1.79094e+06 |  -0.385276 |               2008 |             2022 |              2023 |            2025 |             18 |

## Best Model by Indicator

| indicator                     | indicator_label         | model                   |            mae |            rmse |        r2 |   train_start_year |   train_end_year |   test_start_year |   test_end_year |   observations |
|:------------------------------|:------------------------|:------------------------|---------------:|----------------:|----------:|-------------------:|-----------------:|------------------:|----------------:|---------------:|
| net_migration                 | Net Migration           | ARIMA(1,1,1)            |  5754.06       |  7375.2         | -1.00644  |               2000 |             2020 |              2021 |            2025 |             26 |
| population_total              | Population              | ARIMA(1,1,1)            | 58638.2        | 64664.4         | -0.460254 |               2000 |             2019 |              2020 |            2024 |             25 |
| total_first_residence_permits | First Residence Permits | Moving Average Baseline |     1.2317e+06 |     1.63374e+06 | -0.152764 |               2008 |             2022 |              2023 |            2025 |             18 |

## 2035 Forecast Summary

| indicator                     | indicator_label         | model                   |   year |   forecast_value |
|:------------------------------|:------------------------|:------------------------|-------:|-----------------:|
| population_total              | Population              | ARIMA(1,1,1)            |   2035 |      2.19752e+06 |
| net_migration                 | Net Migration           | ARIMA(1,1,1)            |   2035 | -24271.5         |
| total_first_residence_permits | First Residence Permits | Moving Average Baseline |   2035 |      2.21982e+06 |

## Interpretation

The forecasts provide a simple trend-based view of how population, net migration, and residence permits may evolve by 2035 if historical patterns continue.

These forecasts should not be interpreted as exact predictions. Migration and population trends can change due to economic policy, education opportunities, labour-market conditions, international migration rules, wages, political conditions, and unexpected shocks.

## Limitations

- The project uses annual public data, which may have missing values for some indicators.
- ARIMA may be unstable when the time series is short.
- Linear Regression assumes a simple trend over time and may miss structural changes.
- Moving Average is useful as a baseline but does not capture long-term changes.
- Forecasting migration is especially uncertain because migration depends on both Albanian conditions and destination-country policies.
- Working-age and elderly population forecasts require additional cleaning of the population estimates dataset, which will be handled in a later demographic analysis step.

## Visuals Created

- forecast_population_total_2035.png
- forecast_net_migration_2035.png
- forecast_total_first_residence_permits_2035.png
