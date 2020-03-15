#---
# title: "Level 1 Lab 1: Pre-Class"
# author: "Inesh Bose"
# date: "Semester 2 2019"
# output: html_document
#---


## Activity 4

library(tidyverse)

responses <- read_csv("responses.csv")
scoring <- read_csv("scoring.csv")
qformats <- read_csv("qformats.csv")


## Activity 5

summary(responses)
summary(scoring)
summary(qformats)
