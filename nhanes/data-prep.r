library(SASxport)
library(Hmisc)
library(dplyr)

setwd("~/Documents/INFO498C/demos/nhanes")
xpt = sasxport.get("data/raw/Y_PAQ.XPT")
write.csv(xpt, file="data/raw/data-physical.csv")

xpt = sasxport.get("data/raw/Y_DEMO.XPT")
write.csv(xpt, file="data/raw/data-demographics.csv")

phys_activity <- read.csv("data/raw/data-physical.csv")
demographics <- read.csv("data/raw/data-demographics.csv")

combined <- left_join(phys_activity, demographics, by="seqn")

