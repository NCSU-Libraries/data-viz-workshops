# Run these lines first to install and load required packages:

install.packages("ggplot2")
install.packages("dplyr")
install.packages("readr")

library(ggplot2)
library(dplyr)
library(readr)

# Section 1. Scatterplots and faceting
# 1. Learn more about the mpg dataset. Run the following code:

?mpg

# 2. Examine the first few rows of the mpg data set. Run the following code:

head(mpg)

# 3. Create a scatterplot with ggplot2, plotting engine displacement on the X-axis 
# and highway mileage on the Y-axis. Make sure to put the "+" sign at the end of the line, 
# not at beginning of next line

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# shortcut way of writing it:
ggplot(mpg) + 
  geom_point(aes(displ, hwy)) 


# 4. Create a scatterplot plotting the number of cylinders (cyl) as x 
# and highway mileage (hwy) on the y-axis. 
# Type the code in the lines below. Run the code to test it!

ggplot(mpg) + 
  geom_point(aes(cyl, hwy))

# 5. Make a scatterplot of x=displ and y=hwy. Color the dots by class using color=class inside aes(). 

ggplot(mpg) + 
  geom_point(aes(displ, hwy, color=class)) 

# 6. Practice. Make the same scatterplot as the previous example, but set color=drv.
# Type the code in the lines below. Then run the code to test it.

ggplot(mpg) + 
  geom_point(aes(displ, hwy, color=drv)) 

# 7. Practice. Substitute another aesthetic in place of color (size, shape, or alpha).

ggplot(mpg) + 
  geom_point(aes(displ, hwy, shape=class)) 


# 8. Facet_wrap() creates subplots. Run this code to see what faceting does:

ggplot(mpg) + 
  geom_point(aes(displ,hwy)) + 
  facet_wrap(~ class, nrow=2)


# 9. Practice Faceting. Using the same scatter plot as in #8, 
# facet on the cyl variable. 
ggplot(mpg) + 
  geom_point(aes(displ,hwy)) + 
  facet_wrap(~ cyl, nrow=2)


# 10. Facet grids allow for an extra dimension of faceting. 
# Run this code to see what facet_grid() does:
ggplot(mpg) + 
  geom_point(aes(displ,hwy)) + 
  facet_grid(class ~ cyl)


# 11. Practice. Create a scatterplot chart with the diamonds dataset 
# Show the relationship between depth (x variable) and price (y variable). 
# Facet by clarity using facet_wrap().

?diamonds
head(diamonds)

ggplot(diamonds) + geom_point(aes(depth, price)) + 
  facet_wrap(~clarity)


## Section 2. Adding graph layers

# 12. Add multiple layers to a graph. Run this code:

ggplot(diamonds) + 
  geom_point(aes(carat, price, color=clarity)) +
  geom_smooth(aes(carat, price))

# Notice that you had to type aes(carat, price) twice? That's not efficient.
# Here's a better way: 

ggplot(diamonds, aes(carat, price)) + # whatever is in ggplot() applies to all layers
  geom_point(aes(color=clarity)) +
  geom_smooth()

# 13. Position adjustments. Run the following code to see the effect of alpha = 1/5 and position = "jitter"
# add facet_wrap to break up the data into small multiples plots 

ggplot(diamonds, aes(carat, price)) + 
  geom_point(aes(color=clarity, alpha=1/5), position="jitter") + 
  geom_smooth() + 
  facet_wrap(~clarity)


## Section 3. Bar charts and histograms

# 14. Bar chart example. Run this example in the code to create a bar chart:

ggplot(diamonds) +
  geom_bar(aes(x=cut))  # cut is a categorical variable

# 15. Now create a bar chart with x=clarity. 

ggplot(diamonds) +
  geom_bar(aes(x=clarity)) # clarity is a categorical variable

# 15B. Flip the bars with coord_flip() 
ggplot(diamonds) +
  geom_bar(aes(x=cut)) + 
  coord_flip()


# 16. Create a histogram of price.
ggplot(diamonds) + 
  geom_histogram(aes(price))


# 17. Change the binwidth on the histogram, add color and theme.
ggplot(diamonds) + 
  geom_histogram(aes(price), binwidth = 500, fill="black", col="white") + theme_classic()


# 18. Practice. Create a histogram of the depth variable. 
# Experiment with binwidth and theme.
ggplot(diamonds) + 
  geom_histogram(aes(price), binwidth=1000, fill="black", col="white") + theme_classic()


## Section 4. Editing scales

# 19. Change the tick marks on the x-axis from defaults.

ggplot(diamonds) + 
  geom_histogram(aes(price), binwidth = 500, fill="black", col="white") +
  scale_x_continuous(breaks=seq(0,20000,by=3000)) + 
  theme_classic()

?scale_x_continuous

## Section 5. Adding labels and saving your graph

# 20. Add labels to inform your audience about the graph 

ggplot(diamonds) + 
  geom_histogram(aes(price), binwidth = 500, fill="black", col="white") +
  scale_x_continuous(breaks=seq(0,20000,by=3000)) + 
  theme_classic() +
  labs(
    title = "Count of Diamonds by Price",
    subtitle = "Prices are in U.S. Dollars (n=53940)", 
    y=""
  )

# 21. Save plot using ggsave(). Assign graph to a variable name.
# Reference: http://ggplot2.tidyverse.org/reference/ggsave.html 
# Run this code:

my_graph <- ggplot(diamonds) + 
  geom_histogram(aes(price), binwidth = 500, fill="black", col="white") +
  scale_x_continuous(breaks=seq(0,20000,by=3000)) + 
  theme_classic() +
  labs(
    title = "Count of Diamonds by Price",
    subtitle = "Prices are in U.S. Dollars (n=53940)", 
    y=""
  )

my_graph #print the graph to see it

# 22. Use a basic ggsave function to save graph as a .PNG file

ggsave("graph.png", my_graph) # this will save the image file to your current working directory. If you want to save to a different place, add path information before the file name. Ex: "~/Documents/Project_Folder/graph.png"

# 23. Re-save graph as a different size in order to see it all. Units are in inches

ggsave("graph_resized.png", my_graph, width=5, height=5, units="in")

# 24. Save to publication-quality .tiff file

ggsave("graph.tiff", my_graph, width=5, height=5, units="in", dpi=600)   

# Section 6. Read in movies data and make some graphs.
# check out the ggplot2 cheatsheet: Help > Cheatsheets

# 25. Read in some data from a data file. Make sure to set your working directory first
# to the folder with the dataset.

movies <- read_csv("movies.csv") 

head(movies)

# 26. Make a scatter plot of gross/1000000 (x) and imdb_score (y).
ggplot(movies, aes(gross/1000000, imdb_score)) + geom_point()

# 27. In the previous chart, facet_wrap() using the content_rating variable 
ggplot(movies, aes(gross/1000000, imdb_score)) + geom_point() +
  facet_wrap(~content_rating)

# 28. Make a histogram of imdb_score (x). 
ggplot(movies, aes(imdb_score)) + geom_histogram() 

# 29. Set binwidth=.5, fill="black, col="white in aes()
ggplot(movies, aes(imdb_score)) + geom_histogram(binwidth=.5, fill="black", col="white") 

# 30. Add theme_classic() to the previous histogram. 
ggplot(movies, aes(imdb_score)) + 
  geom_histogram(binwidth=.5, fill="black", col="white") +
  theme_classic()

# 31. Give the histogram you just made a title.
ggplot(movies, aes(imdb_score)) + 
  geom_histogram(binwidth=.5, fill="black", col="white") +
  theme_classic() +
  labs(title="Distribution of IMDb Score Among Top-Grossing Films")

# 32. Change the x-axis and y-axis titles to blank using y="" and x=""
#in labs().

ggplot(movies, aes(imdb_score)) + 
  geom_histogram(binwidth=.5, fill="black", col="white") +
  theme_classic() +
  labs(title="Distribution of IMDb Score Among Top-Grossing Films", 
       y="", 
       x="")

# 33. Save the plot to a variable called imdb_graph. 
#Then save it to the file "imdb.png" using ggsave() with width=5,
#height=5, units="in"

imdb_graph <- ggplot(movies, aes(imdb_score)) + 
  geom_histogram(binwidth=.5, fill="black", col="white") +
  theme_classic() +
  labs(title="Distribution of IMDb Score Among Top-Grossing Films", 
       y="", 
       x="")

ggsave("imdb.png", imdb_graph, width=5, height=5, units="in")

