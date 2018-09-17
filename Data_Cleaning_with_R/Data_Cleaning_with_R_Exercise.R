# Data Cleaning with R
# By Alison Blaine and Erica Hayes
# NCSU Libraries


# Section 1: Setting Up your R Session, Loading Packages, Reading in Data

# 1. Install the package if not already installed.
install.packages("tidyverse")

# 2. Load the package into your current working session.
library(tidyverse)

# 3. Set working directory to current folder
#(shortcut: In Files tab, select More, then Set as Working Directory)

setwd("/cloud/project")

# 4. Read in the data file. 
movies <- read_csv("movies.csv")

# 5. Look at the data in the console
movies

# 6. Look at the data in a new tab
View(movies)

# Section 2: Cleaning functions from the dplyr and tidyr packages

# ---- Sort data with the arrange() function -----

# 7. Sort data by Worldwide Gross, lowest to highest. 

arrange(movies,`Worldwide Gross`)

# 8. Sort the data by Worldwide Gross, highest to lowest.

arrange(movies, desc(`Worldwide Gross`))

# Note: The previous line of code printed sorted data but didn't change original movies dataset. 
# To save a sorted version of the data:

movies_by_top_gross <- arrange(movies, desc(`Worldwide Gross`))

# 9. Practice: Sort movies dataset by Year, from lowest to highest


# 10. Now sort movies dataset by descending Year



# ---- Rename column headers with the rename() function ----

# 11. Rename `Worldwide Gross` column to Gross. Put new name = old name. Rewrite over
# original movies dataset for a permanent name change.

movies <- rename(movies, Gross = `Worldwide Gross`)

movies 

# 12. Rename `Audience Score` to Score. Use 10 as an example.



# ---- Create a data subset with the filter() function ----

# 13. Filter the movies by Year. Select movies from 2010 and later. 

movies_filtered <- filter(movies, Year >= 2010)


# 14. Practice: Now filter movies where Year is 2009 (use Year == 2009)


# ---- Split a column on a delimiter with the separate() function ----

# 15. Split the Genre/Lead Studio column on the '/' symbol to create
# two columns 

movies <- separate(movies, `Genre/Lead Studio`, c("Genre", "Studio") )

movies


# ---- Remove unwanted characters with the str_replace() function ----

# 16. Remove the % sign from the Score data 
movies$Score <- str_replace(movies$Score, "%", "")

movies  

# 17. Practice: Replace "Faux" in the Studio column with the correctly spelled word "Fox"


# ---- Collapse columns with the gather() function ----

# 18. Collapse all the critic columns into just "Critic" and "Rating" columns.

movies <- gather(movies, key = "Critic", value = "Rating", Critic1:Critic3)

View(movies)

# ---- Do operations on data groups with the group_by() function ----

# 19. Find the average rating for each Critic

# first create a data grouping by Critic
grouped_movies <- group_by(movies, Critic)

# then use summarise() and mean() functions
summarise(grouped_movies, mean=mean(Rating))

# 20. Practice: Find the average Critic rating for each movie. First, group movies by Film:

movies_groupedby_film <- group_by(movies,      )

# now use summarise:


# ---- Ungroup the data using ungroup() function ----

# 21. Ungroup grouped_movies and try doing the summarise() function again
grouped_movies <- ungroup(grouped_movies)

summarise(grouped_movies, mean=mean(Rating))


# ---- Turn one column into many using the spread() function ----

# 22. Break Critic column into three columns (Critic1, Critic2, Critic3), like in the original movies dataset.
movies_spread <- spread(movies, Critic, Rating)

# 23. Find the average Gross for all films 

mean(movies_spread$Gross)

# ---- Keep or drop specific rows by rownumber with the slice() function ----

# 24. Remove row 4 using slice() function

slice(movies_spread, -4)

# 25. alternate way to do it is using filter() function, but that may not only remove one row: 

filter(movies_spread, Score > 5)

# 26. Practice: Remove row 5 using slice() function

# ---- Use mutate() to create a new column ---- 

# 27. Create a new column "Gross_Ranking" with values low, medium, or high depending on the Gross value.

mutate(movies_spread, Gross_Ranking = ifelse(Gross >= 0 & Gross < 50, "low", 
                                             ifelse(Gross > 50 & Gross < 100, "medium", 
                                                    "high")))


# 28. Save time and chain functions together using the pipe (%>%) operator

movies_spread %>%
  filter(Genre=="Comedy") %>%
  top_n(., 2, Gross)  # select the top 2 films by highest gross


# 29. Practice. Add the arrange() function at the end to order by highest Gross. Use the desc() function.
movies_spread %>%
  filter(Genre=="Comedy") %>%
  top_n(., 2, Gross) %>% 
  arrange(.,         )


# 30. More Practice. Now try some of the functions you have learned on the mtcars dataset.

mtcars
