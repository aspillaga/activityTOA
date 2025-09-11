# activityTOA

**activityTOA** is an R package that implements the **Time-of-Arrival (TOA)-based method** 
for estimating animal activity from **single-receiver acoustic telemetry setups**.  

The package accompanies the paper:  

**Aspillaga, E. et al. (2025).** Inferring activity patterns of aquatic animals from single-receiver acoustic telemetry setups. *Methods in Ecology and Evolution*.

---

## Overview

This package provides tools and a guide to:  
- Extract and process TOA values from acoustic detection data.  
- Estimate **relative distances** and **step lengths** from transmitter-receiver time series.  
- Classify **behavioural states** (e.g., resting vs. active) using **Hidden Markov Models**.  
- Automate TOA extraction for multiple individuals and deployments.  

An example dataset is included to allow users to reproduce the workflow described in the manuscript and vignette.  

---

## Installation

Install **activityTOA** directly from GitHub with [`devtools`](https://cran.r-project.org/package=devtools):

```r
# Install activityTOA with vignette
devtools::install_github("aspillaga/activityTOA", build_vignettes = TRUE)

# Load the package
library(activityTOA)
```

## Citation

If you use this package, please cite the accompanying article:

If you use this package, please cite the accompanying article:  

> Aspillaga, E. et al. (2025). Inferring activity patterns of aquatic animals from single-receiver acoustic telemetry setups. *Methods in Ecology and Evolution.* Accepted.  


