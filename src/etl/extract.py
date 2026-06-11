from pathlib import Path
import pandas as pd

ROOT_DIR = Path(__file__).resolve().parents[2]
RAW_DIR = ROOT_DIR / "data" / "raw"


def load_worldbank_albania() -> pd.DataFrame:
    path = RAW_DIR / "worldbank" / "API_ALB_DS2_en_csv_v2_3304.csv"
    return pd.read_csv(path, skiprows=4)


def load_population_estimates() -> pd.DataFrame:
    path = RAW_DIR / "population_estimates" / "Population-EstimatesCSV.csv"
    return pd.read_csv(path)


def load_eurostat_gzip(filename: str) -> pd.DataFrame:
    path = RAW_DIR / "eurostat" / filename
    return pd.read_csv(path, compression="gzip")
