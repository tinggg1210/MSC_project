#Week7: Grain development III


#logic of coding
getwd()
setwd('D:/MSC_project/data')
climate<-read.csv('climate.csv')
str(climate)
dim(climate)
library(dplyr)
library(ggplot2)
str(climate$DayTime)#chr

library(dplyr)

climate <- climate %>%
  group_by(DFG_year, sowing_date) %>%
  mutate(
    DayTime = as.Date(DayTime, format="%Y-%m-%d"),
    DAS = as.numeric(DayTime - min(DayTime))
  )

library(ggplot2)

ggplot(climate, aes(x = DAS, y = Acc_Temperature, color = DFG_year, group = interaction(sowing_date, DFG_year))) +
  geom_line(aes(linetype = sowing_date), linewidth = 1) +
  theme_bw() +
  theme(legend.position = c(.1, .65)) +
  labs(x = "Days after sowing", y = "Thermal sum (°Cd)") +
  guides(color = guide_legend(title = "Year"))



#最小的組合
climate %>% 
  dplyr::filter(DFG_year=="DFG2019") %>% #篩選出 DFG_year 等於 "DFG2019" 的row
  group_by(y,m) %>% #將篩選後的數據按 y（年）和 m（月）分組。
  summarise()#對每個分組創建摘要，這裡沒有指定具體的摘要操作，因此返回的是唯一的 y 和 m 組合。

climate %>% 
  dplyr::filter(DFG_year=="DFG2019") %>% 
  dplyr::select(y,m) %>% 
  dplyr::distinct()

#challenge
ear_summarized<-read.csv('ear_summarized.csv')
ear_summarized %>% 
  group_by(nitrogen,appl,timeid) %>% 
  summarise()
ear_summarized%>%
  distinct(nitrogen,appl,timeid)

#wide to long
# climate %>%glimpse()
climate_long <- climate %>% 
  tidyr::pivot_longer(names_to = "Daily_Terms",
                      values_to = "Daily_value",
                      cols = contains("Daily")) 
# climate_long%>%   names()

#select cols by position
# grep("(Daily|Acc)",names(climate))
climate_long <- climate %>% 
  tidyr::pivot_longer(names_to = "Terms",
                      values_to = "value",
                      # select both patterns
                      cols = grep("(Daily|Acc)",names(.)))

# climate_long%>% names()

## data processing example
climate_long_subset<- climate_long %>% 
  filter(Terms%in%c('Acc_Temperature','Acc_Precipitation')) %>% 
  group_by(DFG_year,sowing_date,Terms) %>%
  summarise(Value=mean(value))

climate_long_subset




#Fig 2
#Fig 2
library(scales) %>% suppressMessages()

climate_long %>% 
  filter(Terms%in%c('Acc_Temperature','Acc_Radiation'),
         sowing_date=='Early') %>% 
  group_by(DFG_year,sowing_date) %>% 
  mutate(DayTime=as.Date(DayTime,format="%Y-%m-%d"),
         DAS=as.numeric(DayTime-min(DayTime))) %>% 
  ggplot(aes(DAS,value,color=DFG_year))+
  geom_line()+
  facet_grid(~Terms)+
  theme_test()+
  theme(strip.background = element_blank(),
        strip.text = element_text(size=14),
        axis.text = element_text(size=14),
        axis.title = element_text(size=14),
        legend.position = c(.1,.1))+
  scale_y_log10(
    labels = label_number(scale_cut = cut_short_scale())
  )+
  xlab('Days after sowing')


#long ↔︎ wide
# long
climate_long <- climate %>% # climate is wide
  tidyr::pivot_longer(names_to = "Daily_Terms",
                      values_to = "Daily_value",
                      cols = contains("Daily")) 
# wide again
climate_wide<- climate_long%>% 
  tidyr::pivot_wider(names_from = "Daily_Terms",
                     values_from = "Daily_value")

# check if they are the same 
setdiff(names(climate),names(climate_wide))

all.equal(climate,climate_wide)




filename <- c('grain_counting_practice_studentName1.xlsx',
              'grain_counting_practice_studentName2.xlsx')
file_list<- filename %>% strsplit("_")
file_list
# tradition way of for loop
res <- c()
for(i in 1:2){
  res <- c(res,file_list[[i]][4])
}
res
# alternative in r package purrr
# chr stands for the "character" output.
purrr::map_chr(1:length(file_list),  ~{
  file_list[[.x]][4]
})

# notice that the output of map_chr must be 1 element per iteration.
purrr::map_chr(filename,  ~{
  .x %>% strsplit("_") %>% unlist()
})

# equivalent
purrr::map(filename,  ~{
  .x %>% strsplit("_") %>% unlist()
})

lapply(filename,function(x){
  x %>% strsplit("_") %>% unlist()
})


