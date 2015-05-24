setwd("~/data/Machine Learning")
train<-read.csv("pml-training.csv",na.string=c("#DIV/0!","","NA"),row.names=1)
test<-read.csv("pml-testing.csv",na.string=c("#DIV/0!","","NA"),row.names=1)
na<-apply(train,2,function(x){sum(is.na(x))})
train<-train[,na==0]
train<-train[,-c(2:7)]


library(caret)
ctrl<-trainControl(method="cv",number=10)
mod1<-train(classe~.,data=train,method="knn",trControl=ctrl)
mod2<-train(classe~.,data=train,method="rf",trControl=ctrl,ntrees=200)

summary(mod1)
summary(mod2)

preds<-predict(mod2)
tab<-table(preds,train$classe)
prop.table(tab)
sum(diag(tab))/sum(tab)

