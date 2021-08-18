
# Find missing values
df <- data.frame(sex=c("M", "F", NA, "M", "F"),
                 score=c(5, 4, 3, 4, NA))

df

is.na(df)
table(is.na(df))


table(is.na(df$sex))
table(is.na(df$score))

mean(df$sex)
mean(df$score)


library(dplyr)
df %>% filter(is.na(score))

df_nomiss <-df %>% filter(!is.na(score))
mean(df_nomiss$score)
sum(df_nomiss$score)


df_nomiss <-df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

df_nomiss2 <- na.omit(df)
df_nomiss2

# 
mean(df$score, na.rm=T)

exam <- read.csv("source/Data/csv_exam.csv", header=TRUE)
exam[c(3, 8, 15), "math"] <- NA

exam %>% 
  summarise(mean_math = mean(math))

exam %>% 
  summarise(mean_math = mean(math, na.rm=T))


# 결측치 대체하기
mean(exam$math, na.rm=T)
exam$math <- ifelse(is.na(exam$math), 55, exam$math)

exam

# Quiz
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA

# 1
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

# 
mpg %>% filter(!is.na(mpg$hwy)) %>% 
  group_by(class) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy))


# Outlier 
# 논리적으로 존재할 수 없는 경우 
outlier <- data.frame(sex=c(1, 2, 1, 3, 2, 1), 
                      score=c(5, 4, 3, 4, 2, 6))

# 이상치 체크 
table(outlier$sex) # 1 or 2
table(outlier$score) # 1 ~ 5

outlier$sex <- ifelse(outlier$sex ==3, NA, outlier$sex)
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
table(is.na(outlier$sex))
table(is.na(outlier$score))

outlier %>% 
  filter(!is.na(outlier$sex) & !is.na(outlier$score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score = mean(score))


# 극단적인 값. 
mpg <- as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats # box plot의 각 선들 찾아줌.

mpg$hwy<-  ifelse(mpg$hwy < 12 | mpg$hwy >37, NA, mpg$hwy)
table(is.na(mpg$hwy))


mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy, na.rm = T))


# Q
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10, 14, 58, 93), "drv"] <- "k"
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42)


table(mpg$drv)
mpg$drv <- ifelse(mpg$drv %in% c("4", "f", "r"), mpg$drv, NA)
table(mpg$drv)

boxplot(mpg$cty)$stats #9, 26
mpg$cty <-  ifelse(mpg$cty < 9 | mpg$cty > 26, NA,  mpg$cty)
boxplot(mpg$cty)

mpg %>% 
  filter( !is.na(drv) & !is.na(cty)) %>% 
  group_by(drv) %>% 
  summarise(mean_cty = mean(cty, na.rm=TRUE))

