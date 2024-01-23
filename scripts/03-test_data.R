#### Preamble ####
# Purpose: Tests the raw data of Person in Crisis (PIC) calls for service 
# attended (CFSA) that includes three event types.
# Author: Tracy Yang
# Date: 23th January 2024
# Contact: ycart.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R; 02-data_cleaning.R


#### Workspace setup ####
library(tidyverse)

#### Test data ####
## Test event_type##
toronto_cfsa$event_type |> unique() == c("Suicide-related")
toronto_cfsa$event_type |> unique() |> length() == 1

## Test event_month ##
toronto_cfsa$event_month |> unique() |> length() == 12
toronto_cfsa$event_month |> class() == "integer"

## Test event_year ##
toronto_cfsa$event_year |> is.numeric()
toronto_cfsa$event_year |> min() == 2019
toronto_cfsa$event_year |> max() == 2021

## Test occurrence_created ##
toronto_cfsa$occurrence_created |> is.character()
toronto_cfsa$occurrence_created |> unique() == c("No", "Yes")

## Test lock_down ##
toronto_cfsa$lock_down |> unique() == c(0, 1)

## Test date ##
toronto_cfsa$date |> class() == "Date"

