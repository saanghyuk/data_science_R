# Linear Regression

[Background Konledge](#Background Knowledge)

[Linear Regression Part](#2. Linear-Regression)



# Background Knowledge

- #### 머신러닝이란?

  ![2_1](./materials/2_1.png)

  ​		

  ![2_1](./materials/2_2.png)

  



- #### 확률의 기초

  ![2_1](./materials/2_3.png)

  ![2_1](./materials/2_4.png)

  ![2_1](./materials/2_5.png)

  ​	![2_1](./materials/2_6.png)

  

  ![2_1](./materials/2_7.png)

  ![2_1](./materials/2_9.png)

  ##### 	통계적 추론![2_1](./materials/2_10.png)

  ​	![2_1](./materials/2_11.png)

  ![2_1](./materials/2_12.png)

  ![2_1](./materials/2_13.png)

  ![2_1](./materials/2_14.png)

  ![2_1](./materials/2_15.png)





- #### MLE

  표본을 가지고, 관측치가 나올 확률이 가장 큰 모수를 구하는 것. 가장 많이 쓰는 방법론. 

  ![2_1](./materials/2_16.png)

  ​	![2_1](./materials/2_17.png)

  시그마는 알려졌다고 가정하네. ![2_1](./materials/2_18.png)

  ![2_1](./materials/2_19.png)

  ​	![2_1](./materials/2_23.png)

  

- #### Matrix 미분

  ![2_1](./materials/2_20.png)

  ​	![2_1](./materials/2_21.png)

  ![2_1](./materials/2_22.png)





#2. Linear-Regression

- ![2_1](./materials/2_24.png)

  

  모집단의 회귀식(신의 입장) - 우리는 샘플을 보고 최대한 유사하게 이것을 추정하는 것. ![2_1](./materials/2_25.png)

  

  ![2_1](./materials/2_26.png)

- #### 단순선형 회귀계수 추정

  ![2_1](./materials/2_27.png)

  ![2_1](./materials/2_28.png)

  **Gradient Vector**![2_1](./materials/2_29.png)

  ![2_1](./materials/2_30.png)

  ![2_1](./materials/2_31.png)

  ![2_1](./materials/2_32.png)

  ![2_1](./materials/2_33.png)

  ![2_1](./materials/2_34.png)

  



- #### 단순선형회귀모형의 해석 및 검정

  ![2_1](./materials/2_35.png)

  ![2_1](./materials/2_36.png)

- #### 회귀 모형 적합도 평가

  ![2_1](./materials/2_37.png)

  ![2_1](./materials/2_38.png)

  ***아래서 P가 변수의 갯수, N은 데이터의 갯수***![2_1](./materials/2_39.png)

  **정확히는 오차(입실론)에 대한 가정이다. 잔차는 오차에 대한 추정치**![2_1](./materials/2_40.png)

  첫번째 잔차 플롯에서, 이게 어떤 트랜드를 가지면 안된다는 것. 랜덤하게 존재해야 한다. 

  두번째는 정규성에 대한 판단. 

  ![2_1](./materials/2_41.png)



- #### 다중 선형회귀의 개요

  ![2_1](./materials/2_42.png)

  ![2_1](./materials/2_43.png)

  ![	](./materials/2_44.png)

  ![2_1](./materials/2_45.png)

  ![2_1](./materials/2_46.png)

  ![2_1](./materials/2_47.png)

  



- #### 다중 공선성 개념 이해 및 진단 방법

  ![48](./materials/2_48.png)

  ​	![2_1](./materials/2_49.png)

  ​	![2_1](./materials/2_50.png)

  ​	





- #### 회귀모형의 성능평가지표

  ![2_1](./materials/2_51.png)

  ![2_1](./materials/2_52.png)

  ![2_1](./materials/2_53.png)

  ![2_1](./materials/2_54.png)



- #### 변수 선택법

  **현실에서는 모든 변수가 싹다 독립성이 만족되고 이러기가 굉장히 어렵기 때문에, 변수가 계속 증가하면 성능이 저하되는 경향이 있다.** 

  ![2_1](./materials/2_55.png)

  

**AIC/BIC둘다 모델이 얼마나 좋은지 판단하는 기준일 뿐.** ![2_1](./materials/2_56.png)

​	하나씩 넣어보면서, AIC라고 하면 그거 하나씩 계속 넣어가면서 AIC선택하고 계속 무한 반복하는거야. 어느 순간 추가적인 것을 넣기 시작하니깐, AIC가 	안올라가면 stop. 

 ![2_1](./materials/2_57.png)

​	![2_1](./materials/2_58.png)

​	

전진/후진 모두 한번 날린 변수는 다시 쓰질 않아. 애매하지. back/forward 계속 해보라는거야. 결국은 노가다여. ![2_1](./materials/2_59.png)