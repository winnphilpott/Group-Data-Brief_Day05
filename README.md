# Group Data Brief — Day 05

## Overview

Practicing our collaboration skills on GitHub to merge six data/analysis repositories into one, write a joint
data brief grounded in shared analysis, and document it for replication. 

Deliverables (as a group):
- A single joint data repository containing everyone’s harmonized indicators, code,
and outputs: send the link to the public repo to seiter@virginia.edu.
- A joint data brief reporting headline regression-based summary statistics for each
indicator (run a regression or two and interpret!).
- Replication documentation (one README) sufficient for someone outside the
group to reproduce the brief.

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

Grace Carver, Josie Fischman, Ali Hunter, Winn Philpott, Lucie Talikoff, Jason Ye
