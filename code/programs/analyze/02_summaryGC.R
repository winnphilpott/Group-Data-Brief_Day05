# ============================================================================
# PROJECT: Economic Growth and Environmental Indicators
# SCRIPT:  Summary statistics
# AUTHOR:  Grace Carver
# DATE:    May 28, 2026
# ============================================================================
#
# INPUT:
#   data/processed/clean_wdi_GC.csv
#
# OUTPUT:
#   output/statistics/summary_stats_GC.csv
#
# ============================================================================

library(tidyverse)
library(here)

# Read cleaned data;

wdi <- read.csv(here("data", "processed", "clean_wdi_GC.csv"))

# Compute summary statistics for numeric variables;

summary_stats <- wdi %>%
  select(GdpPerCapita, AccessToElec, ShareRenewableElec, LifeExpectancy,
         ForestAreaPct, UrbanPopPct, PM25Exposure, CO2IntensityGDP,
         MaternalMortality, EnergyUsePerCapita) %>%
  pivot_longer(everything(), names_to = "Variable", values_to = "Value") %>%
  group_by(Variable) %>%
  summarise(
    N        = sum(!is.na(Value)),
    Mean     = mean(Value, na.rm = TRUE),
    SD       = sd(Value, na.rm = TRUE),
    Min      = min(Value, na.rm = TRUE),
    P25      = quantile(Value, 0.25, na.rm = TRUE),
    Median   = median(Value, na.rm = TRUE),
    P75      = quantile(Value, 0.75, na.rm = TRUE),
    Max      = max(Value, na.rm = TRUE),
    .groups  = "drop"
  )

# Save to CSV;

write.csv(summary_stats, here("output", "statistics", "summary_stats_GC.csv"),
          row.names = FALSE)
