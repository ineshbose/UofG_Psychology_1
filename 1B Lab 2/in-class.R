#---
# title: "Level 1 Lab 2: In-Class"
# author: "Inesh Bose"
# date: "Semester 2 2019"
# output: html_document
#---

## Activity 1

library(tidyverse)
responses <- read_csv('responses.csv')
scoring <- read_csv('scoring.csv')
qformats <- read_csv('qformats.csv')


## Activity 2

AQ_all <- pivot_longer(data = responses, names_to = "Question", values_to = "Response", cols = Q1:Q10) %>% 
  inner_join(qformats, by = "Question") %>% 
  inner_join(scoring, by = c("QFormat", "Response")) %>% 
  group_by(Id, gender) %>% summarise(total_score = sum(Score))


## Activity 3

AQ_all %>% filter(gender=='female') %>% ggplot(aes(x=total_score)) +
  geom_histogram(binwidth = 1, colour = "black", fill = "grey") +
  theme_minimal()+
  scale_x_continuous(name = "Total AQ Score (female participants)", breaks = c(0,1,2,3,4,5,6,7,8,9,10)) +
  scale_y_continuous(name = "Count")


## Activity 4

ggplot(AQ_all, aes(gender, total_score)) +
  geom_violin(trim = FALSE) +
  geom_boxplot(width = .2) +
  theme_minimal()


## Activity 5

AQ_all %>%
  ggplot(aes(x = gender, y = total_score)) +
  stat_summary(geom = "bar", fun.y = "mean") +
  stat_summary(geom = "errorbar", fun.data = "mean_se", width = .2) +
  theme_minimal()


## Activity 6

ggplot(AQ_all, aes(x = total_score, fill = gender)) +
  geom_density(alpha = .3) +
  theme_minimal() +
  scale_fill_viridis_d(option = "D") +
  scale_x_continuous(name = "Total AQ Score", breaks = c(1,2,3,4,5,6,7,8,9,10)) +
  scale_y_continuous(name = "Density")


## Activity 7

AQ_histogram <- AQ_all %>%
  filter(gender == "female") %>%
  ggplot(aes(x = total_score)) +
  geom_histogram(binwidth = 1, colour = "black", fill = "grey") +
  theme_minimal()+
  scale_x_continuous(name = "Total AQ Score (female participants)", breaks = c(0,1,2,3,4,5,6,7,8,9,10)) +
  scale_y_continuous(name = "Count")

ggsave("AQ_histogram.png", plot = AQ_histogram)
