-- ============================================================
-- Albania Brain Drain Analysis
-- Load Cleaned CSV Data into PostgreSQL
-- ============================================================

-- IMPORTANT:
-- Run this file from psql using:
-- \i sql/load_data.sql
--
-- If COPY paths do not work on your computer, use absolute paths.

-- ============================================================
-- 1. Load staging tables
-- ============================================================

\copy staging_master_analysis FROM 'data/processed/master_analysis_dataset_sql_ready.csv' WITH CSV HEADER;

\copy staging_migration_flows FROM 'data/processed/migration_flows_country_clean.csv' WITH CSV HEADER;

\copy staging_residence_permits FROM 'data/processed/residence_permits_country_clean.csv' WITH CSV HEADER;

\copy staging_demographics FROM 'data/processed/demographic_structure_wide.csv' WITH CSV HEADER;

-- ============================================================
-- 2. Load dimensions
-- ============================================================

INSERT INTO date_dimension (year)
SELECT DISTINCT year
FROM staging_master_analysis
WHERE year IS NOT NULL
ON CONFLICT (year) DO NOTHING;

INSERT INTO date_dimension (year)
SELECT DISTINCT year
FROM staging_migration_flows
WHERE year IS NOT NULL
ON CONFLICT (year) DO NOTHING;

INSERT INTO date_dimension (year)
SELECT DISTINCT year
FROM staging_residence_permits
WHERE year IS NOT NULL
ON CONFLICT (year) DO NOTHING;

INSERT INTO date_dimension (year)
SELECT DISTINCT year
FROM staging_demographics
WHERE year IS NOT NULL
ON CONFLICT (year) DO NOTHING;

INSERT INTO country_dimension (country_code, country_name, is_aggregate)
VALUES ('ALB', 'Albania', FALSE)
ON CONFLICT (country_code, country_name) DO NOTHING;

INSERT INTO country_dimension (country_code, country_name, is_aggregate)
SELECT DISTINCT
    reporting_country_code,
    reporting_country,
    is_aggregate_reporting_geo
FROM staging_migration_flows
WHERE reporting_country IS NOT NULL
ON CONFLICT (country_code, country_name) DO NOTHING;

INSERT INTO country_dimension (country_code, country_name, is_aggregate)
SELECT DISTINCT
    citizenship_code,
    citizenship_country,
    FALSE
FROM staging_migration_flows
WHERE citizenship_country IS NOT NULL
ON CONFLICT (country_code, country_name) DO NOTHING;

INSERT INTO country_dimension (country_code, country_name, is_aggregate)
SELECT DISTINCT
    reporting_country_code,
    reporting_country,
    is_aggregate_reporting_geo
FROM staging_residence_permits
WHERE reporting_country IS NOT NULL
ON CONFLICT (country_code, country_name) DO NOTHING;

INSERT INTO migration_reason_dimension (reason_code, reason_name, is_total_reason)
SELECT DISTINCT
    reason_code,
    reason,
    is_total_reason
FROM staging_residence_permits
WHERE reason_code IS NOT NULL
ON CONFLICT (reason_code) DO NOTHING;

-- ============================================================
-- 3. Load fact tables
-- ============================================================

INSERT INTO fact_population (
    date_id,
    country_id,
    population_total,
    population_growth_annual_percent,
    youth_population_0_14,
    working_age_population_15_64,
    elderly_population_65_plus,
    dependency_ratio_total,
    old_age_dependency_ratio,
    youth_dependency_ratio
)
SELECT
    d.date_id,
    c.country_id,
    m.population_total,
    m.population_growth_annual_percent,
    demo.youth_population_0_14,
    demo.working_age_population_15_64,
    demo.elderly_population_65_plus,
    demo.dependency_ratio_total,
    demo.old_age_dependency_ratio,
    demo.youth_dependency_ratio
FROM staging_master_analysis m
JOIN date_dimension d
    ON m.year = d.year
JOIN country_dimension c
    ON c.country_code = 'ALB'
LEFT JOIN staging_demographics demo
    ON m.year = demo.year;

INSERT INTO fact_economy (
    date_id,
    country_id,
    gdp_current_usd,
    gdp_growth_annual_percent,
    gdp_per_capita_current_usd,
    remittances_percent_gdp,
    fdi_percent_gdp
)
SELECT
    d.date_id,
    c.country_id,
    m.gdp_current_usd,
    m.gdp_growth_annual_percent,
    m.gdp_per_capita_current_usd,
    m.remittances_percent_gdp,
    m.fdi_percent_gdp
FROM staging_master_analysis m
JOIN date_dimension d
    ON m.year = d.year
JOIN country_dimension c
    ON c.country_code = 'ALB';

INSERT INTO fact_unemployment (
    date_id,
    country_id,
    unemployment_total_percent
)
SELECT
    d.date_id,
    c.country_id,
    m.unemployment_total_percent
FROM staging_master_analysis m
JOIN date_dimension d
    ON m.year = d.year
JOIN country_dimension c
    ON c.country_code = 'ALB';

INSERT INTO fact_net_migration (
    date_id,
    country_id,
    net_migration,
    net_migration_rate_per_1000,
    migration_pressure_index
)
SELECT
    d.date_id,
    c.country_id,
    m.net_migration,
    m.net_migration_rate_per_1000,
    m.migration_pressure_index
FROM staging_master_analysis m
JOIN date_dimension d
    ON m.year = d.year
JOIN country_dimension c
    ON c.country_code = 'ALB';

INSERT INTO fact_migration_flows (
    date_id,
    citizenship_country_id,
    reporting_country_id,
    flow_type,
    value
)
SELECT
    d.date_id,
    citizen.country_id,
    reporting.country_id,
    s.flow_type,
    s.value
FROM staging_migration_flows s
JOIN date_dimension d
    ON s.year = d.year
LEFT JOIN country_dimension citizen
    ON s.citizenship_code = citizen.country_code
LEFT JOIN country_dimension reporting
    ON s.reporting_country_code = reporting.country_code
   AND s.reporting_country = reporting.country_name;

INSERT INTO fact_residence_permits (
    date_id,
    citizenship_country_id,
    reporting_country_id,
    reason_id,
    value,
    is_total_reason
)
SELECT
    d.date_id,
    citizen.country_id,
    reporting.country_id,
    r.reason_id,
    s.value,
    s.is_total_reason
FROM staging_residence_permits s
JOIN date_dimension d
    ON s.year = d.year
LEFT JOIN country_dimension citizen
    ON s.citizenship_code = citizen.country_code
LEFT JOIN country_dimension reporting
    ON s.reporting_country_code = reporting.country_code
   AND s.reporting_country = reporting.country_name
LEFT JOIN migration_reason_dimension r
    ON s.reason_code = r.reason_code;