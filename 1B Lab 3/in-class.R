#---
# title: "Level 1 Lab 3: In-Class"
# author: "Inesh Bose"
# date: "Semester 2 2019"
# output: html_document
#---

## Activity 2

dbinom(x = 5, size = 10, prob = 0.5)


## Activity 3

pbinom(q = 2, size = 10, prob = 0.5)


## Activity 4

pbinom(q = 7, size = 10, prob = .5)

pbinom(q = 6, size = 10, prob = .5, lower.tail = FALSE) 


## Activity 5

qbinom(p = .05, size = 10, prob = .5)

qbinom(p = .05, size = c(100, 1000, 10000), prob = .5)

pnorm(q = 176.2, mean = 163.8, sd = 6.931, lower.tail = FALSE)

men <- rnorm(n = 100000, mean = 176.2, sd = 6.748)
women <- rnorm(n = 100000, mean = 163.8, sd = 6.931)

heights <- tibble(men, women) %>%
  pivot_longer(names_to = "sex", values_to = "height", men:women)

ggplot(heights, aes(x = height, fill = sex)) +
  geom_density(alpha = .6) +
  scale_fill_viridis_d(option = "E") +
  theme_minimal()


## Activity 6

pnorm(q = 181.12, mean = 176.2, sd = 6.748, lower.tail = FALSE)


## Activity 7

pnorm(q = 181.12, mean = 163.8, sd = 6.931, lower.tail = TRUE)


## Activity 8

qnorm(p = .05, mean = 176.2, sd = 6.748, lower.tail = FALSE)


## Activity 9

qnorm(p = NULL, mean = NULL, sd = NULL, lower.tail = NULL)
