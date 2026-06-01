# analyze_run.R
# ─────────────────────────────────────────────────────────────────────────────
# Master runner for the "analyze" module.
# Run this file (or call it from run.R) to execute all analysis scripts
# in the correct order.
# ─────────────────────────────────────────────────────────────────────────────

source(here::here("global_paths.R"))

# Step 1: Compute summary statistics
source(here::here("code", "programs", "analyze", "01_summary_stats.R"))

# Step 2: Run main analysis / models
source(here::here("code", "programs", "analyze", "02_analysis.R"))
