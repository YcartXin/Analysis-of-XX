#### Preamble ####
# Purpose: Simulates 2019 data of Person in Crisis (PIC) calls for service 
# attended (CFSA) that includes event types of Attempted Suicide, Person In 
# Crisis, Elopee, Jumper, Overdose, and Threaten Suicide.
# Author: Tracy yang
# Date: 23 January 2024
# Contact: ycart.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(11)

year <- c(2018, 2019, 2020)
month <- c("Janaury", "February", "March", "April", "May", "June", "July", 
           "August", "September", "October", "November", "December")
event <- c("Attempted Suicide", "Person In Crisis", "Elopee", "Jumper", 
           "Overdose", "Threaten Suicide")

simulated_toronto <- tibble(year = rep(year, each = 4800), 
            month = rep(month, each = 400, times = 3), 
            event_type = sample(event, 14400, replace = TRUE))

#### Testing Simulated Data ####
simulated_toronto$year |> class() == "numeric"
simulated_toronto$month |> class() == "character"
simulated_toronto$month |> unique() |> length() == 12
simulated_toronto$event_type |> unique() |> length() == 6

