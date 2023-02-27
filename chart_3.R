# Chart 3
# Vincent Chen

# Load relevant packages
library(dplyr)
library(tidyverse)
library(ggplot2)
library(RColorBrewer)

# Load data set
library_checkouts <- read.csv("../../A3_dataset/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = F)

# Filter by 'CheckoutYear' of 2017 or 2022
# and group by 'UsageClass' to explore digital and physical trends in checkouts
checkouts_by_usage <- library_checkouts %>%
  filter(CheckoutYear == 2017 | CheckoutYear == 2022) %>%
  group_by(UsageClass)

# Chart 3 
# Bar Chart that displays the prevalence of Digital and Physical forms of consumption 
# across library checkouts in the year 2017 and 2022
ggplot(
  data =
    checkouts_by_usage,
  aes(
    x = CheckoutYear,
    y = Checkouts,
    fill = UsageClass
  )
) +
  geom_bar(
    stat = "identity",
    position = "dodge"
  ) +
  scale_x_continuous(breaks = c(2017, 2022)) +
  labs(
    title = "Digital vs Physical Consumption \nin Library Checkouts (2017 & 2022)",
    x = "Year",
    y = "Number of Checkouts",
    fill = "Item Type"
  )
