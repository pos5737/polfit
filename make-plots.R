# load packages
library(tidyverse)

# read data 
df <- read_csv("state-legislators.csv") %>%
  filter(party != "X") %>%
  glimpse()