# Next Steps

## Step 1: Open the project

Open the folder `albania-brain-drain-analysis` in VS Code.

## Step 2: Create a virtual environment

```bash
python -m venv .venv
```

Activate it:

```bash
.venv\Scripts\activate
```

## Step 3: Install libraries

```bash
pip install -r requirements.txt
```

## Step 4: Open Jupyter Notebook

```bash
jupyter notebook
```

Then open:

```text
notebooks/01_data_understanding.ipynb
```

## Step 5: Start Part 1 analysis

In the first notebook, inspect:

- file names
- columns
- number of rows
- year coverage
- missing values
- important indicators

## Step 6: Run the first ETL test

From the project root:

```bash
cd src/etl
python run_etl.py
```

This should create:

```text
data/processed/worldbank_albania_clean.csv
```
