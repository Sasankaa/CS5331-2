#same p_func can be done as prodNA
iris.mis_2 <- prodNA(iris, noNA = 0.02)

#imputed 
#Knn
p_imputed_2_KNN<-kNN(iris.mis_2)


set.seed(111)
## 2 percent missing values
iris.mis_2_rf <- prodNA(iris, noNA = 0.02)
set.seed(222)
iris.imputed <- rfImpute(Species ~ ., iris.mis_2_rf)
set.seed(333)
iris.rf <- randomForest(Species ~ ., iris.imputed)


# load libraries
library(mlbench)
library(caret)

# prepare training scheme
control <- trainControl(method="repeatedcv", number=10, repeats=3)
# Knn - 
set.seed(7)
fit.knn_2 <- train(Species~., data=p_imputed_2, method="knn", trControl=control)
set.seed(7)
fit.rf_2 <- train(Species~., data=iris.imputed, method="rf", trControl=control)
set.seed(7)
fit.lda_2 <- train(Species~., data=p_imputed_2, method="lda", trControl=control)
# summarize differences between percentages
results <- resamples(list(knn_2=fit.knn_2, rf_2=fit.rf_2,lda_2=fit.lda_2))
summary(results)

# box and whisker plots to compare models performance
scales <- list(x=list(relation="free"), y=list(relation="free"))
bwplot(results, scales=scales)

# density plots of accuracy
scales <- list(x=list(relation="free"), y=list(relation="free"))
densityplot(results, scales=scales, pch = "|")


# dot plots of accuracy
scales <- list(x=list(relation="free"), y=list(relation="free"))
dotplot(results, scales=scales)

