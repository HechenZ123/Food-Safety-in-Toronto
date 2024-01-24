#### Workspace setup ####
install.packages("opendatatoronto")
install.packages("knitr")

library(opendatatoronto)
library(dplyr)

packages <- list_packages(limit = 12)
packages
#> # A tibble: 10 x 11
#>    title id    topics civic_issues publisher excerpt dataset_category
#>    <chr> <chr> <chr>  <chr>        <chr>     <chr>   <chr>           
#>  1 Cata… 473d… City … <NA>         Informat… Histor… Table           
#>  2 Lobb… 6a87… City … <NA>         Lobbyist… The Lo… Document        
#>  3 Addr… abed… Locat… Mobility     Informat… This d… Document        
#>  4 Prop… 1aca… Locat… Mobility     Informat… This d… Document        
#>  5 Buil… 108c… Devel… Affordable … Toronto … Provid… Document        
#>  6 Buil… 8219… Devel… <NA>         Toronto … Provid… Document        
#>  7 Muni… 5da2… City … Affordable … Municipa… This d… Document        
#>  8 Shor… fc41… Permi… Affordable … Municipa… This d… Table           
#>  9 Poll… 7bce… City … <NA>         City Cle… Polls … Table           
#> 10 Dail… 8a6e… City … Affordable … Shelter,… Daily … Table           
#> # … with 4 more variables: num_resources <int>, formats <chr>,
#> #   refresh_rate <chr>, last_refreshed <date>

#### Acquire ####
# get package
package <- show_package("ea1d6e57-87af-4e23-b722-6c1f5aa18a8d")
package

# get all resources for this package
resources <- list_package_resources("ea1d6e57-87af-4e23-b722-6c1f5aa18a8d")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
dinesafe <- filter(datastore_resources, row_number()==1) %>% get_resource()
dinesafe

write_csv(
  x = dinesafe,
  file = "dinesafe.csv"
)

head(dinesafe)