# 01_clean.R
# ─────────────────────────────────────────────────────────────────────────────
# PURPOSE: Load the raw data, clean it, and save a processed version.
#
# "Cleaning" typically means:
#   - Renaming columns to be readable
#   - Filtering to the rows/years/countries you need
#   - Handling missing values (NA)
#   - Converting variables to the right type (e.g., numeric, factor)
#
# INPUTS:  data/clean/[raw file saved by 01_download.R]
# OUTPUTS: data/processed/[filename]_clean.rds
# ─────────────────────────────────────────────────────────────────────────────

# Load required packages
# - here:    file paths relative to project root
# - dplyr:   data manipulation (filter, select, rename, mutate, etc.)
# - tidyr:   reshaping data (pivot_longer, pivot_wider, drop_na, etc.)
library(here)
library(dplyr)
library(tidyr)

source(here("global_paths.R"))

# ── Step 1: Load raw data ─────────────────────────────────────────────────────
# readRDS() reads the .rds file saved by 01_download.R
# raw <- readRDS(file.path(PATH_DATA_CLEAN, "raw_data.rds"))

# ── Step 2: Rename columns ────────────────────────────────────────────────────
# rename() changes column names to something more readable.
# Syntax: rename(new_name = old_name)
# clean <- raw |>
#   rename(
#     country     = country_code,
#     year        = yr,
#     outcome_var = SH.STA.MMRT
#   )

# ── Step 3: Filter to relevant rows ───────────────────────────────────────────
# filter() keeps only rows that meet a condition.
# clean <- clean |>
#   filter(year == 2023, !is.na(outcome_var))

# ── Step 4: Handle missing values ─────────────────────────────────────────────
# drop_na() removes rows where specified columns are missing.
# clean <- clean |>
#   drop_na(outcome_var, gdp_per_capita)

# ── Step 5: Save cleaned data ─────────────────────────────────────────────────
# saveRDS(clean, file = file.path(PATH_DATA_PROCESSED, "data_clean.rds"))

message("01_clean.R complete.")
