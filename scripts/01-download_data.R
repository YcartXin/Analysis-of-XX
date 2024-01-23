#### Preamble ####
# Purpose: Downloads the Persons in Crisis Calls for Service Attended data from
# Open Data Toronto and saves in inputs. Data recorded and published by the
# Toronto Police Service.
# Author: Tracy Yang
# Date: 23 January 2024
# Contact: ycart.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Data saved from website: 
# https://open.toronto.ca/dataset/persons-in-crisis-calls-for-service-attended/


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
         
