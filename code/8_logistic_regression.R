#install.packages("caret", dependencies=TRUE)
library(caret)

heart_disease = read.csv(file.choose())
str(heart_disease)

#train <- heart_disease[datatotal, ]
#test <- heart_disease[-datatotal, ]

heart_disease$Class <- as.factor(heart_disease$Class)
unique(heart_disease$target)


## 연속형 독립변수 표준화
heart_disease$age <- scale(heart_disease$age)
heart_disease$trestbps <- scale(heart_disease$trestbps)
heart_disease$chol <- scale(heart_disease$chol)
heart_disease$thalach <- scale(heart_disease$thalach)
heart_disease$oldpeak <- scale(heart_disease$oldpeak)
heart_disease$slope <- scale(heart_disease$slope)

## 범주형 독립변수 as.factor
newdata <- heart_disease
factorVar <- c("sex", "cp", "fbs", "restecg", "exang", "ca", "thal")
newdata[ ,factorVar]
newdata[ ,factorVar] = lapply(newdata[ ,factorVar], factor)
newdata[, "target"] = as.factor(newdata[, "target"])

## Train Test Split
set.seed(2020)
datatotal <- sort(sample(nrow(newdata), nrow(newdata)*.7))
train <- newdata[datatotal,]
test <- newdata[-datatotal,]

train_x <- train[,1:12]
train_y <- train[,13]

test_x <- test[,1:12]
test_y <- test[,13]



## LogitBoost 
# 약한 모형을 더하는 방식. 
str(train)
ctrl <- trainControl(method="repeatedcv",repeats = 5)  
logitFit <- train(target ~ ., 
                  data = train, 
                  #method = "LogitBoost",
                  method = "regLogistic",
                  trControl = ctrl, 
                  metric="Accuracy")
# 학습을 11번 반복했을때 가장 높은 정확도가 나타난다. 
logitFit
plot(logitFit)

pred_test <- predict(logitFit, newdata=test)
confusionMatrix(pred_test, test$target)

importance_logit <- varImp(logitFit, scale=FALSE)
plot(importance_logit)


