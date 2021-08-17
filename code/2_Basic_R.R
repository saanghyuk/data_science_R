library(ggplot2)
head(mpg)

# Feature Selectioin
mean(mpg$hwy)


max(mpg$hwy)

min(mpg$hwy)

hist(mpg$hwy)


# making variables
a <- 1
a
b <- 2
b
ab <- 3.5
ab
a+b


# making vector
d <- c(1, 2, 3, 4, 5)
d
e <- c(1:5)
e
f <- seq(1, 5)
f
g <- seq(1, 10, by=2)
g
d+2


# String Variable
a2 <- "a"
a2
b2 <- "text"
c2 <- "Hello World"
d2 <- c("a", "b", "c")
d2


# Functioin
a <- c(1, 2, 3)
a
mean(a)
max(a)
min(a)

b <- c("a", "a", "b", "c")
qplot(b)

e2 <- c("Hello", "World", "Is", "Good")
paste(e2, collapse = " ")

e2_paste <- paste(e2, collapse = " ")
e2_paste

e3_paste <- paste(e2, collapse = ",")
e3_paste



# Packages
qplot(b)
qplot(data=mpg, x=hwy)
qplot(data=mpg, x=cty)
qplot(data=mpg, y=hwy, x=drv, geom="point")
qplot(data=mpg, y=hwy, x=drv, geom="boxplot")
qplot(data=mpg, y=hwy, x=drv, geom="boxplot", colour=drv)
?qplot

# Use data from data.frame
qplot(mpg, wt, data = mtcars)
qplot(mpg, wt, data = mtcars, colour = cyl)
qplot(mpg, wt, data = mtcars, size = cyl)
qplot(mpg, wt, data = mtcars, facets = vs ~ am)
summary(mpg)

qplot(1:10, rnorm(10), colour = runif(10))
qplot(1:10, letters[1:10])
mod <- lm(mpg ~ wt, data = mtcars)
qplot(resid(mod), fitted(mod))

f <- function() {
  a <- 1:10
  b <- a ^ 2
  qplot(a, b)
}
f()


# Data Frame

# Making Data Frame
history <- c(90,80,60,70)
math <- c(50,60,100,20)
df_midterm <- data.frame(history, math)
df_midterm

class <- c(1,1,2,2)
df_midterm <- data.frame(history, math, class)
df_midterm


mean(df_midterm$history)
mean(df_midterm$math)


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
write.csv(df_finalexam, file="output_newdata.csv")


# 데이터 특성 파악하기
exam <- read.csv("source/Data/csv_exam.csv", header=TRUE)
head(exam)
head(exam, 10)
tail(exam)
tail(exam, 10)
View(exam)
dim(exam)
str(exam)
summary(exam)

# MPG inside ggplot2
## ::은 패키지 내부에 있는 특정 함수 혹은 요소를 지칭
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
head(mpg, 10)
tail(mpg)
tail(mpg, 10)
View(mpg)
dim(mpg)
str(mpg)
summary(mpg)


# Change the variable Name
library(dplyr)
df_raw <- data.frame(var1=c(1,2,1), va2 = c(2, 3, 1))
df_raw

df_new <- df_raw
# # new name : v2, old name = var2
df_new <- rename(df_new, v2=va2)
df_new



# QUIZ
mpg <- as.data.frame(ggplot2::mpg)
mpg_copy <- mpg
?rename
mpg_copy <- rename(mpg, city=cty, highway=hwy)
str(mpg_copy)

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


# Q3
library(dplyr)
mpg <-as.data.frame(ggplot2::mpg)
mpg  %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
cfh <-mpg  %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(cfh$hwy)

mpg %>% group_by(manufacturer)


# 필요한 변수만 추출하기(컬럼 추출)
exam %>% select(math)
exam %>% select(english)
exam %>% select(english, class, math)
# 제외
exam %>% select(-english)
exam %>% select(-english, -math)

# 조합
exam %>% 
  filter(class ==1) %>%
  select(english)


exam %>% 
  filter(class ==1) %>%
  select(english) %>% 
  head(5)

# QUIZ
cc <- mpg %>% select(class, cty)
str(cc)

suv <-cc %>% filter(class=="suv") %>% select(cty)
compact <-  cc %>% filter(class=="compact") %>% select(cty)

mean(suv$cty)
mean(compact$cty)

# Arange
exam %>% arrange(math)
exam %>% arrange(desc(math))

# Douuble Arange
exam %>% arrange(desc(class), desc(math))


# Quiz
mpg %>% filter(manufacturer == "audi") %>% arrange(desc(hwy)) %>% head(5)


# ADD Derivative with Mutate(파생변수 추가)
# 내장변수
exam$total <- exam$math + exam$english + exam$science
# Mutate 
exam %>% mutate(total = math, english, science) %>%  head
exam %>% mutate(total = math, english, science, 
                mean = (math, english, science)/3 ) %>%  head

exam %>% mutate(test = ifelse(science >=6, "pass", "fail")) %>%  head

exam %>% mutate(test = ifelse(science >=6, "pass", "fail")) %>%  arrange(total) %>% head

# Quiz
mpg <- as.data.frame(ggplot2::mpg)
mpg <-mpg %>% mutate(total = cty+hwy, avg = (cty+hwy)/2)
mpg %>% arrange(desc(avg)) %>% head(3)

mpg %>% mutate(total = cty+hwy, avg = (total)/2) %>%  arrange(desc(avg)) %>%  head(3)




# 집단별로 데이터 요약하기
# Groupby with summarise
exam %>% summarise(mean_math = mean(math))

exam %>% 
    group_by(class) %>%
    summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>%
  summarise(mean_math = mean(math), sum_math=sum(math), median_math=median(math), n=n())

mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_city = mean(cty)) %>% 
  head(10)

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
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=="compact") %>% 
  summarise(n=n())
  


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



# Final Test

midwest <- as.data.frame(ggplot2::midwest)

# 전체 인구 대비 미성년자 인구 비율 추가

midwest <- midwest %>% mutate(child_ratio = (1 - (popadults/poptotal))*100)
midwest %>% group_by(state, county) %>% select(child_ratio) %>% arrange(desc(child_ratio)) %>%  head(5)

midwest %>% mutate(child_ratio_grade = ifelse(child_ratio >=0.4, "large", ifelse(child_ratio >=0.3, "middle", "small")))


midwest %>% mutate(asian_ratio = (popasian/poptotal)*100) %>% 
  select(state, asian_ratio) %>% 
  arrange(asian_ratio) %>%  head(10)

