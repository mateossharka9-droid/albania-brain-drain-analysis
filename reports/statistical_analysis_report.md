# Statistical Analysis Report

## Project

Albania’s Brain Drain: A Data-Driven Analysis of Migration, Employment and Economic Development

## Purpose

This report analyzes whether migration indicators are statistically related to economic and employment indicators.

The analysis uses Pearson correlation, Spearman correlation, p-values, and basic hypothesis testing.

Important: correlation does not prove causation.

## Correlation Results

| x_variable                            | y_variable                    |   n_observations |   pearson_r |   pearson_p_value |   pearson_ci_lower |   pearson_ci_upper |   spearman_rho |   spearman_p_value | significance_5_percent   |
|:--------------------------------------|:------------------------------|-----------------:|------------:|------------------:|-------------------:|-------------------:|---------------:|-------------------:|:-------------------------|
| unemployment_total_percent            | net_migration                 |               26 |     -0.4857 |            0.0119 |            -0.7348 |            -0.1211 |        -0.3563 |             0.074  | Significant              |
| gdp_growth_annual_percent             | net_migration                 |               25 |     -0.5791 |            0.0024 |            -0.7928 |            -0.2386 |        -0.5377 |             0.0056 | Significant              |
| gdp_per_capita_current_usd            | net_migration                 |               25 |      0.5753 |            0.0026 |             0.2332 |             0.7907 |         0.5646 |             0.0033 | Significant              |
| remittances_percent_gdp               | net_migration                 |               25 |     -0.8403 |            0      |            -0.9275 |            -0.6664 |        -0.6362 |             0.0006 | Significant              |
| population_growth_annual_percent      | net_migration                 |               25 |     -0.7849 |            0      |            -0.9007 |            -0.565  |        -0.6223 |             0.0009 | Significant              |
| unemployment_total_percent            | total_first_residence_permits |               18 |     -0.0918 |            0.7172 |            -0.5357 |             0.3919 |        -0.4097 |             0.0913 | Not significant          |
| gdp_growth_annual_percent             | total_first_residence_permits |               17 |      0.5614 |            0.019  |             0.1107 |             0.8206 |         0.7426 |             0.0006 | Significant              |
| unemployment_total_percent            | migration_pressure_index      |               25 |     -0.7729 |            0      |            -0.8948 |            -0.5439 |        -0.7732 |             0      | Significant              |
| gdp_growth_annual_percent             | migration_pressure_index      |               25 |     -0.3601 |            0.0771 |            -0.6611 |             0.0409 |        -0.2738 |             0.1853 | Not significant          |
| residence_permits_per_100k_population | migration_pressure_index      |               17 |      1      |            0      |             1      |             1      |         1      |             0      | Significant              |

## Business-Language Interpretation

- For unemployment_total_percent and net_migration, the Pearson correlation is -0.4857, which suggests a moderate negative relationship. The relationship is statistically significant at the 5% level. Because net migration can be negative, the direction must be interpreted carefully: a lower net migration value usually means stronger migration pressure.
- For gdp_growth_annual_percent and net_migration, the Pearson correlation is -0.5791, which suggests a moderate negative relationship. The relationship is statistically significant at the 5% level. Because net migration can be negative, the direction must be interpreted carefully: a lower net migration value usually means stronger migration pressure.
- For gdp_per_capita_current_usd and net_migration, the Pearson correlation is 0.5753, which suggests a moderate positive relationship. The relationship is statistically significant at the 5% level. Because net migration can be negative, the direction must be interpreted carefully: a lower net migration value usually means stronger migration pressure.
- For remittances_percent_gdp and net_migration, the Pearson correlation is -0.8403, which suggests a very strong negative relationship. The relationship is statistically significant at the 5% level. Because net migration can be negative, the direction must be interpreted carefully: a lower net migration value usually means stronger migration pressure.
- For population_growth_annual_percent and net_migration, the Pearson correlation is -0.7849, which suggests a strong negative relationship. The relationship is statistically significant at the 5% level. Because net migration can be negative, the direction must be interpreted carefully: a lower net migration value usually means stronger migration pressure.
- For unemployment_total_percent and total_first_residence_permits, the Pearson correlation is -0.0918, which suggests a very weak negative relationship. The relationship is not statistically significant at the 5% level. 
- For gdp_growth_annual_percent and total_first_residence_permits, the Pearson correlation is 0.5614, which suggests a moderate positive relationship. The relationship is statistically significant at the 5% level. 
- For unemployment_total_percent and migration_pressure_index, the Pearson correlation is -0.7729, which suggests a strong negative relationship. The relationship is statistically significant at the 5% level. 
- For gdp_growth_annual_percent and migration_pressure_index, the Pearson correlation is -0.3601, which suggests a weak negative relationship. The relationship is not statistically significant at the 5% level. 
- For residence_permits_per_100k_population and migration_pressure_index, the Pearson correlation is 1.0, which suggests a very strong positive relationship. The relationship is statistically significant at the 5% level. 

## Hypothesis Test 1: Unemployment and Net Migration

H0: There is no statistically significant relationship between unemployment and net migration in Albania.

H1: There is a statistically significant relationship between unemployment and net migration in Albania.

Pearson r: -0.4857
p-value: 0.0119
Decision: Reject H0

## Hypothesis Test 2: GDP Growth and Net Migration

H0: There is no statistically significant relationship between GDP growth and migration pressure.

H1: There is a statistically significant relationship between GDP growth and migration pressure.

Pearson r: -0.5791
p-value: 0.0024
Decision: Reject H0

## Limitations

- The number of yearly observations may be limited for some indicators.
- Correlation does not prove causation.
- Net migration values require careful interpretation because negative values indicate migration loss.
- Eurostat migration and residence permit data are proxy indicators, not direct measures of all emigration from Albania.
- Missing values and different source coverage may affect statistical strength.

## Visuals Created

- scatter_unemployment_vs_net_migration.png
- scatter_gdp_growth_vs_net_migration.png
- scatter_residence_permits_vs_unemployment.png
