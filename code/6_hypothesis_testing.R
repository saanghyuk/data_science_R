
# 두 집단 평균 차이 검정.


##################
#Each Group has 3 samples
##################
rawN3 <-read.csv(file="source/Data/htest01.csv", header=TRUE)

groupA <- rawN3[rawN3$group=='A', 1:2]
groupB <- rawN3[rawN3$group=='B', 1:2]
groupA
groupB


mean(groupA[, 2])
mean(groupB[, 2])

# Phase 1 
# Define hypothesis
# H0 : Mean(Height) of Group A and Group B has no differnce
# H1 : Group B is taller Group A


# Phase 2
# Testing Normality
shapiro.test(groupA[,2])
#Shapiro-Wilk normality test
#data:  groupA[, 2]
# W = 1, p-value = 1
# Follows Normality -> means we can use t test 

qqnorm(groupA[, 2])
qqline(groupA[, 2])


shapiro.test(groupB[,2])
qqnorm(groupB[, 2])
qqline(groupB[, 2])


# Phase 3
# Variance Test
# Decide whether Variance Of A and B is same.
var.test(groupA[,2], groupB[, 2])


# Phase 4
# t.test
t.test(groupA[, 2], groupB[, 2], alternative = "less", var.equal = TRUE)

# Phase 5
# Conclusion
# Mean height of Group A and Group B has no difference. 



##################
#Each Group has 10 samples
##################
rawN10 <-read.csv(file="source/Data/htest02.csv", header=TRUE)

groupA2 <- rawN10[rawN10$group=='A', 1:2]
groupB2 <- rawN10[rawN10$group=='B', 1:2]


mean(groupA2[,2])
mean(groupB2[,2])

# Phase 1 
# Define hypothesis
# H0 : Mean(Height) of Group A and Group B has no differnce
# H1 : Group B is taller Group A

# Phase 2
# Testing Normality
shapiro.test(groupA2[,2])
qqnorm(groupA2[, 2])
qqline(groupA2[, 2])


shapiro.test(groupB2[,2])
qqnorm(groupB2[, 2])
qqline(groupB2[, 2])


# Phase 3
# Variance Test
# Decide whether Variance Of A and B is 'not' same.
var.test(groupA2[,2], groupB2[, 2])


# Phase 4
# t.test
t.test(groupA[, 2], groupB[, 2], alternative = "less", var.equal = FALSE)


# Phase 5
# Conclusion
# Mean height of Group A and Group B has difference. B is tallker



# 대응표본 T검정
raw_d <- read.csv(file="source/Data/htest02d.csv", header=TRUE)

groupAd <- raw_d[,1]
groupBd <- raw_d[,2]

mean(groupAd)
mean(groupBd)


# Hypothesis
# Before After Marketing, No changes
# Increased After marketing



# 데이터 정규성 검정
# 차이에 대한 정규성 검정
d = groupAd - groupBd

shapiro.test(d)
qqnorm(d)
qqline(d)


# T-test
# paired
t.test(groupAd, groupBd, alternative = "less", paired = TRUE)


# Increased After marketing



# Z-검정
# 데이터 갯수 30개 넘는 경우. 대표본
rawN30 <- read.csv(file="source/Data/htest03.csv", header=TRUE)

groupA3 <- rawN30[rawN30$group=="A", 1:2]
groupB3 <- rawN30[rawN30$group=="B", 1:2]

mean(groupA3[, 2])
mean(groupB3[, 2])

# Hypothesis
# H0 : No difference beteen Average height
# H1 : Difference beteen Average height


# R에서는 따로 z-test준비하지 않는다. 
z.test <- function(x1, x2){ 
  n_x1 = length(x1)
  n_x2 = length(x2)
  mean_x1 = mean(x1) 
  mean_x2 = mean(x2)
  
  cat("\n")
  cat("\tTwo Sample z-test\n") 
  cat("\n")
  cat("mean of x1:", mean_x1, "\n") 
  cat("mean of x2:", mean_x2, "\n")
  
  var_x1 = var(x1) 
  var_x2 = var(x2)
  
  z = (mean_x1 - mean_x2)/sqrt((var_x1/n_x1)+(var_x2/n_x2)) 
  abs_z = abs(z)
  cat("z =", abs_z, "\n")
  p_value = 1-pnorm(abs_z)
  cat("p-value =", p_value)
}

z.test(groupA3[, 2], groupB3[, 2])





# ANOVA
raw_anova <- read.csv(file="source/Data/htest04.csv", header=TRUE)

groupA4 <- raw_anova[raw_anova$group=='A', 1:2]
groupB4 <- raw_anova[raw_anova$group=='B', 1:2]
groupC4 <- raw_anova[raw_anova$group=='C', 1:2]


mean(groupA4[, 2])
mean(groupB4[, 2])
mean(groupC4[, 2])


# H0: Three groups has no difference in average
# H1: Three groups hasdifference in average.

# Normality Test
# 귀무가설. 정규분포 따른다.
shapiro.test(groupA4[, 2])
shapiro.test(groupB4[, 2])
shapiro.test(groupC4[, 2])

qqnorm(groupA4[, 2])
qqline(groupA4[, 2])

qqnorm(groupB4[, 2])
qqline(groupB4[, 2])

qqnorm(groupC4[, 2])
qqline(groupC4[, 2])


# 분산 동질성 검정.
# 귀무가설, 분산이 동일하다.
install.packages("lawstat")
library(lawstat)

levene.test(raw_anova$height, raw_anova$group)
bartlett.test(height~group, data=raw_anova)


# ANOVA
# 대립가설 채택, 세 집단간 평균이 다르다.
rawAnova <- aov(height~group, data=raw_anova)
summary(rawAnova)




# Chi Square Testing
raw_chisq <- read.csv(file="source/Data/htest05.csv", header=TRUE)
rawTable <- table(raw_chisq)
rawTable


chisq.test(rawTable, correct=FALSE)



