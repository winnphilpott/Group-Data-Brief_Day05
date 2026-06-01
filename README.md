# Group Data Brief — Day 05

## Overview

<!-- One paragraph describing the project, data source(s), and key question(s). -->

## How to run

1. Open the project in RStudio (or set your working directory to the project root).
2. Edit `global_paths.R` if you need to adjust any paths.
3. Run the full pipeline: `source("run.R")`
4. Or run a single module by sourcing its `*_run.R` file directly.

## Module order

| Order | Module | Description |
|-------|--------|-------------|
| 1 | `code/programs/download/` | Download raw data |
| 2 | `code/programs/clean/` | Clean and tidy data |
| 3 | `code/programs/analyze/` | Compute summary statistics and models |
| 4 | `code/programs/visualize/` | Produce figures and tables |

## Project structure

```
project_root/
├── code/
│   ├── logs/
│   └── programs/
│       ├── download/
│       ├── clean/
│       ├── analyze/
│       └── visualize/
├── data/
│   ├── raw/
│   └── processed/
├── output/
│   ├── figures/
│   ├── tables/
│   └── statistics/
├── paper/
├── run.R
├── global_paths.R
├── README.md
├── TODO.md
└── LICENSE.md
```

## Contributors

<!-- List group members here -->
