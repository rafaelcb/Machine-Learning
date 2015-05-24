setwd("~/data/Machine Learning")
train<-read.csv("pml-training.csv",na.string=c("#DIV/0!","","NA"))
test<-read.csv("pml-testing.csv",na.string=c("#DIV/0!","","NA"))
na<-apply(train,2,function(x){sum(is.na(x))})
train<-train[,na==0]


library(caret)
mod1<-train(classe~.,data=train,method="rpart")
library(rpart.plot)
prp(mod1$finalModel)