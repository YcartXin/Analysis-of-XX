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
toronto_cfsa <- raw |> clean_names() |> 
  select(event_year, event_month, event_type, occurrence_created) |> 
  filter(event_year > 2018 & event_year < 2022) |>
  filter(event_type == "Suicide-related")

# Making date variable to differentiate months between different years
toronto_cfsa$event_month <- match(toronto_cfsa$event_month, month.name)
toronto_cfsa$date <- make_date(toronto_cfsa$event_year, toronto_cfsa$event_month)

## Adding Variables ##
# Need indicator variable to specify lock_down affected months
toronto_cfsa <- toronto_cfsa |>
  mutate(lock_down = ifelse(ymd(date) >= ymd(20200401) & ymd(date) <= ymd(20210501), 1, 0))


#### Save data ####
write_csv(toronto_cfsa, "outputs/data/toronto_cfsa.csv")
