

# R

[Chart With R](###Chart)





| Shortcut        | Description              |
| --------------- | ------------------------ |
| Ctrl + L        | Clear the console output |
| option + -      | <-                       |
| command+shift+M | %>%                      |







| Command                                    | Description                                                  |
| ------------------------------------------ | ------------------------------------------------------------ |
| `ls()`                                     | show all values in the workspace                             |
| `rm(X)`                                    | Delete the variable **X**                                    |
| `rm(list=ls())`                            | Delete All variables in the workspace                        |
| `browseURL("http://cran.r-project.org")`   | Open the URL                                                 |
| `install.packages("LiblineaR")`            | install packages                                             |
| `library()`                                | Show all packages installed(available)                       |
| `search()`                                 | Check the currently loaded packages                          |
| `require() vs library()`                   | library와 require는 기본적으로 비슷한 기능을 하지만, require은 패키지가 없을 때 warning을 보여준다. 고로, 함수 내부에서 쓸때 require가 자주 사용됨. |
| `detach("package:LiblineaR", unload=TRUE)` | Unload the package                                           |
| `remove.packages("LiblineaR")`             | remove the package                                           |
| `?? ggplot2`                               | show the docs                                                |
|                                            |                                                              |
|                                            |                                                              |
|                                            |                                                              |





|                    |                                         |      |
| ------------------ | --------------------------------------- | ---- |
| str(iris)          | iris 데이터 프레임의 구조 확인          |      |
| View(df)           | df 새 창에서 크게 보기                  |      |
| table(df$column)   | 해당 컬럼에 대해서 따로 테이블 만들어줌 |      |
| R space Image 저장 | 환경창 변수까지 같이 저장하는 것.       |      |
|                    |                                         |      |
|                    |                                         |      |



## Basic of R

- #### Add Data

  - datasets이라는 패키지가 기본으로 설정되어 있음. 

    `data()` -> datasets라는 패키지 안에 있는 데이터 보여줌. 

    `library(help = "datasets")` 패키지 사용법

    `? iris` datasets패키지랑 같이 기본으로 로드되는 데이터셋이라 이렇게 해도 설명 보여줌. 

    `str(iris)` -> structure of the data frame

    ```R
    # Inputting Data
    require("datasets")
    data()
    ? datasets
    library(help = "datasets")
    ? iris
    str(iris)
    iris
    
    # dataset패키지에서 제공하는 명령어. iris라는 이름으로 내 Workspace에 저장된다. 
    data("iris")
    ```

    

  - Enter Data Manually

    ```R
    # Enter data manually
    
    x1 <- 1:10
    x2 <- c(2, 5, 7, 4)
    x3 <- seq(5, 50, by = 5)
    x3
    x4 <- seq(5, -50, by = -5)
    
    # 콘솔에서 하나씩 추가 가능
    # 다 넣고 enter 두번
    x5 <- scan() 
    ```

    

  - From CSV or Text File

    ```R
    # txt with seperator \t
    setwd("/Users/sanghyuk/Documents/data_science_R/source/")
    Product <- read.table("Data Files/Product.txt", header=TRUE, sep = "\t")
    str(Product)
    
    Customer <- read.csv("Data Files/Customer.csv", header = TRUE)
    str(Customer)
    View(Customer)
    ```



​		



### Data Searching

- ```R
  exam <- read.csv("source/Data/csv_exam.csv", header=TRUE)
  head(exam)
  head(exam, 10)
  tail(exam)
  tail(exam, 10)
  View(exam) # Show data in new tab
  dim(exam) # dimension
  str(exam) # 컬럼 설명
  summary(exam) # 요약통계량
  
  ```



### Data Frame수정 

- 컬럼명 바꾸기

  `rename function is in dplyr package`

  ```
  # # new name : v2, old name = var2
  # df_new <- rename(df_new, v2=var2)
  ```

- 



### 파생 변수 만들기 

- **ifelse, table, qplot**

  ```R
  # Derivative Variable
  df <- data.frame(var1 = c(4, 3, 8), var2 = c(2, 6, 1))
  df$var_sum <- df$var1 + df$var2
  df$var_total <- (df$var1 + df$var2)/2
  df
  
  
  mpg$total <- (mpg$cty + mpg$hwy)/2
  head(mpg)
  mean(mpg$total)
  summary(mpg$total)
  hist(mpg$total)
  
  mpg$test <- ifelse(mpg$total >=20, "pass", "fail")
  
  head(mpg, 20)
  
  # 숫자 세줌
  table(mpg$test)
  library(ggplot2)
  qplot(mpg$test)
  
  mpg$grade <- ifelse(mpg$total >=30, "A", ifelse(mpg$total >=20 , "B", "C"))
  table(mpg$grade)
  qplot(mpg$grade)
  
  
  mpg$grade <- ifelse(mpg$total >=30, "A", ifelse(mpg$total >=20 , "B", ifelse(mpg$total >=10 , "C", "D")))
  mpg$grade
  table(mpg$grade)
  qplot(mpg$grade)
  
  ```

  ```R
  # QUIZ
  midwest <- as.data.frame(ggplot2::midwest)
  str(midwest)
  head(midwest)
  dim(midwest)
  
  midwest <- rename(midwest, total=poptotal, asian=popasian)
  
  midwest$ratio <- (midwest$asian/midwest$total)*100
  hist(midwest$ratio)
  
  mean_ratio <-mean(midwest$ratio)
  midwest$large.small <- ifelse(midwest$ratio > mean_ratio, "large", "small" )
  
  table(midwest$large.small)
  qplot(midwest$large.small)
  
  ```

- **파생 변수 추가할때는, Mutate를 쓰는 것을 권한다**

  Mutate는 내부에서 훨씬 많은 일들을 할 수 있으면서 코드도 훨씬 간결하다. 

  ```R
  # ADD Derivative with Mutate(파생변수 추가)
  # 내장변수
  exam$total <- exam$math + exam$english + exam$science
  # Mutate 
  exam %>% mutate(total = math, english, science) %>%  head
  exam %>% mutate(total = math, english, science, 
                  mean = (math, english, science)/3 ) %>%  head
  
  exam %>% mutate(test = ifelse(science >=6, "pass", "fail")) %>%  head
  
  
  ```

  **지금 가장 중요한 포인트는, 아래 코드에서 total 코드를 실제 exam안에다가  assign한 적이 없어서 아직 변수가 없는 상태인데도, 뒤에서 마치 있는 것처럼 사용이 가능하다는 것.** 

  ```R
  exam %>% mutate(test = ifelse(science >=6, "pass", "fail")) %>%  arrange(total) %>% head
  ```

  **Quiz**

  ```R
  # Quiz
  mpg <- as.data.frame(ggplot2::mpg)
  mpg <-mpg %>% mutate(total = cty+hwy, avg = (cty+hwy)/2)
  mpg %>% arrange(desc(avg)) %>% head(3)
  
  mpg %>% mutate(total = cty+hwy, avg = (cty+hwy)/2) %>%  arrange(desc(avg)) %>%  head(3)
  
  ```

  심지어 mutate에서는, 아직 mutate선언이 끝나지도 않았는데, 앞에서 선언된걸 사용할수가 있음. total처럼. 

  ```R
  mpg %>% mutate(total = cty+hwy, avg = (total)/2) %>%  arrange(desc(avg)) %>%  head(3)
  ```

  

### Data IO

- ```R
  
  # 외부 데이터 가져오기
  install.packages("readxl")
  library(readxl)
  # Excel
  df_finalexam <- read_excel("source/Data/finalexam.xlsx", sheet=1, col_name=T)
  df_finalexam
  mean(df_finalexam$math)
  mean(df_finalexam$history)
  mean(df_finalexam$english)
  
  # CSV
  df_finalexam <- read.csv("source/Data/csv_exam.csv", header=TRUE)
  df_finalexam
  
  # Store
  write.csv(df_finalexam, file="
  ```

  

#### Data Extracting with condition 

- ![1_3](./materials/1_3.png)

  ![1_3](./materials/1_4.png)

  ​	![1_3](./materials/1_5.png)

#### Extracting Rows

~~~R
```R
# 조건에 맞는 데이터 추출하기
library(dplyr)
exam <- read.csv("source/Data/csv_exam.csv", header=TRUE)
exam %>% filter(class==1)
exam %>% filter(class==2)
exam %>% filter(class!=3)
exam %>% filter(math  > 50)
exam %>% filter(math  < 50)

exam %>%  filter(class == 2 & english >=80)
exam %>%  filter(class == 2 | english >=80)
exam %>%  filter(class == 2 | class==1 | class==5)
# 여러개 or 연결시 
# match operator
exam %>%  filter(class %in% c(1, 3, 5))

# 추출한 행으로 만들기
class1 <- exam %>%  filter(class == 1)
class2 <- exam %>%  filter(class == 2)
mean(class1$math)
mean(class2$math)
```

Quiz

```R

# Quiz
mpg <-as.data.frame(ggplot2::mpg)
# Q1
displ_4 <- mpg %>% filter(displ <= 4)
displ_5 <- mpg %>% filter(displ > 5)
mean(displ_4$hwy)
mean(displ_5$hwy)

#Q2
str(mpg)
audi <- mpg %>% filter(manufacturer == "audi")
toyota <- mpg %>% filter(manufacturer == "toyota")
mean(audi$cty)
mean(toyota$cty)
~~~


~~~R
# Q3
library(dplyr)
mpg <-as.data.frame(ggplot2::mpg)
mpg  %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
cfh <-mpg  %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(cfh$hwy)

mpg %>% group_by(manufacturer)
```
~~~

  




#### Extracting Columns/Variables

```R
# 필요한 변수만 추출하기(컬럼 추출)
exam %>% select(math)
exam %>% select(english)
exam %>% select(english, class, math)
# 제외
exam %>% select(-english)
exam %>% select(-english, -math)

```

```R

# 조합
exam %>% 
  filter(class ==1) %>%
  select(english)


exam %>% 
  filter(class ==1) %>%
  select(english) %>% 
  head(5)
```

```R

# QUIZ
cc <- mpg %>% select(class, cty)
str(cc)

suv <-cc %>% filter(class=="suv") %>% select(cty)
compact <-  cc %>% filter(class=="compact") %>% select(cty)

mean(suv$cty)
mean(compact$cty)
```





#### Arange Data 정렬

- ```R
  
  # Arange
  exam %>% arrange(math)
  exam %>% arrange(desc(math))
  
  # Douuble Arange
  exam %>% arrange(desc(class), desc(math))
  
  
  # Quiz
  mpg %>% filter(manufacturer == "audi") %>% arrange(desc(hwy)) %>% head(5)
  
  ```





#### Group By with Summarise

- N은 Count임. 각각 group by 내부 행의 갯수를 서주는 것. 그냥 행 세는 거니깐, 따로 컬럼명 안서도 되겠지. 자주 쓴다. 

  ```R
  exam %>% 
    group_by(class) %>%
    summarise(mean_math = mean(math), sum_math=sum(math), median_math=median(math), n=n())
  
  ```

- ![1_6](./materials/1_6.png)

- 여러번 쪼갤 수도 있다. 

  ```R
  
  mpg %>% 
    group_by(manufacturer, drv) %>% 
    summarise(mean_city = mean(cty)) %>% 
    head(10)
  
  ```

  ![1_6](./materials/1_7.png)

  **Quiz**

  ```R
  # QUIZ
  mpg <- as.data.frame(ggplot2::mpg)
  # Q1
  mpg %>% group_by(class) %>% summarise(avg_cty = mean(cty))
  
  # Q2
  mpg %>% group_by(class) %>% summarise(avg_cty = mean(cty)) %>% arrange(desc(avg_cty))
  
  # Q3
  mpg %>% group_by(manufacturer) %>%  summarise(avg_cty = mean(cty)) %>% arrange(desc(avg_cty)) %>% head(3)
  
  # Q4
  mpg %>% filter(class=="compact") %>%  group_by(manufacturer) %>%  summarise(n=n()) %>% arrange(desc(n))
  아래 방식도 답이 똑같이 나오긴 하는데, 위 코드가 더 논리적임. 
  
  mpg %>% 
    group_by(manufacturer) %>% 
    filter(class=="compact") %>% 
    summarise(n=n())
  
  ```



#### 데이터  합치기 merge

- ![1_8](./materials/1_8.png)

  ​	![1_8](./materials/1_9.png)

  ![1_8](./materials/1_10.png)		

- ```R
  
  # 데이터  합치기 merge
  test1 <- data.frame(id=c(1,2,3,4,5), midterm=c(60,80,70,90,85))
  test2 <- data.frame(id=c(1,2,3,4,5), midterm=c(70,83,65,95,80))
  
  # 가로 합치기
  total <- left_join(test1, test2, by="id")
  total
  
  name <- data.frame(class=c(1,2,3,4,5), teacher=c("KIM", "SON", "LEE", "PARK", "YOON"))
  left_join(exam, name, by="class")
  
  
  # 세로 합치기
  group_a <- data.frame(id=c(1, 2, 3, 4, 5), test=c(60, 80, 70, 90, 85))
  group_b <- data.frame(id=c(6, 7, 8, 9, 10), test=c(70, 83, 65, 95, 80))
  
  group_all <- bind_rows(group_a, group_b)
  group_all
  ```

- Quiz

  ```R
  # Quiz
  mpg <- as.data.frame(ggplot2::mpg)
  fuel <- data.frame(fl = c("c", "d", "e", "p", "r"), 
                     price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22), stringsAsFactors = F)
  
  str(mpg)
  str(fuel)
  # Q1
  left_join(mpg, fuel, by="fl")
  
  # Q2
  left_join(mpg, fuel, by="fl") %>% select(model, fl, price_fl) %>% head(5)
  ```

  

  

### Chart

- Creating Barplots in R

  ```R
  
  # Creating Barplot with R
  y <- table(Customer$Region)
  View(y)
  
  #Y axis means Frequency
  barplot(y)
  y[order(y)]
  #Order by frequency
  barplot(y[order(y)])
  barplot(y[order(-y)])
  #horizontally
  barplot(y[order(y)], horiz=TRUE)
  
  # Appeance of Bar plot
  barplot(y[order(y)], horiz=TRUE, col="red")
  barplot(y[order(y)], horiz=TRUE, col=c("red", "green", "blue", "beige"))
  
  # can see all list of colors available
  colors()
  colors()[3]
  
  # remove the black boundary
  barplot(y[order(y)], horiz=TRUE, col=c("red", "green", "blue", "beige"), border=NA)
  
  # add title
  barplot(y[order(y)], horiz=TRUE, col=c("red", "green", "blue", "beige"), border=NA, main = "Title \n of this \n Bar char")
  
  
  # lable the x axis and y axis
  barplot(y[order(y)], horiz=TRUE, col=c("red", "green", "blue", "beige"), border=NA, main = "Title \n of this \n Bar char", xlab="X AXIS TITLE", ylab="Y AXIS TITLE")
  ```
  ![1_1](./materials/1_1.png)
  
  
  
	PNG로 저장하기 with command
	
  ```R
  # To make this bar plot image file
  # click the export above the image
  # also has command
  png(filename = "./Freq.png", width=888, height=377)
  barplot(y[order(y)], horiz=TRUE, col=c("red", "green", "blue", "beige"), border=NA, main = "Title \n of this \n Bar char", xlab="X AXIS TITLE", ylab="Y AXIS TITLE")
  dev.off()
  ```

- Histogram in R

  ```R
  
  # Histogram IN R
  # 11 bucket by default
  hist(Customer$Age)
  
  # 5 bucket
  # 딱 5개만 나오는 것은 아님. around 5로 해주는 것.
  hist(Customer$Age, breaks = 5)
  
  # suggesting the range
  hist(Customer$Age, breaks = c(0, 40, 60, 100))
  
  
  # 위에서는 density로 나옴. 
  # freq = True(빈도), freq=False(확률 밀도)
  hist(Customer$Age, breaks = c(0, 40, 60, 100), freq=TRUE)
  
  hist(Customer$Age, breaks = c(0, 40, 60, 100), freq=TRUE, col="blue")
  hist(Customer$Age, breaks = c(0, 40, 60, 100), freq=TRUE, col="blue", main="Histogram of Age")
  ```

  ![1_1](./materials/1_2.png)



## Basic of Statistics

