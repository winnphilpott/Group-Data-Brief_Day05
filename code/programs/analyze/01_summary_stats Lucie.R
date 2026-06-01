# 01_summary_stats.R
# ─────────────────────────────────────────────────────────────────────────────
# PURPOSE: Compute summary statistics and save them to results/statistics/.
#
# Summary statistics describe the basic features of the data:
# means, medians, standard deviations, min/max, counts, etc.
# These often appear in Table 1 of a data brief or paper.
#
# INPUTS:  data/processed/data_clean.rds
# OUTPUTS: results/statistics/summary_stats.csv
# ─────────────────────────────────────────────────────────────────────────────

library(here)
library(dplyr)

source(here("global_paths.R"))

# ── Step 1: Load the cleaned data ─────────────────────────────────────────────
# clean <- readRDS(file.path(PATH_DATA_PROCESSED, "data_clean.rds"))

# ── Step 2: Compute summary statistics ────────────────────────────────────────
# summarise() collapses many rows into a single summary row.
# na.rm = TRUE tells R to ignore missing values when computing each statistic.
# stats <- clean |>
#   summarise(
#     n           = n(),                          # number of observations
#     mean_outcome = mean(outcome_var, na.rm = TRUE),
#     sd_outcome   = sd(outcome_var,   na.rm = TRUE),
#     min_outcome  = min(outcome_var,  na.rm = TRUE),
#     max_outcome  = max(outcome_var,  na.rm = TRUE)
#   )

# ── Step 3: Save results ───────────────────────────────────────────────────────
# write.csv() saves as a spreadsheet-readable file.
# row.names = FALSE prevents R from adding a column of row numbers.
# write.csv(stats, file = file.path(PATH_STATISTICS, "summary_stats.csv"),
#           row.names = FALSE)

message("01_summary_stats.R complete.")
