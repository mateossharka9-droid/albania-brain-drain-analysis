-- ============================================================
-- Albania Brain Drain Analysis
-- Example Analytical SQL Queries
-- ============================================================

-- 1. Population trend
SELECT
    d.year,
    f.population_total,
    f.population_growth_annual_percent
FROM fact_population f
JOIN date_dimension d
    ON f.date_id = d.date_id
ORDER BY d.year;

-- 2. Net migration trend
SELECT
    d.year,
    f.net_migration,
    f.net_migration_rate_per_1000,
    f.migration_pressure_index
FROM fact_net_migration f
JOIN date_dimension d
    ON f.date_id = d.date_id
ORDER BY d.year;

-- 3. Economy and unemployment trend
SELECT
    d.year,
    e.gdp_growth_annual_percent,
    e.gdp_per_capita_current_usd,
    u.unemployment_total_percent
FROM fact_economy e
JOIN date_dimension d
    ON e.date_id = d.date_id
LEFT JOIN fact_unemployment u
    ON e.date_id = u.date_id
ORDER BY d.year;

-- 4. Top immigration destination countries for Albanian citizens
SELECT
    reporting.country_name AS reporting_country,
    SUM(f.value) AS total_immigration
FROM fact_migration_flows f
JOIN country_dimension reporting
    ON f.reporting_country_id = reporting.country_id
WHERE f.flow_type = 'immigration'
GROUP BY reporting.country_name
ORDER BY total_immigration DESC
LIMIT 10;

-- 5. Migration flows by year
SELECT
    d.year,
    f.flow_type,
    SUM(f.value) AS total_people
FROM fact_migration_flows f
JOIN date_dimension d
    ON f.date_id = d.date_id
GROUP BY d.year, f.flow_type
ORDER BY d.year, f.flow_type;

-- 6. Residence permits by reason
SELECT
    d.year,
    r.reason_name,
    SUM(f.value) AS total_permits
FROM fact_residence_permits f
JOIN date_dimension d
    ON f.date_id = d.date_id
JOIN migration_reason_dimension r
    ON f.reason_id = r.reason_id
WHERE f.is_total_reason = FALSE
GROUP BY d.year, r.reason_name
ORDER BY d.year, r.reason_name;

-- 7. Total residence permits by year
SELECT
    d.year,
    SUM(f.value) AS total_first_residence_permits
FROM fact_residence_permits f
JOIN date_dimension d
    ON f.date_id = d.date_id
WHERE f.is_total_reason = TRUE
GROUP BY d.year
ORDER BY d.year;

-- 8. Demographic risk indicators
SELECT
    d.year,
    f.population_total,
    f.youth_population_0_14,
    f.working_age_population_15_64,
    f.elderly_population_65_plus,
    f.dependency_ratio_total,
    f.old_age_dependency_ratio,
    f.youth_dependency_ratio
FROM fact_population f
JOIN date_dimension d
    ON f.date_id = d.date_id
ORDER BY d.year;

-- 9. Years with strongest negative net migration
SELECT
    d.year,
    f.net_migration
FROM fact_net_migration f
JOIN date_dimension d
    ON f.date_id = d.date_id
WHERE f.net_migration IS NOT NULL
ORDER BY f.net_migration ASC
LIMIT 10;

-- 10. Simple joined dataset for Power BI
SELECT
    d.year,
    p.population_total,
    p.working_age_population_15_64,
    p.elderly_population_65_plus,
    n.net_migration,
    n.net_migration_rate_per_1000,
    e.gdp_growth_annual_percent,
    e.gdp_per_capita_current_usd,
    e.remittances_percent_gdp,
    u.unemployment_total_percent
FROM date_dimension d
LEFT JOIN fact_population p
    ON d.date_id = p.date_id
LEFT JOIN fact_net_migration n
    ON d.date_id = n.date_id
LEFT JOIN fact_economy e
    ON d.date_id = e.date_id
LEFT JOIN fact_unemployment u
    ON d.date_id = u.date_id
ORDER BY d.year;