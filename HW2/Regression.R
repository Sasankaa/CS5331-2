#random create missing value function to occupy 2% of the data
p_func<-function(cc){cc[sample(c(TRUE, NA), prob = c(0.98,0.02), size = length(cc), replace = TRUE)]}

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

#impute missing Species using decision tree model
p_imputed %>% impute_cart(Species ~ .) -> p_imputed

summary(p_imputed)

