# Machine Learing









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

