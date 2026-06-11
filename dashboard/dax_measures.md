
# DAX Measures for Power BI Dashboard

## Main table name

Use this table in Power BI:

main_yearly_dashboard

---

## Population Measures

Total Population =
SUM(main_yearly_dashboard[population_total])

Latest Year =
MAX(main_yearly_dashboard[year])

Latest Population =
CALCULATE(
    SUM(main_yearly_dashboard[population_total]),
    main_yearly_dashboard[year] = MAX(main_yearly_dashboard[year])
)

Population in 2000 =
CALCULATE(
    SUM(main_yearly_dashboard[population_total]),
    main_yearly_dashboard[year] = 2000
)

Population Change =
[Latest Population] - [Population in 2000]

Population Change % =
DIVIDE([Population Change], [Population in 2000])

---

## Migration Measures

Net Migration =
SUM(main_yearly_dashboard[net_migration])

Latest Net Migration =
CALCULATE(
    SUM(main_yearly_dashboard[net_migration]),
    main_yearly_dashboard[year] = MAX(main_yearly_dashboard[year])
)

Migration Rate per 1,000 =
AVERAGE(main_yearly_dashboard[net_migration_rate_per_1000])

Migration Pressure Index =
AVERAGE(main_yearly_dashboard[migration_pressure_index])

---

## Residence Permit Measures

Total Residence Permits =
SUM(main_yearly_dashboard[total_first_residence_permits])

Residence Permits per 100k Population =
AVERAGE(main_yearly_dashboard[residence_permits_per_100k_population])

Employment Permit Share =
AVERAGE(main_yearly_dashboard[employment_permit_share])

Education Permit Share =
AVERAGE(main_yearly_dashboard[education_permit_share])

Family Permit Share =
AVERAGE(main_yearly_dashboard[family_permit_share])

---

## Economy and Employment Measures

GDP Growth =
AVERAGE(main_yearly_dashboard[gdp_growth_annual_percent])

GDP per Capita =
AVERAGE(main_yearly_dashboard[gdp_per_capita_current_usd])

Unemployment Rate =
AVERAGE(main_yearly_dashboard[unemployment_total_percent])

Remittances % GDP =
AVERAGE(main_yearly_dashboard[remittances_percent_gdp])

FDI % GDP =
AVERAGE(main_yearly_dashboard[fdi_percent_gdp])

---

## Demographic Measures

Working Age Population =
SUM(main_yearly_dashboard[working_age_population_15_64])

Elderly Population =
SUM(main_yearly_dashboard[elderly_population_65_plus])

Youth Population =
SUM(main_yearly_dashboard[youth_population_0_14])

Working Age Share =
AVERAGE(main_yearly_dashboard[working_age_share_15_64_percent])

Elderly Share =
AVERAGE(main_yearly_dashboard[elderly_share_65_plus_percent])

Youth Share =
AVERAGE(main_yearly_dashboard[youth_share_0_14_percent])

Dependency Ratio =
AVERAGE(main_yearly_dashboard[dependency_ratio_total])
