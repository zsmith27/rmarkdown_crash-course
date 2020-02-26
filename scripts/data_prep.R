# Data Prep
library(dplyr)
thesis.df <- read.csv(file.path(here::here(),
                                "data",
                                "ZMS_THESIS_06_18_2017.csv"),
                      stringsAsFactors = FALSE) %>% 
  filter(sample_number == 1) %>% 
  select(-picked, -squares, -disturbance, -distance_fram_shore, -life_stage) %>% 
  group_by_at(vars(-reporting_value)) %>% 
  summarise(count = sum(reporting_value))

write.csv(thesis.df,
          file.path(here::here(),
                    "data",
                    "zms_thesis.csv"))
