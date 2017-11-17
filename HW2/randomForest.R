library(randomForest)
set.seed(111)
## 2 percent missing values
iris.mis_2_rf <- prodNA(iris, noNA = 0.02)
set.seed(222)
iris.imputed <- rfImpute(Species ~ ., iris.mis_2_rf)
set.seed(333)
iris.rf <- randomForest(Species ~ ., iris.imputed)
print(iris.rf)
