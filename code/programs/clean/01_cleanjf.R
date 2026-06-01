# ============================================================================
# PROJECT: Economic Growth and Environmental Indicators
# SCRIPT:  clean wdi_raw.csv
# AUTHOR:  Josie Fischman
# DATE:    June 1, 2026
# ============================================================================
# INPUT:
#   data/raw/wdi_raw.csv
#
# OUTPUT:
#   data/processed/wdi_clean.csv
#
# ============================================================================

library(here)
library(dplyr)
library(readr)
library(countrycode)

source(here("global_paths.R"))

# ── Step 1: Load raw data ─────────────────────────────────────────────────────

raw <- read_csv(file.path(PATH_DATA_RAW, "wdi_raw.csv"), show_col_types = FALSE)

# ── Step 2: Rename columns ────────────────────────────────────────────────────

clean <- raw |>
  rename(
    gdp_per_cap        = NY.GDP.PCAP.CD,
    elec_access        = EG.ELC.ACCS.ZS,
    renewable_elec     = EG.ELC.RNWX.ZS,
    life_exp           = SP.DYN.LE00.IN,
    forest_area        = AG.LND.FRST.ZS,
    urban_pop          = SP.URB.TOTL.IN.ZS,
    pm2.5              = EN.ATM.PM25.MC.M3,
    co2_intensity      = EN.GHG.CO2.RT.GDP.PP.KD,
    maternal_mortality = SH.STA.MMRT,
    energy_use         = EG.USE.PCAP.KG.OE
  )

# ── Step 3: Filter to countries only ─────────────────────────────────────────
# WDI includes regional and income-group aggregates (e.g. "World", "High income").
# countrycode() returns NA for any iso3c that is not a sovereign country.

clean <- clean |>
  filter(!is.na(countrycode(iso3c, origin = "iso3c", destination = "country.name")))

# ── Step 4: Save cleaned data ─────────────────────────────────────────────────

write_csv(clean, file.path(PATH_DATA_PROCESSED, "wdi_cleanjf.csv"))

message("01_cleanjf.R complete: ", nrow(clean), " rows written to wdi_clean.csv")
