# 01_download.R
# ─────────────────────────────────────────────────────────────────────────────
# PURPOSE: Download raw data from [source] and save it to data/clean/.
#
# INPUTS:  None (pulls directly from the internet or a local path)
# OUTPUTS: data/clean/[filename].csv  (or .rds, .xlsx, etc.)
#
# HOW TO RUN: Source this file directly, or run via download_run.R
# ─────────────────────────────────────────────────────────────────────────────

# Load required packages
# - here: builds file paths relative to the project root (so paths work on
#         any computer, regardless of where the project is saved)
library(here)

# Load project-wide path variables (e.g., PATH_DATA_CLEAN)
source(here("global_paths.R"))

# ── Step 1: Download data ─────────────────────────────────────────────────────
# TODO: Replace the lines below with your actual download code.
# Common options:
#   - read_csv("https://...")           to read a CSV directly from a URL
#   - WDI::WDI(indicator = "...", ...)  to pull World Bank data
#   - download.file(url, destfile)      to save a file to disk first

# Example placeholder:
# raw_data <- read.csv("https://example.com/data.csv")

# ── Step 2: Save raw data to disk ─────────────────────────────────────────────
# We save as .rds (R's native format) to preserve data types exactly.
# Use write.csv() instead if you want a file others can open in Excel.

# Example placeholder:
# saveRDS(raw_data, file = file.path(PATH_DATA_CLEAN, "raw_data.rds"))

message("01_download.R complete.")
