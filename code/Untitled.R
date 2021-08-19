library(dplyr)
library(ggplot2)
online_retail <-read.csv("online_retail_II.csv", header=TRUE)

str(online_retail)
dim(online_retail)
summary(online_retail) # 요약통계량

length(unique(online_retail$StockCode))
dim(online_retail)


online_gb <- online_retail %>% 
  group_by(StockCode) %>% 
  summarise(avg_quantity=mean(Quantity), sum_quantity = sum(Quantity), n= n()) %>% 
  arrange(desc(sum_quantity)) %>% 
  head(10)





str(online_gb)



ggplot(data=online_gb, aes(x=StockCode, y=sum_quantity)) + 
  geom_col() 


expectation =0
for(i in 1:50){
  expectation = expectation + i*(1/50)
}
expectation


18 * (10/50) + 19*(32/50) + 20*(5/50) + 21*(2/50) + 25*(1/50)
10-15+5-4 

