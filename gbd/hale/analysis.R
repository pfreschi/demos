# Analysis: is there more expansion or compression?

# Set up
library(tidyr)
library(dplyr)
setwd('~/Documents/Info498C/demos/gbd/hale/')

# Load data
hale.data <- read.csv('./data/prepped/hale-le-data.csv', stringsAsFactors = FALSE)
wide.data <- read.csv('./data/prepped/hale-le-data-wide.csv', stringsAsFactors = FALSE)

# Are HALE and life expectancy correlated (visually, statistically)?
cor(hale.data$le, hale.data$hale)
qplot(hale.data$le, hale.data$hale)
## yes, as HALE increases, Life Expectancy increases

# As life expectancy increases, at what rate does hale increase (or decrease, or not)?
## for every year increase by 1.0 for Life Expectancy, HALE increases by .9974652

# Compute change in life expectancy, change in hale
## added two new columns 
wide.data <- wide.data %>% 
              mutate(hale.change = hale.2015 - hale.1990, le.change = le.2015 - le.1990)

# Assess relationship between change
qplot(wide.data$le.change, wide.data$hale.change)
lm(hale.change ~ le.change, data=wide.data)

# What is the distribution in the ratios of le to hale?
hist(wide.data$le.change / wide.data$hale.change)



## there is a bit of compression. HALE change is slightly greater than the LE change.
mean(wide.data$hale.change - wide.data$le.change)
## people are having more healthy years, their healthy life expectancy. we've made progress 
## with keeping people alive, and time spent in ill health and decreasing