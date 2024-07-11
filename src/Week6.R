#Week6: Grain development III
#小的%in%大的

library(dplyr)
data.frame(x=letters) %>% 
  filter(x%in%c('a','b'))
data.frame(x=letters) %>% 
  filter(c('a','b')%in%x)

c('a','b')%in%letters
letters%in%c('a','b')


#advanced mutate add-on :across
getwd()
setwd("D:/MSC_project/data")
climate<-read.csv('climate.csv')
climate %>% 
  select(ends_with("Temperature")) %>% #從 climate 數據框中選擇所有以 "Temperature" 結尾的列
  head(.,3) %>% #從這些選定的列中取出前三行數據。這是一種查看數據框頭幾行數據的快速方式，有助於初步了解數據的形態。
  glimpse()#於快速概覽數據框的內容


climate %>% 
  mutate(across(where(is.numeric),~{round(.x, digits = 2)})) %>%
  # mutate(across(where(is.numeric),function(x){round(x, digits = 2)})) %>%
  select(ends_with("Temperature")) %>% 
  head(.,3) %>% 
  glimpse()

# reduce your code chunk by using function
display <- function(x){
  # subset dataframe and summarized for displaying purporse
  # x: input data frame
  x %>% 
    dplyr::select(ends_with("Temperature")) %>% 
    head(.,3) %>% 
    dplyr::glimpse()
}

climate %>% 
  mutate(across(where(is.numeric),function(x){round(x, digits = 2)})) %>%
  display()


#practice
getwd()
setwd("D:/MSC_project/data")
climate<-read.csv('climate.csv')
climate_sub <- climate %>% 
  dplyr::select(DayTime,DailyMean_Temperature,DFG_year,sowing_date)
climate_sub

