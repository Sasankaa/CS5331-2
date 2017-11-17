#set seed
set.seed(9850)
#random numbers generation
gp<-runif(nrow(iris))
#mix irish data
knn_iris<-iris[order(gp),]

head(knn_iris)
str(knn_iris)
summary(knn_iris)
#normalize knn_iris
normalize<- function(x)
{
  return( (x-min(x))/(max(x)-min(x)) )
}

knn_iris_normalize<- as.data.frame(lapply(knn_iris[,c(1,2,3,4)], normalize))
str(knn_iris_normalize)

#train and test
iris_train<- knn_iris_normalize[1:129,]
iris_test<-knn_iris_normalize[130:150,]

train_target <- knn_iris[1:129, 5]
test_target <-knn_iris[130:150,5]

require(class)
?knn1

model1<-knn(train=iris_train, test=iris_test, cl=train_target, k=13)
model1

table(test_target,model1)

                                   