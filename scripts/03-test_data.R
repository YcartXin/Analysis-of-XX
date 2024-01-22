#### Preamble ####
# Purpose: Tests the raw data of Person in Crisis (PIC) calls for service 
# attended (CFSA) that includes three event types.
# Author: Tracy Yang
# Date: 23th January 2024
# Contact: ycart.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R


#### Workspace setup ####
library(tidyverse)

#### Test data ####
raw_toronto_cfsa$EVENT_TYPE |> unique() == c("Suicide-related", "Person in Crisis", "Overdose")
raw_toronto_cfsa$EVENT_TYPE |> unique() |> length() == 3
raw_toronto_cfsa$EVENT_MONTH |> unique() |> length() == 12
raw_toronto_cfsa$EVENT_MONTH |> class() == "character"
raw_toronto_cfsa$EVENT_YEAR |> is.integer()

