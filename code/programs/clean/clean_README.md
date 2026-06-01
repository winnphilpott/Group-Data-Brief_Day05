# Module: clean

**Purpose:** Transform raw data into a clean, analysis-ready dataset.

**Run order:**

| Order | Script | Description |
|-------|--------|-------------|
| 1 | `01_clean.R` | Clean and tidy raw data |
| 2 | `01_cleanjf.R` | Rename WDI columns to readable names, filter to sovereign countries only, save to `data/processed/wdi_cleanjf.csv` |

**To run this module only:** `source("code/programs/clean/clean_run.R")`
