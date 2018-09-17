# Beginning R
# 9/21/18
# NCSU Libraries 
# Purpose: Exercise file to complete during the Beginning R workshop

# Section 1: Beginning Data Exploration Tasks

# 1. There are some data sets already loaded in R. Let's look at mtcars.
mtcars

# 2. See the first six rows of the data with head().
head(mtcars) # note: tail(mtcars) will give you the last six rows.

# 3. To see more datasets built into R, run data():
data()

## Let's do some data exploration tasks using the dataset mtcars. 
# 4. Get the dimensions of a dataset using dim().
dim(mtcars)

# 5. Get a quick statistical summary of a dataset using summary().
summary(mtcars)

# 6. Figure out what the variables are in a dataset using names()
names(mtcars)

# 7. Access one variable from a dataset using the $ to separate 
# the dataset name and the variable.
mtcars$mpg

# 8. Take the mean of one variable from a dataset using mean()
mean(mtcars$mpg)

# 9. Display the structure of mtcars using str()
# This is useful for seeing the data types of each variable.
str(mtcars)

# 10. See what type of R object mtcars is using class().
class(mtcars)

# 11. See what type of R object a variable is. 
class(mtcars$mpg)

# Note that mtcars is a data.frame object in R. Data frames are lists 
# of vectors of equal length. You can think of this as a spreadsheet-like
# tabular data structure. Many of the datasets that are built into R 
# are data frames. 

# 12. Practice. Find the dimensions of the dataset trees using dim().


# 13. Practice. Get a quick statistical summary of the dataset trees using summary(). 


# 14. Practice. Print the values of the Height variable in the dataset trees using $.


# 15. Practice. Use str() to find out the structure of trees.


# 16. Practice. Find the mean of the variable Girth in the trees dataset. 


# Section 2. Dataset modification: Adding/removing variables, subsetting, ordering

# 17. Let's create a new variable to add to the trees dataset: ghRatio
# This variable will be the ratio of Girth to Height.

trees["ghRatio"] = trees$Girth/trees$Height

trees  # run this to check that the new variable was added

# 18. Let's remove the variable Volume.

trees$Volume = NULL

trees 

# 19. Let's create a data subset called 'bigTrees' of trees with Girth > 15.0

bigTrees <- subset(trees, Girth > 15.0)

bigTrees

# 20. Let's sort the bigTrees dataset by Girth in ascending order (smallest to largest).

bigTrees <- bigTrees[order(bigTrees$Girth),] 

# 21. Now sort by Girth in descending order (largest to smallest).
# Use the - sign to make it descending order.

bigTrees <- bigTrees[order(-bigTrees$Girth),] 

# 22. Practice. Let's look at the dataset beaver1. This dataset measures a beaver's
# body temperature data. For more info: https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/beavers.html


# 23. Practice. Create a data subset called activeBeaver, where activ == 1. 
# Note: == is an R logical operator. For more info, see: https://www.statmethods.net/management/operators.html

activeBeaver <- 
  
# 24. Practice. Find the mean of the temp variable in activeBeaver. Store the value in a variable meanTemp.

meanTemp <- 

# 25. Practice. Create a new variable in activeBeaver, diffMean, that calculates how far 
# the temp variable is from the mean. Use this formula: activeBeaver$temp - meanTemp


# 26. Practice. Remove the variable day from the activeBeaver dataset. 



# Section 3. Quick graphing using plot() functions 

# 27. Let's use the beaver1 dataset. 
# Make a scatter plot using plot() with x=time and y=temp
plot(beaver1$time,beaver1$temp)

# 28. Make a histogram of the temp variable.
hist(beaver1$temp)

# 29. Put the two plots side by side.
par(mfrow=c(1,2)) #this creates one plot with 2 panels
plot(beaver1$time, beaver1$temp, main="scatterplot")
hist(beaver1$temp, main="histogram")

par(mfrow=c(1,1)) # reset back to single plot layout

# 30. Practice. Using the mtcars dataset, make a scatterplot
# of the variables mpg and hp. 


# 31. Practice. Using the mtcars dataset, make a histogram of mpg.



# 32. Practice. Place the scatterplot and histogram side by side.



# Section 4. Loading in an external R package and Excel file. 

# 33. We have been using built-in functions in R. What other built-in functions are there?
builtins()

# 34. look up the documentation for a function using ?
?attributes

# 35. Let's install an R package which has more functions we can use. 
# R packages are external libraries of functions that extend the capability of R. 

install.packages("readxl")

# 36. Load the package readxl into the current R session. 
library(readxl)

# Now we're going to read in the excel file.
# 37. First, find out what R thinks your working directory is.
getwd()

# 38. Next, set your working directory to the folder where your dataset is.
# In the Files tab, make sure you are in the folder where your dataset is. If you aren't,
# navigate to that folder by clicking the ... button.
# Once in the folder, click More > Set as Working Directory.

# 39. Check your wd again. You should now be in the correct folder.
getwd()

# 40. Read in the file.
airbnb <- read_excel("airbnb.xlsx")

airbnb


# Section 5. Data Exporting

# 41. Create a subset of airbnb where Room Type equals Entire home/apt. 
airbnb_entire <- subset(airbnb, `Room Type` == "Entire home/apt") 

airbnb_entire

# 42. Export this data subset to a CSV file. Make sure your working directory is set to the folder
# where you want the data to be saved OR you have put in the full file path.

write.csv(airbnb_entire, file="airbnb_entire_homes.csv")

# 43. Practice. Create a subset of airbnb where Rating > 95. Then export the file as 
# "airbnb_highest_ratings.csv". 



# Section 6. Correlation and Building a Linear Model 

# 44. Is there a relationship between number of reviews and the rating?
# Create a scatter plot with filled dots.
plot(airbnb$NumReviews, airbnb$Rating, pch=19)

# 45. Fit the scatter plot with a LOESS curve.
scatter.smooth(airbnb$NumReviews, airbnb$Rating, pch=19)  # scatterplot

# 46. Calculate the correlation between NumReviews (x) and Rating (y)
cor(airbnb$NumReviews, airbnb$Rating)

# 47. Build a linear model. Build a linear model. lm(Response ~ Terms, dataset)
linearMod <- lm(Rating ~ NumReviews, data=airbnb)

# 48. See the model summary. Evaluate p-value for significance.
summary(linearMod)

# 49. Practice. Calculate the correlation between Beds (x) and Price (y).


# 50. Practice. Build a linear model using the Price (response) and Beds (term) variables. Name it linearBP.


# 51. Practice. See the model summary. Is there a significant relationship between these variables?




# Workshop Evaluation
# Please visit https://go.ncsu.edu/libeval to evaluate this workshop before you leave! THANK YOU!

# Resources
# For more help with base R, please see the Base R Cheat Sheet: https://www.rstudio.com/wp-content/uploads/2016/05/base-r.pdf
# For cheatsheats on other popular R packages, visit https://www.rstudio.com/resources/cheatsheets/
# For a free intro to R online course, visit https://www.datacamp.com

# Future workshops
# Please see https://go.ncsu.edu/workshops to see upcoming workshops at NCSU Libraries