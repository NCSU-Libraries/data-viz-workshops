#The following packages are necessary

install.packages("ISLR")
install.packages("randomForest")
install.packages("ggplot2")
library(ISLR)
library(ggplot2)
library(caret)
library(randomForest)

# Know more about the Wage dataset
data(Wage)
summary(Wage)
dim(Wage)
colnames(Wage)
?Wage

# Some feature engineering, we don;t need logwage
Wage<- subset(Wage, select=- c(logwage))
head(Wage)
# Some Exploratory data analysis a.k.a. visualization
qplot(age, wage, data=Wage, colour = race)
qplot(age, wage, data=Wage, colour=education)


#Convert to numeric in order to use the cor function
Wage_x <- data.frame(as.numeric(Wage$age), as.numeric(Wage$education), as.numeric(Wage$jobclass),as.numeric(Wage$maritl), as.numeric(Wage$race), as.numeric(Wage$health))
# Helps to find correlation pf each variable with wage
# The higher the value, the more correlated the variable is to what we want to predict
cor(Wage_x, Wage$wage)


inTrain<- createDataPartition(y = Wage$wage, p=0.7, list= FALSE)
training<- Wage[inTrain,]
testing<- Wage[-inTrain,]
dim(training); dim(testing)

qplot(age, wage, data=training)
qplot(age, wage, data=training, colour=education)

set.seed(150)

rf_model <- randomForest(wage ~ age + jobclass + education, data = training, importance = TRUE, ntree=200)

#PRINT OUT to check RMSE

print(rf_model)

#Implementing your predictor on test data and comparing it to real outcome
pred<- predict(rf_model, testing)
qplot(wage, pred, colour=year, data=testing)

# To check accuracy
postResample(testing$wage, pred)
# Compare actual test wage values with predicted wage values
compare_result <- data.frame(testing$wage, pred)
head(compare_result) 


# Check what variables affect our model the most and what variables to leave out in future analysis
importance(rf_model)
varImpPlot(rf_model)

# We can't leave out any of the above, we might add more variables to it
