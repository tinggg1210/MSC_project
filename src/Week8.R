library(dplyr)
path <- "./data/student/"
filenames <- list.files(path,pattern=".xlsx")
filenames
#create empty list
df <- vector(mode="list",length=length(filenames))

fullpath <- paste0(path,filenames[i])

for(i in 1:length(filenames)){
  fullpath <- paste0(path,filenames[i])
  df[[i]] <- xlsx::read.xlsx(fullpath,
                             sheetIndex = 1) %>% 
    names()
}

df 

#install.packages("purrr")
library(purrr)
library(dplyr)


student_name <-   purrr::map_chr(filenames,  ~{
  .x %>% strsplit("_") %>% unlist() %>% 
    .[4] %>% sub(".xlsx","",.)
}) 
names(df) <-student_name
df


df<- map_dfr(list.files("./data/student"),~{
  
  file<- xlsx::read.xlsx(paste0("./data/student/",.x),sheetIndex = 1)
})
df %>% 
  glimpse()


library(magrittr)
df<- map_dfr(list.files("./data/student"),~{
  
  student_name <-  .x %>% strsplit("_") %>% unlist() %>% 
    .[4] %>% sub(".xlsx","",.)
  
  file<- xlsx::read.xlsx(paste0("./data/student/",.x),sheetIndex = 1) %>%  
    `colnames<-`(stringr::str_to_lower(names(.)))%>% 
    `colnames<-`(gsub("kernal","kernel",names(.))) %>% 
    `colnames<-`(gsub("spikes","spike",names(.)))%>%
    `colnames<-`(gsub("plot.id","plot_id",names(.))) %>% 
    mutate(student=student_name)
}) 
df %<>% mutate(var="Capone",plot_id=159) %>% 
  .[!grepl("na.",names(.))]
df %>% glimpse()

library(ggplot2)
ggplot(df,aes(x=flower,y=spike, color=student))+
  geom_line() 

library(ggplot2)
ggplot(df,aes(x=flower,y=spike, color=student))+
  geom_path() 
