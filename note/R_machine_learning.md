# Machine Learing



[KNN](##KNN)
[Logistic Regression](##Logistic Regression)




- #### 지도학습 vs 비지도학습 

  ![3_1](./materials/3_1.png)	

  ​	![3_1](./materials/3_2.png)

  

  - 데이터전처리 

    **Standardization** : 0을 중심으로 펼쳐진다. 

    ![3_1](./materials/3_3.png)

    **Min-Max Scaling** : 0과 1 사이로 모든 값이 다 들어온다. 

    ![3_1](./materials/3_4.png)

    

    

  - 모형평가

    [reference](https://yngie-c.github.io/machine%20learning/2020/05/01/val_eval/)

    ![3_1](./materials/3_5.png)

    

    ![3_1](./materials/3_6.png)
    
    

  ![3_1](./materials/3_7.png)

  ​			![3_1](./materials/3_8.png)

  

  ![3_1](./materials/3_9.png)

  ![3_1](./materials/3_10.png)

  ![3_1](./materials/3_11.png)

  ​		
  
  ​				
  - 오버피팅
  
    ![3_1](./materials/3_12.png)
  
    ​		![3_1](./materials/3_13.png)
  
    
  
  - 교차검증(Cross-Validation)
  
    
  
    ​	![	](./materials/3_14.png)
  
    ​		**Test/Train set 으로 분리**. 그런데, 문제가 또 있음. 테스트 데이터가 달라지면 또 어떻게 될지 알 수가 없음.  한번 더 나눈다. Training Data를 한번 더 나눈다. **validation data** 
  
    ​		![3_1](./materials/3_16.png)
  
    ​		처음에 Training Data로 모형을 만들고, Validation Data로 모형을 평가하고 수정을 한다. **Validation Data는 파라미터 수정용.** Validation Data를 가지고 만든 최종 모델을 가지고, Test한다.  ![3_1](./materials/3_17.png)
  
    ​			**Leave-One-Out Cross Validation**  딱 하나만 남긴다는 것. 트레이닝 데이터가  N개의 데이터가 있으면, 딱 1개만 validation data로 쓰고, 나머지를 validation데이터로. 그럼 N번 평가 가능. ![3_1](./materials/3_18.png)
  
    ​	**K-fold Cross Validation**: 테스트 데이터셋을 총 K개로 나눈다. 그중 하나를 validation 셋으로 놓는다. 5개로 나눴으면, 총 5번 validate 테스트 가능하지. 	![3_1](./materials/3_19.png)
  
    ​				**Stratified k-fold cross validation**: K-fold랑 다른점은,  이건 이제 k개로 쪼개는데, 비율을 유지시키는 것. ![3_1](./materials/3_20.png)
  
    ​				![3_1](./materials/3_21.png)
  
    ​	![3_1](./materials/3_22.png)
  
    ​	



## KNN

- #### K최근접 이웃 - 개념 이해

  - [Reference](https://ysyblog.tistory.com/74)

  - 가장 가까이 있는 데이터 클래스에 속한다고 보는 방법
  - 가까이 있는 데이터 1개를 보면 1-최근접 이웃
  - 가까이 있는 데이터 k개를 보면 k-최근접 이웃
  - 유클리디안 거리를 사용하므로 피쳐는 연속형 변수이어야 함.

  가장 가까운거 K개를 보고 내가(빨간점) 어느 집단인지 판단하겠다는 것.

  ![4_1](./materials/4_1.png)

  **그럼 가깝다는 것이 무엇인가? 거리의 개념**

  ![4_1](./materials/4_2.png)

  **N차원에서는?**

  ![4_1](./materials/4_3.png)

  그럼 거리를 잴 수 있는데 뭐 어떻게 한다는거야?

  가장 가까운 K개를 찾아보는 거야. 그리고 나서, 다수결로 판단한다는 것. 

  ![4_1](./materials/4_4.png)



- #### 구현

  ```R
  install.packages("caret", dependencies=TRUE)
  library(caret)
  ```

  - trainControl(): 데이터 훈련(train)과정의 파라미터(parameter) 설. 

    *아래 코드는 10-fold cross validation 을 5번 반복하여 가장 좋은 후보의 파라미터 그리드를 찾게 해주는 일종의 장치를 만드는 코드이다.* 즉, 10개로 나눈 K-fold를 5번 반복하며, 그 중에 가장 좋은 파라미터를 사용하겠다는 것. 

    ```
    trainControl(
    	method = “repeatedcv”, # cross-validation 반복
    	number= 10, # CV하는데 몇개로 나눌래. 
    	repeats = 5 # cv 반복횟수
    
    )
    
    ```

    ![4_1](./materials/4_5.png)

    ​	KNN의 K값을 넣어주는 것. 1:10을 넣어주면, K를 1에서 10까지 고려하겠다는 것. ![4_1](./materials/4_6.png)

    Class : "`타겟~피쳐`"타겟변수와 feature(**~.** 다 넣겠다는 소리. )

    Metric은 모형평가 방식. 주로, `Accurcy`와 `Kappa`를 주로 사용한다. 

    ![4_1](./materials/4_7.png)





- #### 결과 해석

  ![4_1](./materials/4_8.png)

  ​	**기대 정확도?** 동전을 던진다고 해보자. 동전 앞면 나올 확률 1/2, 뒷면 나올 확률 1/2. 이게 바로 기대 정확도야.  

  ​	![4_1](./materials/4_9.png)

  ​	![4_1](./materials/4_10.png)

  ​	![4_1](./materials/4_11.png)

  #### 	Accuracy VS Kappa statistic

  ​	![4_1](./materials/4_12.png)

  

- #### 실습

  중요한 것은, KNN을 구하는데 feature에 continuous가 아닌 feature가 섞여 있으면, 그때는 distance를 구하기가 어렵다. 조심할 것. 

  **단위도 확인할 것. 표준화는 항상 필수.**

   ```R
   
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
   
   ```

  KNN에서는 하이퍼파라미터가 별로 없어. K갯수가 하이퍼파라미터. K=5인게 짱이라는 것. 각각 하이퍼파라미터에 대해서 10개짜리 k-fold를 5번씩 돌리면서 실험한 결과가 아래 나오는 것. ![4_1](./materials/4_13.png)

  ​	

  ​	![4_1](./materials/4_14.png)



  - 예측

    ```R
    # Predict
    pred_test <- predict(knnFit, newdata=test)
    confusionMatrix(pred_test, test$Class)
    ```

    ![4_1](./materials/4_15.png)

    ​		표 하단에 보이는, Sensitivity등의 값들 위에서 배운 그것들 그대로 나와있는 거야. 

    

     - 변수중요도 의미. 

       어떤 feature가 가장 중요한지. 

       **각 class별로 어떤 Feature가 중요한지를 보여준다.** 

       ```R
       # Importance of Features
       # scale : should the importance values be scaled to 0 and 100?
         
       importance_knn <- varImp(knnFit, scale=FALSE)
       plot(importance_knn)
       ```

    ​	![4_1](./materials/4_16.png)





##Logistic Regression

- 종속변수범위가 정해져있다. 

  ![5_1](./materials/5_1.png)

  ​	![5_1](./materials/5_2.png)

  ​	![5_1](./materials/5_3.png)

  ​	선형회귀 분석은, 선형 직선이 그려진다. 거기서 종속변수에 변형을 시킨다. 

  ​	![5_1](./materials/5_4.png)

  ​	![5_1](./materials/5_5.png)

  ​		![5_1](./materials/5_6.png)

  ​				![5_1](./materials/5_7.png)

  ​					![5_1](./materials/5_8.png)

  ​		![5_1](./materials/5_9.png)



- #### 구현

  ![5_1](./materials/5_10.png)

  

Boosted Logistic Regression은 약한 분류기를 여러개 더하는 것. 각각의 feature에 대해서 logistic 식을 만들고(feature를 하나 쓴 것), 이런 약한 분류기를 더해가서 합쳐나가는 것.  

#### Boosted Logistic Regression![5_1](./materials/5_11.png)

#### 	Logistic Model Trees

![5_1](./materials/5_13.png)

#### Penalized Logistic Regression

베타를 막 고를 수 있는게 아니라, 제한을 주는 것. 베타 제곱의 합이 t보다 작도록. **L2**. ![5_1](./materials/5_14.png)

##### Regularized Logistic Regression L1 정규화![5_1](./materials/5_15.png)



- #### 결과 해석

  iter는 반복 횟수를 의미한다. 

  ![5_1](./materials/5_16.png)

  여기는 람다가 있지. 람다 값을 볼 수가 있다. ![5_1](./materials/5_17.png)

  primal은 파라미터 기준 최적화, dual은 제약변수 기준 최적화. 

  epsilon은 내가 학습을 언제 멈출 것이냐에 대한 기준.  시뮬레이션 N번째 했는데, 하는데 N+1번째랑 차이가 epsilon이면 멈추겠다. 의 기준인 것. 즉, 진전이 없으면 멈추겠다는건데, 그때의 기준인 것. 

  ![5_1](./materials/5_18.png)

  **Cost VS Loss**

  Loss는 데이터 하나하나, cost는 데이터 전체에 대해. ![5_1](./materials/5_19.png)



- #### 실습

  
