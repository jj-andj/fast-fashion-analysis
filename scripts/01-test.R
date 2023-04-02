#### Preamble ####
# Purpose: Test simulated data of ecommerce site products
# Author: Jayden Jung
# Email: jayden.jung@mail.utoronto.ca
# Date: Apr 21 2023
# Prerequisites: Have run 00-simulate.R and have the relevant csvs saved

# Read in simulated data
store1date1 <- read_csv(here::here("inputs/0-simulation/store1date1.csv"),
                        show_col_types = FALSE)
store1date2 <- read_csv(here::here("inputs/0-simulation/store1date2.csv"),
                        show_col_types = FALSE)

### Testing ###

# Test class to be correct type (character)
class(store1date1$products) == "character"

# Ensure that there is only one column (products)
length(store1date1) == 1

# Ensure there are no duplicate products
duplicated(store1date1) == FALSE

# Make sure that the two versions are not entirely equal
isTRUE(all.equal(store1date1,store1date2)) == FALSE
