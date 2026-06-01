# 01_figures.R
# ─────────────────────────────────────────────────────────────────────────────
# PURPOSE: Produce all figures for the data brief and save them to
#          results/figures/.
#
# INPUTS:  data/processed/data_clean.rds
# OUTPUTS: results/figures/fig_*.png  (one file per figure)
# ─────────────────────────────────────────────────────────────────────────────

# Load required packages
# - ggplot2: the standard R package for making publication-quality charts.
#            Every plot is built in layers: data → axes → geometry → labels.
# - here:    file paths relative to project root
library(here)
library(ggplot2)

source(here("global_paths.R"))

# ── Step 1: Load cleaned data ─────────────────────────────────────────────────
# clean <- readRDS(file.path(PATH_DATA_PROCESSED, "data_clean.rds"))

# ── Step 2: Figure 1 — [describe your figure here] ───────────────────────────
# ggplot() sets up the plot with your data and axis mappings (aes = "aesthetics").
# geom_point() adds a layer of dots (use geom_bar(), geom_line(), etc. for other
# chart types).
# labs() sets the title and axis labels.
# theme_minimal() applies a clean, publication-friendly style.

# fig1 <- ggplot(clean, aes(x = gdp_per_capita, y = outcome_var)) +
#   geom_point(color = "#232D4B", alpha = 0.6) +   # alpha controls transparency
#   labs(
#     title = "Figure 1: [Title]",
#     x     = "GDP per Capita (USD)",
#     y     = "Outcome Variable"
#   ) +
#   theme_minimal()

# ── Step 3: Save figures ───────────────────────────────────────────────────────
# ggsave() exports the most recently created ggplot to a file.
# width and height are in inches; dpi = 300 gives print-quality resolution.

# ggsave(
#   filename = file.path(PATH_FIGURES, "fig1_[description].png"),
#   plot     = fig1,
#   width    = 7,
#   height   = 5,
#   dpi      = 300
# )

message("01_figures.R complete.")
