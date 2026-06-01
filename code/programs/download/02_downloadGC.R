# ============================================================================
# PROJECT: Economic Growth and Environmental Indicators
# SCRIPT:  Fetch country-level data from World Bank API
# AUTHOR:  Grace Carver
# DATE:    May 28, 2026
# ============================================================================
# INPUT:
#   World Bank API (https://api.worldbank.org/v2)
#
# OUTPUT:
#   data/raw/wdi_raw.csv
#
# ============================================================================

library(WDI)
library(tidyverse)
library(here)

# Fetch data from World Bank API;

WorldBank <- WDI(indicator = c(
  "NY.GDP.PCAP.CD",
  "EG.ELC.ACCS.ZS",
  "EG.ELC.RNWX.ZS",
  "SP.DYN.LE00.IN",
  "AG.LND.FRST.ZS",
  "SP.URB.TOTL.IN.ZS",
  "EN.ATM.PM25.MC.M3",
  "EN.GHG.CO2.RT.GDP.PP.KD",
  "SH.STA.MMRT",
  "EG.USE.PCAP.KG.OE"),
  start = 1990,
  end = 2023)

write.csv(WorldBank, here("data", "raw", "wdi_raw.csv"), row.names = FALSE)
