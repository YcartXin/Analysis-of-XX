#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Tracy Yang
# Date: 23 January 2024
# Contact: ycart.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)

#### Download data ####
raw_toronto_cfsa <- 
  list_package_resources("persons-in-crisis-calls-for-service-attended") |> 
  filter(name == "Persons in Crisis - Calls for Service Attended.csv" ) |>
  get_resource()


#### Save data ####
write_csv(raw_toronto_cfsa, "inputs/data/raw_toronto_cfsa.csv") 

         
