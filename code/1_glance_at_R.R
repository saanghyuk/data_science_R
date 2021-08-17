install.packages("dplyr")
install.packages("ggplot2")

library(dplyr)
library(ggplot2)

mpg <- ggplot2::mpg
head(mpg)
#차원
dim(mpg)
#feature 속성
str(mpg)
# 요약통계량
summary(mpg)

# 새 창에서 보기
View(mpg)

# 분석 아이디어
# 1. 회사별 평균 연비 높은순 정렬
mpg %>%
    group_by(manufacturer) %>%
    summarise(mean.hwy = mean(hwy)) %>%
    arrange(desc(mean.hwy))

# 2. 포드에서 가장 연비 좋은 차는?
mpg %>%
  filter(manufacturer=="ford") %>%
  group_by(model) %>%
  arrange(desc(hwy))


# 3. 배기량이 연비에 미치는 영향 회귀분석
lm.mpg <- lm(data=mpg, hwy~displ)
summary(lm.mpg)

# 4. 그래프 만들기 
qplot(data = mpg, x = displ, y = hwy)


