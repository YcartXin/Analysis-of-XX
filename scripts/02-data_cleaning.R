#### Preamble ####
# Purpose: Cleans the raw person in crisis calls for service attended data 
# recorded and published by the Toronto Police Service on Open Data Toronto.
# Author: Tracy Yang
# Date: 23 January 2024
# Contact: ycart.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R

#### Workspace setup ####
library(tidyverse)
library(janitor)


#### Clean data ####
raw <- read_csv("inputs/data/raw_toronto_cfsa.csv")

## Trimming data ##
clean_toronto_cfsa <- raw |> clean_names() |> 
  select(event_year, event_month, event_type) |> 
  filter(event_year > 2018 & event_year < 2022)

## Adding Variables ##
# Need indicator variable to specify lock_down months
clean_toronto_cfsa <- clean_toronto_cfsa |>
  mutate(lock_down = ifelse((event_year == 2020 & (
    event_month != "January" & event_month != "February") | (
      event_year == 2021 & (
        event_month == "January" | event_month == "February"))), 1, 0))


#### Save data ####
write_csv(clean_toronto_cfsa, "outputs/data/toronto_cfsa")
