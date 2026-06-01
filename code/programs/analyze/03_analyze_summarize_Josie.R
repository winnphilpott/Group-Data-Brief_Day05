#============================================================================
# PROJECT: Economic Growth and Environmental Indicators
# SCRIPT:  regress against gdp per cap and create summary stats
# AUTHOR:  Josie Fischman
# DATE:    June 1, 2026
# ============================================================================
# INPUT:
#   data/raw/wdi_clean.csv
#
# OUTPUT:
#   summary stats tables
#
# ============================================================================

# load libraries
library(tidyverse)
library(WDI)
library(xtable)

#setwd
setwd("/Users/jfischman/Library/CloudStorage/Dropbox/Josie/Github/Untitled/Group-Data-Brief_Day05")

# load inputs
df <- read.csv("data/processed/wdi_cleanjf.csv")

# calculate summary statistics
pm_sum <- df |> summarise(
  mean = mean(pm2.5, na.rm = TRUE),
  sd   = sd(pm2.5, na.rm = TRUE),
  min  = min(pm2.5, na.rm = TRUE),
  max  = max(pm2.5, na.rm = TRUE),
  num = sum(!is.na(pm2.5))
)

le_sum <- df |> summarise(
  mean = mean(life_exp, na.rm = TRUE),
  sd   = sd(life_exp, na.rm = TRUE),
  min  = min(life_exp, na.rm = TRUE),
  max  = max(life_exp, na.rm = TRUE),
  num = sum(!is.na(life_exp))
)

le_reg <- lm(data=df, log(gdp_per_cap)~life_exp)
pm_reg <- lm(data=df, log(gdp_per_cap)~pm2.5)

pm_le_reg <- lm(data=df, log(gdp_per_cap)~life_exp+pm2.5)


# save tables to results
write.csv(pm_sum, "output/statistics/pm25_summary.csv", row.names=FALSE)
write.csv(le_sum, "output/statistics/le_summary.csv", row.names=FALSE)

