
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



