# Clean WDI raw data — countries only
# Input:  data/raw/wdi_raw.csv
# Output: data/processed/wdi_cleanjy.csv

library(dplyr)

df <- read.csv("~/Group-Data-Brief_Day05/data/raw/wdi_raw.csv", stringsAsFactors = FALSE)

# ── 1. Remove all non-country rows ───────────────────────────────────────────
# WB aggregate iso3c codes (regional groups, income tiers, lending groups,
# demographic dividend stages, etc.)
wb_aggregate_iso3c <- c(
  "AFE", "AFW",                          # Africa sub-regions
  "ARB",                                 # Arab World
  "CEB",                                 # Central Europe and the Baltics
  "CSS",                                 # Caribbean small states
  "EAP", "EAS",                          # East Asia & Pacific
  "EAR",                                 # Early-demographic dividend
  "ECA", "ECS",                          # Europe & Central Asia
  "EMU",                                 # Euro area
  "EUU",                                 # European Union
  "FCS",                                 # Fragile and conflict affected
  "HIC",                                 # High income
  "HPC",                                 # Heavily indebted poor countries
  "IBD", "IBT", "IDB", "IDA", "IDX",    # IBRD / IDA groups
  "LAC", "LCN", "TLA",                  # Latin America & Caribbean
  "LDC",                                 # Least developed countries
  "LMY",                                 # Low & middle income
  "LTE",                                 # Late-demographic dividend
  "MEA",                                 # Middle East & North Africa
  "MIC",                                 # Middle income
  "MNA", "TMN",                          # Middle East subgroups
  "NAC",                                 # North America
  "OED",                                 # OECD members
  "OSS",                                 # Other small states
  "PRE",                                 # Pre-demographic dividend
  "PSS",                                 # Pacific island small states
  "PST",                                 # Post-demographic dividend
  "SAS",                                 # South Asia
  "SSA", "SSF", "TSS",                  # Sub-Saharan Africa
  "SST",                                 # Small states
  "TEA", "TEC", "TSA",                  # IDA & IBRD sub-regions
  "WLD"                                  # World
)

# Territories and non-UN-member entities
non_country_iso3c <- c(
  "ASM",  # American Samoa
  "ABW",  # Aruba
  "BMU",  # Bermuda
  "VGB",  # British Virgin Islands
  "CYM",  # Cayman Islands
  "CHI",  # Channel Islands
  "CUW",  # Curacao
  "FRO",  # Faroe Islands
  "PYF",  # French Polynesia
  "GIB",  # Gibraltar
  "GRL",  # Greenland
  "GUM",  # Guam
  "HKG",  # Hong Kong SAR, China
  "IMN",  # Isle of Man
  "XKX",  # Kosovo (non-standard code, not a UN member)
  "MAC",  # Macao SAR, China
  "NCL",  # New Caledonia
  "MNP",  # Northern Mariana Islands
  "PRI",  # Puerto Rico
  "SXM",  # Sint Maarten (Dutch part)
  "MAF",  # St. Martin (French part)
  "TCA",  # Turks and Caicos Islands
  "VIR",  # Virgin Islands (U.S.)
  "PSE"   # West Bank and Gaza
)

# Also catch any remaining aggregate rows where iso3c is blank
blank_iso_aggregates <- c(
  "High income", "Low income", "Lower middle income",
  "Upper middle income", "Middle income", "Low & middle income",
  "World"
)

df <- df %>%
  filter(
    !(iso3c %in% wb_aggregate_iso3c),
    !(iso3c %in% non_country_iso3c),
    !(country %in% blank_iso_aggregates)
  )

# ── 2. Rename indicator columns to human-readable names ───────────────────────
df <- df %>%
  rename(
    gdp_per_capita           = NY.GDP.PCAP.CD,
    elec_access_pct          = EG.ELC.ACCS.ZS,
    renewable_elec_pct       = EG.ELC.RNWX.ZS,
    life_expectancy          = SP.DYN.LE00.IN,
    forest_area_pct          = AG.LND.FRST.ZS,
    urban_pop_pct            = SP.URB.TOTL.IN.ZS,
    pm25_concentration       = EN.ATM.PM25.MC.M3,
    co2_intensity_gdp        = EN.GHG.CO2.RT.GDP.PP.KD,
    maternal_mortality_rate  = SH.STA.MMRT,
    energy_use_per_capita    = EG.USE.PCAP.KG.OE
  )

# ── 3. Drop rows with no data across all indicators ───────────────────────────
indicator_cols <- c(
  "gdp_per_capita", "elec_access_pct", "renewable_elec_pct",
  "life_expectancy", "forest_area_pct", "urban_pop_pct",
  "pm25_concentration", "co2_intensity_gdp",
  "maternal_mortality_rate", "energy_use_per_capita"
)

df <- df %>%
  filter(rowSums(!is.na(select(., all_of(indicator_cols)))) > 0)

# ── 4. Fix Namibia's missing iso2c ────────────────────────────────────────────
df <- df %>%
  mutate(iso2c = ifelse(iso3c == "NAM" & is.na(iso2c), "NA", iso2c))

# ── 5. Write output ───────────────────────────────────────────────────────────
write.csv(df, "~/Group-Data-Brief_Day05/data/processed/wdi_cleanjy.csv", row.names = FALSE)

# ── Summary ───────────────────────────────────────────────────────────────────
cat("Rows:     ", nrow(df), "\n")
cat("Countries:", length(unique(df$country)), "\n")
cat("Years:    ", paste(range(df$year), collapse = "–"), "\n")
cat("NA counts per indicator:\n")
print(colSums(is.na(df[indicator_cols])))
