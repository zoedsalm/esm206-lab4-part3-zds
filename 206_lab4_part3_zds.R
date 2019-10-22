# Zoe Duerksen-Salm

library(tidyverse)
library(here)
library(janitor)

db <- read_csv(here("data", "disease_burden.csv")) %>% 
  clean_names() %>% 
  rename(deaths_per_100k = death_rate_per_100_000)

db_sub <- db %>%
  filter(country_name %in% c("United States", "Japan", "Afghanistan", "Somalia")) %>% 
  filter(age_group == "0-6 days", sex == "Both")

# For filter we can either use "," or "&" to say condition MUST be met

# Graph:

ggplot(db_sub, aes(x = year, y = deaths_per_100k)) +
  geom_line(aes(color = country_name))

ggsave(here::here("final graphs", "disease_graph.png"))

# ggsave runs on most recently coded graph