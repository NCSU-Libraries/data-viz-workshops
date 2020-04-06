library("tidyverse")
library("skimr")
library("vroom")
library("lubridate")

nc_traf <- vroom::vroom("nc_statewide_2019_12_17.csv")

nc_traf_2010 <- nc_traf %>%
  filter(date >= as_date("2010-01-01"))

nc_arrests_race <- nc_traf_2010 %>%
  filter(!is.na(subject_race)) %>%
  count(county_name, subject_race, arrest_made) %>%
  rename(num_arrests = n) %>%
  filter(arrest_made == TRUE) %>%
  select(-arrest_made)


county_totals <- nc_traf_2010 %>%
  count(county_name) %>%
  rename(county_stops_total = n)

county_totals_arrests <- nc_traf_2010 %>%
  count(county_name, arrest_made) %>%
  rename(count_arrests_total = n) %>%
  filter(arrest_made == TRUE) %>%
  select(-arrest_made)

county_race_arrests <- nc_arrests_race %>%
  inner_join(county_totals) %>%
  inner_join(county_totals_arrests)

county_race_arrests <- county_race_arrests %>%
  mutate(arrest_percent = num_arrests / count_arrests_total)

county_race_arrests_spread <- county_race_arrests %>%
  select(-num_arrests) %>%
  pivot_wider(names_from = subject_race, values_from = arrest_percent, values_fill = list(arrest_percent = 0))
  
write.csv(county_race_arrests_spread, "nc_traffic_arrests_race_since_2010.csv", row.names = FALSE)

