# download_run.R
# ─────────────────────────────────────────────────────────────────────────────
# Master runner for the "download" module.
# Run this file (or call it from run.R) to execute all download scripts
# in the correct order.
# ─────────────────────────────────────────────────────────────────────────────

# Load project-wide paths (defined in global_paths.R at the project root)
source(here::here("global_paths.R"))

# Step 1: Download raw data
source(here::here("code", "programs", "download", "01_download.R"))
