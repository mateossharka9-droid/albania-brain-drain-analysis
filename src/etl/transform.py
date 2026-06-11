import pandas as pd

WORLD_BANK_INDICATORS = {
    "SP.POP.TOTL": "population_total",
    "SP.POP.GROW": "population_growth",
    "SM.POP.NETM": "net_migration",
    "NY.GDP.MKTP.CD": "gdp_current_usd",
    "NY.GDP.MKTP.KD.ZG": "gdp_growth_annual_percent",
    "NY.GDP.PCAP.CD": "gdp_per_capita_current_usd",
    "SL.UEM.TOTL.ZS": "unemployment_total_percent",
    "BX.TRF.PWKR.DT.GD.ZS": "remittances_percent_gdp",
    "BX.KLT.DINV.WD.GD.ZS": "fdi_percent_gdp",
}


def clean_worldbank_albania(df: pd.DataFrame) -> pd.DataFrame:
    selected = df[df["Indicator Code"].isin(WORLD_BANK_INDICATORS.keys())].copy()
    year_cols = [c for c in selected.columns if c.isdigit()]

    long_df = selected.melt(
        id_vars=["Country Name", "Country Code", "Indicator Name", "Indicator Code"],
        value_vars=year_cols,
        var_name="year",
        value_name="value",
    )

    long_df["year"] = long_df["year"].astype(int)
    long_df["value"] = pd.to_numeric(long_df["value"], errors="coerce")
    long_df["indicator_short_name"] = long_df["Indicator Code"].map(WORLD_BANK_INDICATORS)
    long_df = long_df.dropna(subset=["value"])
    return long_df
