#random create missing value function to occupy 2% of the data
p_func<-function(cc){cc[sample(c(TRUE, NA), prob = c(0.90,0.10), size = length(cc), replace = TRUE)]}

#apply p_funct to iris data set
p<-as.data.frame(lapply(iris,p_func))
#summary of p
summary(p)
head(p)
#using magrittr, simputation libraries
library(magrittr)
library(simputation)

#imputes Sepal.Width and Sepal.Length by regression using the values of Petal.Width and Species
p %>%  impute_lm(Sepal.Width + Sepal.Length ~ Petal.Width + Species) -> p_imputed
summary(p_imputed)
#impute missing Species using decision tree model
p_imputed %>% impute_cart(Sepal.Length~ .) -> p_imputed
p_imputed %>% impute_cart(Sepal.Width ~ .) -> p_imputed


#impute missing Species using decision tree model
p_imputed %>% impute_cart(Petal.Length ~ .) -> p_imputed
p_imputed %>% impute_cart(Petal.Width ~ .) -> p_imputed 
summary(p_imputed)

#install.packages("missForest")
library(missForest)
#load and shuffel
x <- p_imputed[sample(1:nrow(iris)),]

#select train and test data
train <- p_imputed[1:100,]
test <- p_imputed[101:150,]

#regression
p_reg <- lm(Petal.Width ~ Petal.Length -1, data = train)

#test
test[1:5,]$Petal.Width

#predict
predict(p_reg, test[1:5,])

#calculate Root Mean Square Error (RMSE)
RMSE <- function(predicted, true) mean((predicted-true)^2)^.5
RMSE(predict(p_reg, test), test$Petal.Width)

#compare predicted and actual values
plot(test[,"Petal.Width"], predict(p_reg, test),
     xlim=c(0,3), ylim=c(0,3), xlab = "actual", ylab = "imputed",
     main = "Petal.Width")
abline(0,1, col="red")
