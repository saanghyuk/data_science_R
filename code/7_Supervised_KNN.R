install.packages("stringi",type="mac.binary")
install.packages("caret", dependencies = TRUE)
library(caret)

wine_data = read.csv(file.choose())


str(wine_data)
summary(wind_data)
table(wine_data$Class)
head(wine_data)
nrow(wine_data)
# Target = Class: 1, 2, 3
# we had to let R know that "Class" is not an INT. 
wine_data$Class <- as.factor(wine_data$Class)
str(wine_data)

# Train, Test Split
analdata <- wine_data

set.seed(2020)
# sample(nrow(analdata), nrow(analdata)*0.7)
# 표본 추출. sample(a, b) a 중 b개 뽑겠다. 
# In R, the indexing begins from 1.
datatotal <- sort(sample(nrow(analdata), nrow(analdata)*0.7))
datatotal

train <- wine_data[datatotal, ]
test <- wine_data[-datatotal, ]

train_x <- train[, 1:13]
train_y <- train[, 14]

test_x <- test[, 1:13]
test_y <- test[, 14]



# Train
ctrl <- trainControl(method='repeatedcv', number=10, repeats=5)
customGrid <- expand.grid(k=1:10)
knnFit <- train(Class ~ ., 
                data=train,
                method="knn", 
                trControl=ctrl, 
                preProcess=c("center", "scale"), 
                tuneGrid=customGrid, 
                metric="Accuracy")

knnFit
plot(knnFit)


# Predict
pred_test <- predict(knnFit, newdata=test)
confusionMatrix(pred_test, test$Class)


# Importance of Features
# scale : should the importance values be scaled to 0 and 100?
  
importance_knn <- varImp(knnFit, scale=FALSE)
plot(importance_knn)
