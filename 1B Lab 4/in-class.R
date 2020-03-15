#---
# title: "Level 1 Lab 4: In-Class"
# author: "Inesh Bose"
# date: "Semester 2 2019"
# output: html_document
#---

## Activity 1

library(tidyverse)

demo <- read_csv("demographics.csv")
mslq <- read_csv("mslq.csv")
teams <- read_csv("team-name.csv")


## Activity 2

demo_final <- demo %>% 
  group_by(user_id, q_id) %>% 
  filter(session_id == min(session_id), endtime == min(endtime)) %>% 
  filter(row_number() == 1) %>% 
  ungroup() %>% 
  filter(user_status %in% c("guest", "registered")) %>%
  select(user_id, user_sex, user_age, q_name, dv) %>%
  pivot_wider(names_from = q_name, values_from = dv)%>%
  mutate(employment = as.numeric(employment))

teams_final <- teams %>%
  group_by(user_id, q_id) %>% 
  filter(session_id == min(session_id), endtime == min(endtime)) %>% 
  filter(row_number() == 1) %>% 
  ungroup() %>% 
  filter(user_status %in% c("guest", "registered")) %>%
  select(user_id, user_sex, user_age, dv) %>%
  rename("team" = "dv")
  
mslq_final <- mslq %>% 
  group_by(user_id, q_id) %>% 
  filter(session_id == min(session_id), endtime == min(endtime)) %>% 
  filter(row_number() == 1) %>% 
  ungroup() %>% 
  filter(user_status %in% c("guest", "registered")) %>%
  select(user_id, user_sex, user_age, q_name, dv) %>%
  arrange(q_name) %>%
  pivot_wider(names_from = q_name, values_from = dv)


## Activity 3

all_dat <- inner_join(demo_final, mslq_final, by=NULL) %>% 
 inner_join(teams_final, by= NULL)

summary(all_dat)


## Activity 4

selected <- select(all_dat, user_id, user_sex, user_age, anxiety_1, anxiety_2, anxiety_3, anxiety_4, anxiety_5, team) %>% 
  filter(anxiety_1 != "NA" &  anxiety_2 != "NA" & anxiety_3 != "NA" & anxiety_4 != "NA" & anxiety_5 != "NA") %>% 
  filter(user_age<30) %>% 
  filter(user_sex %in% c("male", "female"))


## Activity 5

dat_means_whole <- selected %>%
  pivot_longer(names_to = "var", values_to = "val", anxiety_1:anxiety_5) %>%
  group_by_at(vars(-val, -var)) %>%
  summarise(scale_mean = mean(val, na.rm = TRUE)) %>%
  ungroup()

dat_means_group <- selected %>% filter(team == 56) %>%
  pivot_longer(names_to = "var", values_to = "val", anxiety_1:anxiety_5) %>%
  group_by_at(vars(-val, -var)) %>%
  summarise(scale_mean = mean(val, na.rm = TRUE)) %>%
  ungroup()


## Activity 6

males <- filter(dat_means_whole, user_sex == "male")
females <- filter(dat_means_whole, user_sex == "female")


## Activity 7

group_mal <- summarise(males, total = sum(scale_mean), mean_m = mean(scale_mean))


group_fem <- group_by(.data = females, total = sum(scale_mean), mean_m = mean(scale_mean))                      
                      
malesy <- summarise(males)
femaley <- summarise(females)


## Activity 8

scores <- summarise(dat_means_whole, median = median(scale_mean), mean = mean(scale_mean))
data_sex <- group_by(dat_means_whole, user_sex)
data_scores <- summarise(data_sex, median = median(scale_mean), mean = mean(scale_mean))

Gscores <- summarise(dat_means_whole, median = median(scale_mean), mean = mean(scale_mean))
Gdata_sex <- group_by(dat_means_whole, user_sex)
Gdata_scores <- summarise(data_sex, median = median(scale_mean), mean = mean(scale_mean))


## Activity 9

dat_means_whole %>%
  ggplot(aes(x = user_sex, y = scale_mean)) +
  stat_summary(geom = "bar", fun.y = "mean") +
  stat_summary(geom = "errorbar", fun.data = "mean_se", width = .2) +
  theme_minimal()
ggsave("whole_bar.png")

ggplot(dat_means_group, aes(x = scale_mean, fill = user_sex)) +
  geom_density(alpha = .3) +
  theme_minimal() +
  scale_fill_viridis_d(option = "D") +
  scale_x_continuous(name = "Total AQ Score", breaks = c(1,2,3,4,5,6,7,8,9,10)) +
  scale_y_continuous(name = "Density")
ggsave("group_density.png")

ggplot(dat_means_group, aes(user_sex, scale_mean)) +
  geom_violin(trim = FALSE) +
  geom_boxplot(width = .2) +
  theme_minimal()
ggsave("group_violin.png")
