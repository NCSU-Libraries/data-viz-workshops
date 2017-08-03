# run these two lines first to install and load the tidyverse package:
install.packages("tidyverse")
library(tidyverse)
 
# 1. Learn more about the mpg dataset. Run the following code:

?mpg

# 2. Examine the first few rows of the mpg data set. Run the following code:

head(mpg)

# 3. Create a scatterplot with ggplot2, plotting engine displacement on the X-axis 
# and highway mileage on the Y-axis. Run:
## Make sure to put the "+" sign at the end of the line, not at beginning of next line

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# 4. Create a scatterplot plotting the number of cylinders (cyl) as x and highway mileage (hwy) on the y-axis. 
# Type the code in the lines below. Run the code to test it!



# 5. Make a scatterplot of disp=x and hwy=y with class mapped to the color aesthetic. Run:

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) + theme_classic()

# 6. Make the same scatterplot as the previous example, but map drv to color.
# Type the code in the lines below. Then run the code to test it.



# 7. Substitute another aesthetic in place of color (size, shape, or alpha). 
#Run the code:

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = drv))

# 8. Facet_wrap() creates subplots. Run this code to see what faceting does:

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

# 9. Practice Faceting. Substitute out class for another variable 
# in the dataset. Ex: trans, drive, or cyl. Run the code!

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

# 10. Facet grids allow for an extra dimension of faceting. Run this code to see what facet_grid() does:

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(class ~ cyl)

# Compare above result with the code below. What do the empty cells in the above graph mean?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = class, y = cyl))

# 11. Apply what you have learned! Create a chart with the diamonds data set using ggplot2.
# Get to know the dataset first using ?diamonds and head(diamonds) commands
# Decide on aesthetic mappings and whether you want to facet your chart.
# Type the code below:

?diamonds
head(diamonds)


# 12. Adding multiple layers to a graph. Run this code:

ggplot(data = diamonds) + 
  geom_point(mapping = aes(x = carat, y = price, color=cut)) +
  geom_smooth(mapping = aes(x = carat, y = price))


# 13. What is the difference between # 12 and this code? Run it to see:

ggplot(data = diamonds, mapping = aes(x = carat, y = price)) + 
  geom_point(aes(color=cut)) +
  geom_smooth()


# 14. Now use the shorthand method to make the following code more efficient: 

ggplot(data = diamonds) + 
  geom_point(mapping = aes(x = carat, y = price, color=clarity)) +
  geom_smooth(mapping = aes(x = carat, y = price))

# Type the shorthand version here:



# 15. Position adjustments. Run the following code to see the effect of alpha = 1/5 and position = "jitter"
ggplot(data =diamonds, mapping = aes(carat, price)) + 
  geom_point(mapping = aes(color=clarity, alpha=1/5), position="jitter") +
  geom_smooth()

# 16. Bar chart example. Run this example in the code to create a bar chart:

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))


# 17. Now create a bar chart with x = clarity. 


# 18. Add labels to inform your audience about the graph 
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = FALSE) +
  labs(
    title = "Fuel efficiency generally decreases with engine size",
    subtitle = "Two seaters (sports cars) are an exception because of their light weight",
    caption = "Data from fueleconomy.gov"
  )

# 19. In the previous example, add x = "Engine displacement (L)", y = "Highway fuel economy (mpg)", and colour = "Car type" in the lab


# 20. Save plot using ggsave(). Assign graph to a variable name.
# Reference: http://ggplot2.tidyverse.org/reference/ggsave.html 
# Run this code:

my_graph <-ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = FALSE) +
  labs(
    title = "Fuel efficiency generally decreases with engine size",
    subtitle = "Two seaters (sports cars) are an exception because of their light weight",
    caption = "Data from fueleconomy.gov",
    x = "Engine displacement (L)",
    y = "Highway fuel economy (mpg)",
    colour = "Car type"
  ) 

my_graph #print the graph to see it

# Exercise 21. Use a basic ggsave function to save graph as a .PNG file

ggsave("graph.png", my_graph) # this will save the image file to your current working directory. If you want to save to a different place, add path information before the file name. Ex: "~/Documents/Project_Folder/graph.png"

# Exercise 22. Re-save graph as a different size in order to see it all. Units are in inches

ggsave("graph_resized.png", my_graph, width = 5, height = 5, units = "in")

# Exercise 23. Save to publication-quality .tiff file

ggsave("graph.tiff", my_graph, width=5, height=5, units="in", dpi=600)   

# Advanced labeling example: this example shows how to label a stacked bar chart
# Label the total number of cars from each manufacturer in the mpg dataset and place 
# those labels in a bar plot showing proportion of different classes for each manufacturer..

manufacturer <- mpg$manufacturer  # creates a variable "manufacturer" that is the manufacturer column in the data frame

total_cars = as.data.frame(count(mpg, manufacturer, y=1))  # counts the total cars per manufacturer. Also creates a y column with value 1 for each row.

total_cars

ggplot(mpg, aes(x=manufacturer)) + 
  geom_bar(aes(fill=class), position="fill") +
  scale_y_continuous(name="proportion") + 
  geom_text(data=total_cars, aes(x=manufacturer, y=y, label=n), size=4, vjust = -0.2)

# Advanced exercise: Now create a similar bar plot using the diamonds dataset 
# labeling the total number of diamonds for each type of clarity and showing the 
# proportion of their cut types.
