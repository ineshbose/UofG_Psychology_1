#---
# title: "Level 1 Lab 4: Pre-Class"
# author: "Inesh Bose"
# date: "Semester 2 2019"
# output: html_document
#---

## Activity 1

library(tidyverse)
sample(x = c("HEADS", "TAILS"), size = 4, replace = TRUE)
sample(x = 0:1, size = 4, replace = TRUE)


## Activity 2

sample(x = 0:1, size = 4, replace = TRUE) %>% sum()


## Activity 3

replicate(n = 20, expr = sample(0:1, 4, TRUE) %>% sum())


## Activity 4

heads50 <- replicate(50, sample(0:1, 4, TRUE) %>% sum())   
heads50


## Activity 5

data50 <- tibble(heads = heads50) %>%
                group_by(heads) %>%
                summarise(n = n(), p=n/50)


## Activity 6

ggplot(data50, aes(x = heads,y = p)) + 
  geom_bar(stat = "identity", fill = "purple") + 
  labs(x = "Number of Heads", y = "Probability of Heads in 4 flips (p)") +
  theme_minimal()


## Activity 7

heads10K <- replicate(n = 10000, expr = sample(0:1, 4, TRUE) %>% sum())

data10K <- tibble(heads = heads10K) %>%   
                group_by(heads) %>%           
                summarise(n = n(), p=n/10000)

ggplot(data10K, aes(heads,p)) + 
  geom_bar(stat = "identity", fill = "purple") + 
  labs(x = "Number of Heads", y = "Probability of Heads in 4 flips (p)") +
  theme_minimal()

data10K %>%
  filter(heads >= 2) %>%
  summarise(p2 = sum(p))


## Activity 8

normal <- rnorm(n = 50, mean = 10, sd = 2)
mean(normal)
sd(normal)

tibble(normal = normal) %>%
  ggplot(aes(normal)) +
  geom_density(fill = "red") +
  theme_minimal()


## Activity 9

subject_id <- 1:120
gender <- rep(x = c("man", "woman", "nonbinary"), each = 40)
rolls <- sample(x = 1:6, size = 120, replace = TRUE)
iq <- rnorm(n = 120, mean = 100, sd = 15)
sim_data <- tibble(subject_id, gender, rolls, iq)
sim_data %>%
  mutate(rolls = as.factor(rolls)) %>%
  ggplot(aes(x = rolls, y = iq, fill = rolls)) +
  geom_violin(trim = FALSE, alpha = .6, show.legend = FALSE) +
  geom_boxplot(width = .2, show.legend = FALSE) +
  scale_fill_viridis_d(option = "E") +
  theme_minimal() +
  labs(x = "Outcome of dice roll")
