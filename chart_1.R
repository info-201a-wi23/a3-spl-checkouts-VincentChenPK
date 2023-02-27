# Chart 1
# Vincent Chen

# Load relevant packages
library(dplyr)
library(tidyverse)
library(ggplot2)
library(RColorBrewer)

# Load data set
library_checkouts <- read.csv("../../A3_dataset/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = F)

# Group by 'CheckoutYear' and filter by 3 different 'MaterialTypes' 
# to see the fluctuation in mediums for library checkouts in 2017-2023
material_checkouts_per_year <- library_checkouts %>%
  filter(MaterialType == "BOOK" | MaterialType == "AUDIOBOOK" | MaterialType == "EBOOK") %>%
  group_by(CheckoutYear)

# Chart 1
# Stacked Bar Chart that displays the prevalence/trends of specific mediums ('MaterialTypes') for library checkouts in 2017-2023
ggplot(
  data = material_checkouts_per_year,
  aes(
    x = CheckoutYear,
    y = Checkouts,
    fill = MaterialType
  )
) +
  geom_bar(stat = "identity") +
  scale_fill_brewer(palette = "Dark2") +
  labs(
    title = "Library Checkouts By Different \nBook Mediums in 2017-2023",
    x = "Year",
    y = "Number of Checkouts",
    fill = "Medium"
  )
