#### Preamble ####
# Purpose: Get data on 2021 shelter usage and make table
# Author: Rohan Alexander
# Email: rohan.alexander@utoronto.ca
# Date: 1 July 2022
# Prerequisites: -

#### Workspace setup ####
install.packages("opendatatoronto")
install.packages("knitr")

library(knitr)
library(janitor)
library(tidyverse)
library(dplyr)
library(tidyr)

#### Simulate ####
set.seed(302)

# Calculating the mean infractions per type
# For demonstration, let's say we have these means:
mean_infractions <- data.frame(
  EstablishmentType = c("Food Depot", "Food Take Out", "Restaurant"),
  Lambda = c(2, 3, 5)  # Example average infractions for each type
)

# Create a sequence of dates for a year
dates <- seq(as.Date("2024-01-01"), by = "day", length.out = 365)

# Simulate data
simulated_infraction_data <- expand.grid(date = dates, EstablishmentType = mean_infractions$EstablishmentType) %>%
  mutate(number_infractions = rpois(n = n(), lambda = mean_infractions$Lambda[match(EstablishmentType, mean_infractions$EstablishmentType)]))

# View the first few rows of the simulated data
head(simulated_infraction_data)
