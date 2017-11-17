#random create missing value function to occupy 2% of the data - Customized Function
p_func_2<-function(cc){cc[sample(c(TRUE, NA), prob = c(0.98,0.02), size = length(cc), replace = TRUE)]}
p_func_5<-function(cc){cc[sample(c(TRUE, NA), prob = c(0.95,0.05), size = length(cc), replace = TRUE)]}
p_func_10<-function(cc){cc[sample(c(TRUE, NA), prob = c(0.90,0.10), size = length(cc), replace = TRUE)]}
p_func_15<-function(cc){cc[sample(c(TRUE, NA), prob = c(0.85,0.15), size = length(cc), replace = TRUE)]}
p_func_20<-function(cc){cc[sample(c(TRUE, NA), prob = c(0.80,0.20), size = length(cc), replace = TRUE)]}
p_func_25<-function(cc){cc[sample(c(TRUE, NA), prob = c(0.75,0.25), size = length(cc), replace = TRUE)]}

#apply p_funct to iris data set
p<-as.data.frame(lapply(iris,p_func))

#summary of p
summary(p)

#knn imputation
library(VIM)

?kNN

#imputed missing values in specified colums
p_imputed<-kNN(p,variable = c("Sepal.Length","Sepal.Width"))
                 
#imputed all columns
p_imputed<-kNN(p)
summary(p_imputed)

#remove unwanted variables
p_imputed_remove_junc<-subset(p_imputed, select = Sepal.Length:Species)

summary(p_imputed_remove_junc)

