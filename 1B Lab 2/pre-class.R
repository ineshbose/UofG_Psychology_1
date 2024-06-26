#---
# title: "Level 1 Lab 2: Pre-Class"
# author: "Inesh Bose"
# date: "Semester 2 2019"
# output: html_document
#---

## Activity 2

library(tidyverse)
scoring <- read_csv("scoring.csv")
responses <- read_csv("responses.csv")
qformats <- read_csv("qformats.csv")


## Activity 3

scores <- responses %>%
  pivot_longer(names_to = "Question", values_to = "Response", cols = Q1:Q10) %>%
  inner_join(qformats, "Question") %>%
  inner_join(scoring, c("QFormat", "Response"))


## Activity 4

example_2 <- select(scores, -QFormat) %>%
  filter(Question == "Q1") %>%
  summarise(total_score = sum(Score))


## Activity 5

scores %>%
  group_by(Question) %>%
  summarise(item_scores = sum(Score)) %>%
  ggplot(aes(x = Question, y = item_scores)) +
  geom_col() +
  theme_minimal()

