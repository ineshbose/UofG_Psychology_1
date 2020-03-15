#---
# title: 'Level 1 Lab 1: Homework'
# author: "Inesh Bose"
# date: "Semester 1 2019"
# output: html_document
#---

## Activity 1

rnorm(n, mean = 0, sd = 1)


## Activity 2

set.seed(12042016)
rnorm(n = 5)

rnorm(n = 5, mean = 10, sd = 2)

rnorm(n = 6, mean = 3, sd = 1)
rnorm(6, 3, 1)

rnorm(sd = 1, n = 6, mean = 3)


## Activity 3

install.packages("tidyverse")


## Activity 4

library(tidyverse)

library(dplyr)
library(MASS)

dplyr::select()
MASS::select()


## Activity 5

name <- "inesh"
age <- 15 + 3 
today <-Sys.# date()
new_year <- as.# date("2020-01-01")
data <- rnorm(n = 10, mean = 15, sd = 3)

age + 10
new_year - today
mean(data)

decade <- age + 10
