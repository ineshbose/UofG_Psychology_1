#---
# title: "Level 1 Lab 1: In-Class"
# author: "Inesh Bose"
# date: "Semester 2 2019"
# output: html_document
#---

## Activity 1

library(tidyverse)

responses <- read_csv("responses.csv")
scoring <- read_csv("scoring.csv")
qformats <- read_csv("qformats.csv")


## Activity 2

rlong <- pivot_longer(data = responses, names_to = "Question", values_to = "Response", cols = Q1:Q10)


## Activity 3

rlong_16 <- filter(.dat = rlong, Id==16)


## Activity 4

rlong_16_join <- inner_join(rlong_16, qformats, by = 'Question')


## Activity 5

scores_16 <- inner_join(rlong_16_join, scoring, by=c('QFormat','Response'))


## Activity 6

AQ_16 <- summarise(scores_16, AQ_score = sum(Score))


## Activity 7

rlong_join <- inner_join(rlong, qformats, "Question")
scores <- inner_join(rlong_join, scoring, c("QFormat", "Response"))
scores_grouped <- group_by(scores, Id, gender)
AQ_all <- summarise(scores_grouped, total_score = sum(Score))


## Activity 8

ggplot(AQ_all, aes(x=total_score)) + geom_histogram(binwidth=1)


