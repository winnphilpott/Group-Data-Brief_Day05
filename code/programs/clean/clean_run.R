# clean_run.R
# ─────────────────────────────────────────────────────────────────────────────
# Master runner for the "clean" module.
# Run this file (or call it from run.R) to execute all cleaning scripts
# in the correct order.
# ─────────────────────────────────────────────────────────────────────────────

source(here::here("global_paths.R"))

# Step 1: Clean and tidy the raw data
source(here::here("code", "programs", "clean", "01_clean.R"))
