#### Preamble ####
# Purpose: Simulates 2019 data of Person in Crisis (PIC) calls for service 
# attended (CFSA) that includes event types of Suicide-related, Person in 
# Crisis, and Overdose.
# Author: Tracy yang
# Date: 23 January 2024
# Contact: ycart.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# The website states that there are six event types. However, the data 
# categorizes three. The simulation will include three categories.


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(11)

year <- c(2019, 2020, 2021)
month <- c("Janaury", "February", "March", "April", "May", "June", "July", 
           "August", "September", "October", "November", "December")
event <- c("Suicide-related", "Person in Crisis", "Overdose")

simulated_toronto <- tibble(year = rep(year, each = 4800), 
            month = rep(month, each = 400, times = 3), 
            event_type = sample(event, 14400, replace = TRUE))

#### Testing Simulated Data ####
simulated_toronto$year |> class() == "numeric"
simulated_toronto$month |> class() == "character"
simulated_toronto$month |> unique() |> length() == 12
simulated_toronto$event_type |> unique() |> length() == 3

