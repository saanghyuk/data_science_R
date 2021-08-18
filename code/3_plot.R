
# Scatter Plot 
# Two continuous variable
library(ggplot2)

ggplot(data=mpg, aes(x=displ, y=hwy)) + 
  geom_point() +
  xlim(3, 6) + 
  ylim(10, 30)

#Quiz
# 1
ggplot(data=mpg, aes(x=cty, y=hwy)) + 
  geom_point()

# 2
midwest <- as.data.frame(ggplot2::midwest)
ggplot(data=midwest, aes(x=poptotal, y=popasian)) +
  geom_point() +
  xlim(0, 500000) + 
  ylim(0, 10000)



# Bar plot
# 각 집단의 평균값을 막대 길이로 표현한 그래프
mpg <- as.data.frame(ggplot2::mpg)
library(dplyr)
df_mpg <- mpg %>%
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))
df_mpg

ggplot(data=df_mpg, aes(x=reorder(drv, -mean_hwy), y=mean_hwy)) + 
  geom_col() 

# Frequency Bar Plot
ggplot(data=mpg, aes(x=drv)) + geom_bar()

# Quiz

# 1
mpg_cty <- mpg %>% 
  filter(class=="suv") %>% 
  group_by(manufacturer) %>% 
  summarise(avg_cty = mean(cty)) %>% 
  arrange(desc(avg_cty)) %>% 
  head(5)
  
ggplot(mpg_cty, aes(x=reorder(manufacturer, -avg_cty), y=avg_cty)) + geom_col()


# 2
ggplot(data=mpg, aes(x=reorder(class, -n))) +geom_bar()

mpg %>%
  count(class) %>%
  ggplot(aes(x = reorder(class, -n), y=n)) +
  geom_bar(stat = 'identity')
  


# Line Graph
ggplot(data=economics, aes(x=date, y=unemploy)) + geom_line()
ggplot(data=economics, aes(x=date, y=psavert)) + geom_line()


# Box Plot
ggplot(data=mpg, aes(x=drv, y=hwy)) + geom_boxplot()

# Quiz
mpg_com <- mpg %>%
  filter(class %in%  c("compact", "subcompact", "suv"))
  
ggplot(data=mpg_com, aes(x=class, y=cty)) + geom_boxplot()


