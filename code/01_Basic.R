2+5

# Demo Comment
print("Hello")

# Variable
x <- 2
x <- 3
x
y <-c(1, 2, 3, 4, 5, 6)
y <- 1:10
x <- y <- 1:10
x+y
z <- x+y
z2 <- x*y
X <- 10

ls()

rm(X)
rm(z2)
rm(list=ls())

#Package

browseURL("http://cran.r-project.org")

install.packages("LiblineaR")
library()
search()
require("LiblineaR")
detach("package:LiblineaR", unload=TRUE)
remove.packages("LiblineaR")
?? ggplot2 



# Inputting Data
require("datasets")
data()
? datasets
library(help = "datasets")
? iris
str(iris)
iris
data("iris")

# Enter data manually

x1 <- 1:10
x2 <- c(2, 5, 7, 4)
x3 <- seq(5, 50, by = 5)
x3
x4 <- seq(5, -50, by = -5)

# 콘솔에서 하나씩 추가 가능
# 다 넣고 enter 두번
x5 <- scan() 

# txt with seperator \t
setwd("/Users/sanghyuk/Documents/data_science_R/source/")
Product <- read.table("Data Files/Product.txt", header=TRUE, sep = "\t")
str(Product)

Customer <- read.csv("Data Files/Customer.csv", header = TRUE)
str(Customer)
View(Customer)


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


# To make this bar plot image file
# click the export above the image
# also has command
png(filename = "./Freq.png", width=888, height=377)
barplot(y[order(y)], horiz=TRUE, col=c("red", "green", "blue", "beige"), border=NA, main = "Title \n of this \n Bar char", xlab="X AXIS TITLE", ylab="Y AXIS TITLE")
dev.off()


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

