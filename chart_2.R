# Chart 2
# Vincent Chen

# Load relevant packages
library(dplyr)
library(tidyverse)
library(ggplot2)
library(RColorBrewer)

# Load data set
library_checkouts <- read.csv("../../A3_dataset/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = F)

# Filter by 'CheckoutYear' of 2019 and the two book 'Titles'. 
# Group by 'CheckoutMonth' to explore monthly 'Checkout' trends.  
title_checkouts_2019 <- library_checkouts %>%
  filter(CheckoutYear == 2019) %>%
  filter(Title == "The Fault in Our Stars" | Title == "Lord of the Flies") %>%
  group_by(CheckoutMonth)

# Chart 2
# Line chart that displays the monthly trends/fluctuations in library checkouts 
# between two books in 2019 
ggplot(data = title_checkouts_2019) +
  geom_line(
    mapping =
      aes(
        x = CheckoutMonth,
        y = Checkouts,
        color = Title
      )
  ) +
  scale_color_brewer(palette = "Accent") +
  labs(
    title = "Required Highschool Reading \nand Leisure Reading in 2019 ",
    x = "Month",
    y = "Number of Checkouts",
    color = "Book Title"
  ) +
  scale_x_continuous(breaks = seq(0, 12, 2)) +
  scale_y_continuous(breaks = seq(0, 24, 2))
