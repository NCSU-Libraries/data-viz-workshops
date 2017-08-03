#Example 1: Does Money Buy Happiness? Correlation Between Salary and Employee Satisfaction
#Regression (R Code) 


# Install Required package
# install.packages("caret")
library(caret)

#Create a tidy dataset:
#  What makes this dataset tidy?

# earnings  - Employee Earnings in dollars per day
# s_rating  - Employee Satisfaction rating
# emp_data  - data.frame(earning, s_rating)
earnings <- c(120, 100, 700, 200, 60, 20, 200, 130, 150, 160, 170, 180, 190, 210, 220, 400, 550, 670, 695, 300)

s_rating<- c(50, 60, 80, 75, 50, 70, 75, 60, 50, 65, 70, 71,80, 82, 85, 80, 88, 90, 90, 60)

emp_data  <- data.frame(earnings, s_rating)

emp_data 
dim(emp_data)


set.seed(222)
inTrain <- createDataPartition(y= emp_data$s_rating, p=0.6, list=FALSE)

training <- emp_data[inTrain,]
test <- emp_data[-inTrain,]
head(training)
summary(training)

dim(training)
dim(test)

#So that when analysis is reproduced, a similar result is gotten.

#Exploratory Data Analysis

par(cex=0.8)
plot(earnings, s_rating, col = s_rating, main="Machine Learning")


#Create Model:

reg_model <- lm(s_rating ~ earnings, data=training)
summary(reg_model)

par(cex=.8)
plot(training$earnings, training$s_rating, col = s_rating, main="Machine Learning")

abline(reg_model)  

# function to draw a regression line based on the model the machine created called reg_model

## From y = a + bx + ei (ei = error measures factors that we didn’t take into consideration about the model)
## Our model is: Satisfaction = 0.04056(Earning) + 59.46977  

# What are the coefficients
# TEST	
coef(reg_model)[1] + coef(reg_model)[2] * (test$earnings)

#OR
# We could create a function to test our model
predict_happiness <- function(x){
  Coef_1 = 0.04056
  Coef_2 = 59.46977
  Result<- (Coef_1 * x) + Coef_2 
  percent<- "%"
  cat(sprintf("The employee should be %s%s satisfied", Result, percent))
}

# Use our predict_happiness function to predict how satisfied the employee will be if he is paid 200, 400, 1200 etc. dollars per day
predict_happiness(200)

#OR we could use the predict command from caret
# pred_rating stands for Predicted satisfaction rating
pred_rating <- predict(reg_model, test)

# Test data vs predicted data helps us to see how accurate our model is 
print(data.frame(test$s_rating, pred_rating))

#We can see that our model (the regression line) is not so precise
# Check the accuracy of model visually

par(mfrow=c(1,2))
plot(training$earnings, training$s_rating, col = s_rating, main="Regression Modelling")
abline(reg_model)  
plot(test$earnings, test$s_rating, col = s_rating, main="Regression Modelling")
abline(reg_model)  

# Check errors RMSE (root-mean-square deviation) – calculate mean squared errors on the test sets
#Measures deviation of predicted points to original value

sqrt(sum((predict(reg_model, test) - test$s_rating)^2))


