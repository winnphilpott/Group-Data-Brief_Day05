# 02_analysis.R
# ─────────────────────────────────────────────────────────────────────────────
# PURPOSE: Run the main analysis (regressions, correlations, group comparisons,
#          etc.) and save results to results/statistics/ or analysis/.
#
# INPUTS:  data/processed/data_clean.rds
# OUTPUTS: results/statistics/model_results.csv  (or .rds for complex objects)
# ─────────────────────────────────────────────────────────────────────────────

library(here)
library(dplyr)

source(here("global_paths.R"))

# ── Step 1: Load cleaned data ─────────────────────────────────────────────────
# clean <- readRDS(file.path(PATH_DATA_PROCESSED, "data_clean.rds"))

# ── Step 2: Run analysis ───────────────────────────────────────────────────────
# Example: OLS regression with lm()
#   lm(outcome ~ predictor1 + predictor2, data = clean)
# The formula "outcome ~ predictor1 + predictor2" means:
#   "regress outcome on predictor1 and predictor2"

# model <- lm(outcome_var ~ gdp_per_capita + region, data = clean)
# summary(model)   # prints coefficients, R², p-values to the console

# ── Step 3: Save results ───────────────────────────────────────────────────────
# broom::tidy() converts model output into a clean data frame.
# results <- broom::tidy(model)
# write.csv(results, file = file.path(PATH_STATISTICS, "model_results.csv"),
#           row.names = FALSE)

message("02_analysis.R complete.")
