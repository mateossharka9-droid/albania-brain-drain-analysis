-- ============================================================
-- Albania Brain Drain Analysis
-- PostgreSQL Database Schema
-- ============================================================

DROP TABLE IF EXISTS fact_residence_permits CASCADE;
DROP TABLE IF EXISTS fact_migration_flows CASCADE;
DROP TABLE IF EXISTS fact_net_migration CASCADE;
DROP TABLE IF EXISTS fact_unemployment CASCADE;
DROP TABLE IF EXISTS fact_economy CASCADE;
DROP TABLE IF EXISTS fact_population CASCADE;

DROP TABLE IF EXISTS staging_master_analysis CASCADE;
DROP TABLE IF EXISTS staging_migration_flows CASCADE;
DROP TABLE IF EXISTS staging_residence_permits CASCADE;
DROP TABLE IF EXISTS staging_demographics CASCADE;

DROP TABLE IF EXISTS migration_reason_dimension CASCADE;
DROP TABLE IF EXISTS age_dimension CASCADE;
DROP TABLE IF EXISTS indicator_dimension CASCADE;
DROP TABLE IF EXISTS country_dimension CASCADE;
DROP TABLE IF EXISTS date_dimension CASCADE;

-- ============================================================
-- Dimension Tables
-- ============================================================

CREATE TABLE date_dimension (
    date_id SERIAL PRIMARY KEY,
    year INTEGER NOT NULL UNIQUE
);

CREATE TABLE country_dimension (
    country_id SERIAL PRIMARY KEY,
    country_code VARCHAR(20),
    country_name VARCHAR(150) NOT NULL,
    is_aggregate BOOLEAN DEFAULT FALSE,
    UNIQUE(country_code, country_name)
);

CREATE TABLE indicator_dimension (
    indicator_id SERIAL PRIMARY KEY,
    indicator_code VARCHAR(100) UNIQUE,
    indicator_name TEXT,
    indicator_short_name VARCHAR(150)
);

CREATE TABLE age_dimension (
    age_id SERIAL PRIMARY KEY,
    age_code VARCHAR(50) UNIQUE,
    age_group VARCHAR(100),
    is_total_age BOOLEAN DEFAULT FALSE
);

CREATE TABLE migration_reason_dimension (
    reason_id SERIAL PRIMARY KEY,
    reason_code VARCHAR(50) UNIQUE,
    reason_name VARCHAR(150),
    is_total_reason BOOLEAN DEFAULT FALSE
);

-- ============================================================
-- Staging Tables
-- These are temporary-style loading tables for cleaned CSV files.
-- ============================================================

CREATE TABLE staging_master_analysis (
    year INTEGER,
    population_total NUMERIC,
    population_growth_annual_percent NUMERIC,
    net_migration NUMERIC,
    gdp_current_usd NUMERIC,
    gdp_growth_annual_percent NUMERIC,
    gdp_per_capita_current_usd NUMERIC,
    unemployment_total_percent NUMERIC,
    remittances_percent_gdp NUMERIC,
    fdi_percent_gdp NUMERIC,
    eurostat_immigration_to_europe NUMERIC,
    eurostat_emigration_from_europe NUMERIC,
    total_first_residence_permits NUMERIC,
    education_permits NUMERIC,
    employment_permits NUMERIC,
    family_permits NUMERIC,
    other_reason_permits NUMERIC,
    net_migration_rate_per_1000 NUMERIC,
    residence_permits_per_100k_population NUMERIC,
    employment_permit_share NUMERIC,
    education_permit_share NUMERIC,
    family_permit_share NUMERIC,
    migration_pressure_index NUMERIC
);

CREATE TABLE staging_migration_flows (
    flow_type VARCHAR(50),
    citizenship_code VARCHAR(20),
    citizenship_country VARCHAR(150),
    reporting_country_code VARCHAR(20),
    reporting_country VARCHAR(150),
    year INTEGER,
    value NUMERIC,
    is_aggregate_reporting_geo BOOLEAN
);

CREATE TABLE staging_residence_permits (
    reason_code VARCHAR(50),
    reason VARCHAR(150),
    citizenship_code VARCHAR(20),
    citizenship_country VARCHAR(150),
    duration_code VARCHAR(50),
    duration VARCHAR(150),
    reporting_country_code VARCHAR(20),
    reporting_country VARCHAR(150),
    year INTEGER,
    value NUMERIC,
    is_aggregate_reporting_geo BOOLEAN,
    is_total_reason BOOLEAN
);

CREATE TABLE staging_demographics (
    year INTEGER,
    dependency_ratio_total NUMERIC,
    elderly_population_65_plus NUMERIC,
    elderly_population_change NUMERIC,
    elderly_share_65_plus_percent NUMERIC,
    elderly_to_working_age_ratio NUMERIC,
    fertility_rate NUMERIC,
    life_expectancy_total NUMERIC,
    old_age_dependency_ratio NUMERIC,
    population_growth_annual_percent NUMERIC,
    population_total NUMERIC,
    working_age_population_15_64 NUMERIC,
    working_age_population_change NUMERIC,
    working_age_share_15_64_percent NUMERIC,
    youth_dependency_ratio NUMERIC,
    youth_population_0_14 NUMERIC,
    youth_share_0_14_percent NUMERIC,
    youth_to_working_age_ratio NUMERIC
);

-- ============================================================
-- Fact Tables
-- ============================================================

CREATE TABLE fact_population (
    population_fact_id SERIAL PRIMARY KEY,
    date_id INTEGER NOT NULL REFERENCES date_dimension(date_id),
    country_id INTEGER NOT NULL REFERENCES country_dimension(country_id),
    population_total NUMERIC,
    population_growth_annual_percent NUMERIC,
    youth_population_0_14 NUMERIC,
    working_age_population_15_64 NUMERIC,
    elderly_population_65_plus NUMERIC,
    dependency_ratio_total NUMERIC,
    old_age_dependency_ratio NUMERIC,
    youth_dependency_ratio NUMERIC
);

CREATE TABLE fact_economy (
    economy_fact_id SERIAL PRIMARY KEY,
    date_id INTEGER NOT NULL REFERENCES date_dimension(date_id),
    country_id INTEGER NOT NULL REFERENCES country_dimension(country_id),
    gdp_current_usd NUMERIC,
    gdp_growth_annual_percent NUMERIC,
    gdp_per_capita_current_usd NUMERIC,
    remittances_percent_gdp NUMERIC,
    fdi_percent_gdp NUMERIC
);

CREATE TABLE fact_unemployment (
    unemployment_fact_id SERIAL PRIMARY KEY,
    date_id INTEGER NOT NULL REFERENCES date_dimension(date_id),
    country_id INTEGER NOT NULL REFERENCES country_dimension(country_id),
    unemployment_total_percent NUMERIC
);

CREATE TABLE fact_net_migration (
    net_migration_fact_id SERIAL PRIMARY KEY,
    date_id INTEGER NOT NULL REFERENCES date_dimension(date_id),
    country_id INTEGER NOT NULL REFERENCES country_dimension(country_id),
    net_migration NUMERIC,
    net_migration_rate_per_1000 NUMERIC,
    migration_pressure_index NUMERIC
);

CREATE TABLE fact_migration_flows (
    migration_flow_fact_id SERIAL PRIMARY KEY,
    date_id INTEGER NOT NULL REFERENCES date_dimension(date_id),
    citizenship_country_id INTEGER REFERENCES country_dimension(country_id),
    reporting_country_id INTEGER REFERENCES country_dimension(country_id),
    flow_type VARCHAR(50),
    value NUMERIC
);

CREATE TABLE fact_residence_permits (
    residence_permit_fact_id SERIAL PRIMARY KEY,
    date_id INTEGER NOT NULL REFERENCES date_dimension(date_id),
    citizenship_country_id INTEGER REFERENCES country_dimension(country_id),
    reporting_country_id INTEGER REFERENCES country_dimension(country_id),
    reason_id INTEGER REFERENCES migration_reason_dimension(reason_id),
    value NUMERIC,
    is_total_reason BOOLEAN
);

-- ============================================================
-- Indexes
-- ============================================================

CREATE INDEX idx_date_dimension_year ON date_dimension(year);
CREATE INDEX idx_country_dimension_code ON country_dimension(country_code);
CREATE INDEX idx_fact_population_date ON fact_population(date_id);
CREATE INDEX idx_fact_economy_date ON fact_economy(date_id);
CREATE INDEX idx_fact_unemployment_date ON fact_unemployment(date_id);
CREATE INDEX idx_fact_net_migration_date ON fact_net_migration(date_id);
CREATE INDEX idx_fact_migration_flows_date ON fact_migration_flows(date_id);
CREATE INDEX idx_fact_residence_permits_date ON fact_residence_permits(date_id);