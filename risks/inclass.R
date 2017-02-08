library(dplyr)

setwd('~/Documents/INFO498C/')
risks <- read.csv("demos/risks/data/prepped/risk-factors.csv", stringsAsFactors = FALSE)

risks$avg.risk <- rowMeans(risks[7:ncol(risks)], na.rm = TRUE)

View(top_n(risks, 1, risks$avg.risk))
#The highest risk-disease combination is 
