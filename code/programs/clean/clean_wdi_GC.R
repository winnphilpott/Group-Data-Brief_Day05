# ============================================================================
# PROJECT: Economic Growth and Environmental Indicators
# SCRIPT:  Clean and tidy the raw data
# AUTHOR:  Grace Carver
# DATE:    May 28, 2026
# ============================================================================
#
# INPUT:
#   data/raw/wdi_raw.csv
#
# OUTPUT:
#   data/processed/clean_wdi_GC.csv
#
# ============================================================================

library(tidyverse)
library(data.table)
library(here)

# Read raw data;

WorldBank <- read.csv(here("data", "raw", "wdi_raw.csv"))

# Remove aggregate country codes, filter down to countries;

exclude_codes <- c("EAR", "EMU", "HPC", "LDC", "LTE", "NAC", "OED", "PRE",
                   "PST","ABW", "ASM", "BMU", "CHI", "CUW", "CYM", "FRO",
                   "GIB", "GRL", "GUM", "HKG", "IMN", "MAC", "MAF", "MNP",
                   "NCL", "PRI", "PYF", "SXM", "TCA", "VGB", "VIR","AFE",
                   "AFW", "ARB", "CEB", "CSS", "EAP", "EAS", "TEA", "ECA",
                   "ECS", "TEC", "EUU", "IBD", "IBT", "IDB", "IDX", "IDA",
                   "LAC", "LCN", "TLA", "LMY", "LIC", "LMC", "MIC", "MNA",
                   "OSS", "SAS", "SSA", "SSF", "SST", "TSA", "TSS", "UMC",
                   "WLD","FCS", "PSS")

WorldBank <- WorldBank %>%
  filter(!(iso3c %in% exclude_codes)) %>%
  filter(iso3c != "")

# Rename columns for readability;

setnames(WorldBank,
         old = c(
           "iso3c",
           "country",
           "year",
           "NY.GDP.PCAP.CD",
           "EG.ELC.ACCS.ZS",
           "EG.ELC.RNWX.ZS",
           "SP.DYN.LE00.IN",
           "AG.LND.FRST.ZS",
           "SP.URB.TOTL.IN.ZS",
           "EN.ATM.PM25.MC.M3",
           "EN.GHG.CO2.RT.GDP.PP.KD",
           "SH.STA.MMRT",
           "EG.USE.PCAP.KG.OE"
         ),
         new = c(
           "CountryCode",
           "Country",
           "Year",
           "GdpPerCapita",
           "AccessToElec",
           "ShareRenewableElec",
           "LifeExpectancy",
           "ForestAreaPct",
           "UrbanPopPct",
           "PM25Exposure",
           "CO2IntensityGDP",
           "MaternalMortality",
           "EnergyUsePerCapita"
         )
)

# Save processed data to CSV;

write.csv(WorldBank, here("data", "processed", "clean_wdi_GC.csv"),
          row.names = FALSE)
