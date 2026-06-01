# visualize_run.R
# ─────────────────────────────────────────────────────────────────────────────
# Master runner for the "visualize" module.
# Run this file (or call it from run.R) to execute all figure scripts
# in the correct order.
# ─────────────────────────────────────────────────────────────────────────────

source(here::here("global_paths.R"))

# Step 1: Produce all figures
source(here::here("code", "programs", "visualize", "01_figures.R"))
