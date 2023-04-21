#### Preamble ####
# Purpose: Simulate data on 2 ecommerce companies' products on 2 separate dates
# Author: Jayden Jung
# Email: jayden.jung@mail.utoronto.ca
# Date: Apr 21 2023
# Prerequisites: None

### Set Up ###

library(readr)
library(tidyverse)

#### Simulate ####
set.seed(309)

# Random string generator for product names https://stackoverflow.com/questions/42734547/generating-random-strings
randostring <- function(n = 5000) {
  a <- do.call(paste0, replicate(5, sample(LETTERS, n, TRUE), FALSE))
  paste0(a, sprintf("%04d", sample(9999, n, TRUE)), sample(LETTERS, n, TRUE))
}

# "Before" state of products of both stores
store1date1 <- 
  tibble(
    products = randostring(20))

store2date1 <- 
  tibble(
    products = randostring(24))

# "After" state of products of both stores
store1date2 <- 
  store1date1 %>% 
  add_row(products = randostring(1))
  
# "Fast fashion" company shows many products being retired/replaced and more products added
store2date2 <-
  store2date1[-c(1,2,4,6,9,13,19,20),] %>% 
  add_row(products = randostring(12))

# See how simulated data looks
store1date1
store1date2

store2date1
store2date2

# Download simulated data
write_csv(store1date1, "inputs/simulation/store1date1.csv")
write_csv(store1date2, "inputs/simulation/store1date2.csv")

write_csv(store2date1, "inputs/simulation/store2date1.csv")
write_csv(store2date2, "inputs/simulation/store2date2.csv")
