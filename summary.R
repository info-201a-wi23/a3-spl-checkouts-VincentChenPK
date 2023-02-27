# Summary Information Values
# Vincent Chen 

# Load relevant packages
library(dplyr)

# Load data set 
library_checkouts <- read.csv("../../A3_dataset/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = F)

# 1) Find the most prevalent 'MaterialType' for library checkouts in '2017'
most_material_2017 <- library_checkouts %>%
  filter(CheckoutYear == 2017) %>%
  count(MaterialType) %>%
  filter(n == max(n, na.rm = T)) %>%
  pull(MaterialType)

# 2) Find the most prevalent 'MaterialType' for library checkouts in '2020'
most_material_2020 <- library_checkouts %>%
  filter(CheckoutYear == 2020) %>%
  count(MaterialType) %>%
  filter(n == max(n, na.rm = T)) %>%
  pull(MaterialType)

# 3) Find the year with the most 'Checkouts' 
year_most_checkouts <- library_checkouts %>%
  group_by(CheckoutYear) %>%
  summarise(total_year_checkouts = sum(Checkouts, na.rm = T)) %>%
  filter(total_year_checkouts == max(total_year_checkouts, na.rm = T)) %>%
  pull(CheckoutYear)

# 3a) Pull the number of 'Checkouts' from the year with the most 
num_highest_year <- library_checkouts %>%
  group_by(CheckoutYear) %>%
  summarise(total_year_checkouts = sum(Checkouts, na.rm = T)) %>%
  filter(total_year_checkouts == max(total_year_checkouts, na.rm = T)) %>%
  pull(total_year_checkouts)

# 4) Find the year with the least 'Checkouts'
year_least_checkouts <- library_checkouts %>%
  filter(CheckoutYear != 2023) %>%
  group_by(CheckoutYear) %>%
  summarise(total_year_checkouts = sum(Checkouts, na.rm = T)) %>%
  filter(total_year_checkouts == min(total_year_checkouts, na.rm = T)) %>%
  pull(CheckoutYear)

# 4a) Pull the number of 'Checkouts' from the year with the least
num_lowest_year <- library_checkouts %>%
  group_by(CheckoutYear) %>%
  summarise(total_year_checkouts = sum(Checkouts, na.rm = T)) %>%
  filter(total_year_checkouts == min(total_year_checkouts, na.rm = T)) %>%
  pull(total_year_checkouts)

# 5) Find the 'Creator' (author) with the most checkouts of all time 
author_most_checkouts <- library_checkouts[!(library_checkouts$Creator == ""), ] %>% 
  group_by(Creator) %>%
  summarise(total_checkouts = sum(Checkouts, na.rm = T)) %>%
  filter(total_checkouts == max(total_checkouts, na.rm = T)) %>%
  pull(Creator)

# 6) Find the month ('CheckoutMonth') with the most 'Checkouts' in the year 2019
month_most_checkouts_2019 <- library_checkouts %>%
  filter(CheckoutYear == 2019) %>%
  group_by(CheckoutMonth) %>%
  summarise(total_month_checkouts = sum(Checkouts, na.rm = T)) %>%
  filter(total_month_checkouts == max(total_month_checkouts, na.rm = T)) %>%
  pull(CheckoutMonth)

# 7) Find the most prevalent 'Subjects' for checkouts in January, 2019
most_subjects_jan_2019 <- library_checkouts %>%
  filter(CheckoutYear == 2019 & CheckoutMonth == 1) %>%
  group_by(Subjects) %>%
  summarise(count = n()) %>%
  filter(count == max(count, na.rm = T)) %>%
  pull(Subjects)

# 8) Add all variables into a summary info list 
sum_info <- list()
sum_info$most_material_2017 <- most_material_2017
sum_info$most_material_2020 <- most_material_2020
sum_info$year_most_checkouts <- year_most_checkouts
sum_info$num_highest_year <- num_highest_year
sum_info$year_least_checkouts <- year_least_checkouts
sum_info$num_lowest_year <- num_lowest_year
sum_info$author_most_checkouts <- author_most_checkouts
sum_info$month_most_checkouts_2019 <- month_most_checkouts_2019
sum_info$most_subjects_jan_2019 <- most_subjects_jan_2019
