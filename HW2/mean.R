#random create missing value function to occupy 2% of the data
p_func<-function(cc){cc[sample(c(TRUE, NA), prob = c(0.98,0.02), size = length(cc), replace = TRUE)]}

#apply p_funct to iris data set
p<-as.data.frame(lapply(iris,p_func))

#summary of p
summary(p)

#select sepal length as a vector
p_mean <-as.vector(p$Sepal.Length)

#mean imputation
p_mean[is.na(p_mean)] <- mean(p_mean[!is.na(p_mean)])
