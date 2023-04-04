#### Preamble ####
# Purpose: Gather names of all products of KOTN and Zaful on two separate dates
# Author: Jayden Jung
# Email: jayden.jung@mail.utoronto.ca
# Date: Apr 21 2023
# Prerequisites: Use Web Scraper chrome extension for scraping KOTN data

# Set up
library(rvest)   
library(tidyverse)
library(dplyr)
library(httr)

### KOTN Products ###
# Collected with chrome extension: https://www.webscraper.io/ 
# with selector set as: .products_grid__SIeIQ div.ProductCard_innerContainer__Gp3qg:nth-of-type(2) h2
# Collected dates: April 2nd & April 11th

### Zaful Products (April 2nd & April 11th) ###
#Set Headers
headers <- c("User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36")

## First date
#Create empty data frame
z_products <- data.frame()

#Loop through all product pages (sequence max set by what is seen on site) 
for(page_result in seq(from = 1, to = 122, by = 1)) {
  url = paste0("https://www.zaful.com/clothes-e_1/g_", 
              page_result, ".html")
  raw_page <- GET(url, add_headers(headers))
  html <- read_html(raw_page)
  
  # Scrape all product names on given page
  products <- html %>% html_elements(".js_list_title") %>% html_text()
  
  # Add each page's products to data frame
  z_products <- rbind(z_products, data.frame(products=products))
  
  # Print page number to track progress, not necessary
  print(paste("Page:", page_result))
}

#Write csv of product list
write_csv(z_products, "inputs/data/zafulapril2.csv")

## Second date
#Create empty data frame
z_products2 <- data.frame()

#Loop through all product pages (sequence max set by what is seen on site) 
for(page_result in seq(from = 1, to = 123, by = 1)) {
  url = paste0("https://www.zaful.com/clothes-e_1/g_", 
               page_result, ".html")
  raw_page <- GET(url, add_headers(headers))
  html <- read_html(raw_page)
  
  # Scrape all product names on given page
  products <- html %>% html_elements(".js_list_title") %>% html_text()
  
  # Add each page's products to data frame
  z_products2 <- rbind(z_products2, data.frame(products=products))
  
  # Print page number to track progress, not necessary
  print(paste("Page:", page_result))
}

#Write csv of product list
write_csv(z_products2, "inputs/data/zafulapril4.csv")