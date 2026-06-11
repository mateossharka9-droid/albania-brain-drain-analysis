from extract import load_worldbank_albania
from transform import clean_worldbank_albania
from load import save_processed_csv


def main():
    worldbank_raw = load_worldbank_albania()
    worldbank_clean = clean_worldbank_albania(worldbank_raw)
    save_processed_csv(worldbank_clean, "worldbank_albania_clean.csv")


if __name__ == "__main__":
    main()
