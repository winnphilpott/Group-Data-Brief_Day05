source("global_paths.R")

# ── Run full pipeline ─────────────────────────────────────────────────────────
# Execute modules in order. Comment out any module you want to skip.

source(here::here("code", "programs", "download",  "01_download.R"))
source(here::here("code", "programs", "clean",     "01_clean.R"))
source(here::here("code", "programs", "analyze",   "analyze_run.R"))
source(here::here("code", "programs", "visualize", "01_figures.R"))
