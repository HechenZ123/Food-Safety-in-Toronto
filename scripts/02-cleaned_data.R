#### Workspace setup ####
install.packages("opendatatoronto")
install.packages("knitr")

library(knitr)
library(janitor)
library(opendatatoronto)
library(tidyverse)

dinesafe <- read_csv(here::here("input/data/dinesafe.csv"))
clean_data <-
  clean_names(dinesafe) |>
  mutate(inspection_date = ymd(inspection_date)) |> 
  select(establishment_name, establishment_type, establishment_address, 
         inspection_date, establishment_status, min_inspections_per_year,
         severity, action)
dinesafe_clean <- na.omit(clean_data)
head(dinesafe_clean)

write_csv(
  x = dinesafe_clean,
  file = "cleaned_dinesafe.csv"
)
