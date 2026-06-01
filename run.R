source("global_paths.R")

# ── Run full pipeline ─────────────────────────────────────────────────────────
# Execute modules in order. Comment out any module you want to skip.

source(here::here("code", "programs", "download",  "download_run.R"))
source(here::here("code", "programs", "clean",     "clean_run.R"))
source(here::here("code", "programs", "analyze",   "analyze_run.R"))
source(here::here("code", "programs", "visualize", "visualize_run.R"))
