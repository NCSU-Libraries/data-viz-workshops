# Data Cleaning with R
# By Alison Blaine and Erica Hayes
# NCSU Libraries


# Section 1: Setting Up your R Session, Loading Packages, Reading in Data

# Step 1: Install the package if not already installed.
install.packages("tidyverse")

# Step 2: Load the package into your current working session.
library(tidyverse)

# Step 3: Set working directory to current folder
#(shortcut: In Files tab, select More, then Set as Working Directory)

setwd("/cloud/project")

# Step 4: Read in the data file. 
movies <- read_csv("movies.csv")

# Step 5: Look at the data in the console
movies

# Step 6: Look at the data in a new tab
View(movies)

# Section 2: Cleaning functions from the dplyr and tidyr packages

# ---- Sort data with the arrange() function -----

# Step 7. Sort data by Worldwide Gross, lowest to highest. 

arrange(movies,`Worldwide Gross`)

# Step 8: Sort the data by Worldwide Gross, highest to lowest.

arrange(movies, desc(`Worldwide Gross`))

# Previous steps printed sorted data but didn't change original movies dataset. 
# To save a sorted version of the data:

movies_by_top_gross <- arrange(movies, desc(`Worldwide Gross`))

# Step 9: Practice: Sort movies dataset by Year, from lowest to highest (ascending)

arrange(movies, Year)


# Now sort movies dataset by descending Year

arrange(movies, desc(Year))


# ---- Rename column headers with the rename() function ----

# Step 10: Rename `Worldwide Gross` column to Gross. Put new name = old name. Rewrite over
# original movies dataset for a permanent name change.

movies <- rename(movies, Gross = `Worldwide Gross`)

movies 

# Step 11: Rename `Audience Score` to Score. Use Step 10 as an example.

movies <- rename(movies, Score = `Audience Score`)


# ---- Create a data subset with the filter() function ----

# Step 12: Filter the movies by Year. Select movies from 2010 and later. 

movies_filtered <- filter(movies, Year >= 2010)



# Practice: Now filter movies where Year is 2009 (use Year == 2009)

movies_2009 <- filter(movies, Year== 2009)


# ---- Split a column on a delimiter with the separate() function ----

# Step 13: Split the Genre/Lead Studio column on the '/' symbol to create
# two columns 

movies <- separate(movies, `Genre/Lead Studio`, c("Genre", "Studio") )

movies


# ---- Remove unwanted characters with the str_replace() function ----

# Step 14: 
movies$Score <- str_replace(movies$Score, "%", "")

movies  

# Practice: Replace "Faux" in the Studio column with the correctly spelled word "Fox"

movies$Studio <- str_replace(movies$Studio, "Faux", "Fox")



# ---- Collapse columns with the gather() function ----

# Step 15: Collapse all the critic columns into just "Critic" and "Rating" columns.

movies <- gather(movies, key = "Critic", value = "Rating", Critic1:Critic3)

View(movies)

# ---- Do operations on data groups with the group_by() function ----

# Step 16: Find the average rating for each Critic

# first create a data grouping by Critic
grouped_movies <- group_by(movies, Critic)

# then use summarise() and mean() functions
summarise(grouped_movies, mean=mean(Rating))

# Practice: Find the average Critic rating for each movie. First, group movies by Film:

movies_groupedby_film <- group_by(movies, Film)

# now use summarise:
summarise(movies_groupedby_film, mean=mean(Rating))
  
# ---- Ungroup the data using ungroup() function ----

# Step 17: Ungroup grouped_movies and try doing the summarise() function again
grouped_movies <- ungroup(grouped_movies)

summarise(grouped_movies, mean=mean(Rating))


# ---- Turn one column into many using the spread() function ----

# Step 18: Break Critic column into three columns (Critic1, Critic2, Critic3), like in the original movies dataset.
movies_spread <- spread(movies, Critic, Rating)

movies_spread

# Step 19: Find the average Gross for all films 

mean(movies_spread$Gross)

# ---- Keep or drop specific rows by rownumber with the slice() function ----

# Step 20: Remove row 4 using slice() function

slice(movies_spread, -4)

# alternate way to do it is using filter() function, but that may not only remove one row: 

filter(movies_spread, Score > 5)

# Practice: Remove row 5 using slice() function

slice(movies_spread, -5)

# ---- Use mutate() to create a new column ---- 

# Step 21: Create a new column "Gross_Ranking" with values low, medium, or high depending on the Gross value.

mutate(movies_spread, Gross_Ranking = ifelse(Gross >= 0 & Gross < 50, "low", 
                                             ifelse(Gross > 50 & Gross < 100, "medium", 
                                                    "high")))


# Step 22: Save time and chain functions together using the pipe (%>%) operator

movies_spread %>%
  filter(Genre=="Comedy") %>%  # select only the films that are comedies
  top_n(., 2, Gross)  # select the top 2 comedies by highest gross


# Practice. Add the arrange() function at the end to order by highest Gross. Use the desc() function.
top_comedies <- movies_spread %>%
  filter(Genre=="Comedy") %>%
  top_n(., 2, Gross) %>% 
  arrange(., desc(Gross))


# ---- Use left_join() function from dplyr to join datasets ----

# Step 23. Merging two datasets using dplyr 

# read in r_downloads.csv

r_downloads <- read_csv("r_downloads.csv")

head(r_downloads)

# read in country_codes.csv 

country_codes <- read_csv("country_codes.csv")

head(country_codes)

# find out the common variable to merge on
names(r_downloads)
names(country_codes)

# merge on the country column from r_downloads and the Code column from country_codes
# column from country_codes

joined_data <- left_join(r_downloads, country_codes, by = c("country"="Code"))

head(joined_data, 10)


# More Practice. Now try some of the cleaning functions you have learned on the candy-survey-excerpt-2016.csv dataset.
# Hint: what would it take to make this data more tidy? Consider where you might use the gather() function.

candy_data <- read_csv("candy-survey-excerpt-2016.csv")
