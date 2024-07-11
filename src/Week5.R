#Make this graph more beautiful!的解答

ggplot()
dplyr::filter()
with(data, expression)
dplyr::case_when(
  條件1 ~ 值1,
  條件2 ~ 值2,
  TRUE ~ 預設值
)
merge(x, y, by = "key", by.x = NULL, by.y = NULL, all = FALSE, all.x = FALSE, all.y = FALSE, ...)
match(x, table, nomatch = NA_integer_, incomparables = NULL)





library(dplyr)
library(ggplot2)
getwd()
setwd('D:/MSC_project/data')
getwd()
read.csv('ear_summarized.csv')
data<-read.csv('ear_summarized.csv')


data %>% 
  ggplot(aes(x=date,y=weight,color=var))+#指定了x軸為date，y軸為weight，並根據var的值對點的顏色進行了分組。
  geom_point()+#添加了散點圖，將數據點表示在圖上。
  geom_line(aes(group=group))+ #加了連線圖，通過group變量將點連線起來。這意味著每個group中的點將被連接成一條線。
  xlab("date of harvest")+ #x axis title
  ylab("ear weight(g)")+   #y axis title
  guides(color=guide_legend(title="Cultivar"))+ #這個函數更改了圖例的標題，將點的顏色標籤改為了 "Cultivar"。
  theme_minimal()

phenology<-read.csv('phenology_short.csv')
phenology %>% 
  ggplot(.,aes(x=var,y=value))+
  geom_boxplot()+
  geom_jitter(width = 0.2, alpha = 0.7, color = "black") + #它將在箱形圖上添加一些抖動的點，以更清晰地顯示數據的分佈情況
  facet_grid(Year~stage)#Year是Row然後stage是Column(row~column)
  #facet_wrap(~ stage)#facet_wrap() 時，你依然將數據按照某個變數進行分組，但是不再形成網格狀的子圖，而是將子圖包裹在一行或多行中。

#Make this graph more beautiful!
phenology<-read.csv('phenology_short.csv')
phenology %>% 
  ggplot(.,aes(x=var,y=value, fill=var))+# 使用 fill=var 讓每個 var 的顏色不同
  geom_boxplot()+
  scale_fill_brewer(palette="Set3") +  # 使用 ColorBrewer 的調色板
  labs(title="Phenological Phases",
       subtitle="Thermal time",
       x="Cultivar",
       y="Value (°C d)",
       fill="Cultivar") +  # 調整圖例標題
  geom_jitter(width = 0.2, alpha = 0.7, color = "black") + #它將在箱形圖上添加一些抖動的點，以更清晰地顯示數據的分佈情況
  facet_grid(Year~stage)+#Year是Row然後stage是Column(row~column)
  theme_minimal()  # 使用簡潔主題



#Week4: column and row operations in dataframe



library(dplyr)
library(tidyr)
expand.grid() #用於生成所有可能的變量組合的數據框。


df <- expand.grid(x=letters[1:4],#letters 是一個預設的向量，包含了英文字母表的小寫字母（a 到 z）
                  y=1:2)
df

#practice
#subset the row where (x equals to “a”, y equals to 1) or (x equals to “c”, y equals to 2)
#How many ways to achieve this? you can use dplyr::filter or [].
#Observe the row names, are they the same before and after subseting?
subset_df <- df[(df$x == "a" & df$y == 1) | (df$x == "c" & df$y == 2), ]
subset_df
library(dplyr)
subset_df2 <- df %>% filter((x == "a" & y == 1) | (x == "c" & y == 2))
subset_df2

#Week5: pattern matching in dataframe

df <- data.frame(
  x1=1:3,
  x2=letters[1:3],
  x3=c("2a","2b","2c")
)
df
# or condition separate by |
df$x1==2|df$x3=="2c"

df %>% filter(x1==2|x3=="2c")
df %>% with(.,x1==2|x3=="2c")

# when not specifying the comma, it will be treated like column
df %>% with(.,.[x1==2|x3=="2c"])
# specify the rows
df %>% with(.,.[x1==2|x3=="2c",])



#2 more mutate examples

df <- expand.grid(x=letters[1:4],
                  y=1:2)%>%
  # combine columns x and y 
  mutate(z=interaction(x,y))
rownames(df) <- LETTERS[1:nrow(df)]
df

df %>% mutate(k=ifelse(x=="a","A","B"))
df %>% mutate(k=ifelse(y==1,"A","B"))
df %>% mutate(k=case_when(x=="a"~"A",#條件1 ~ 值1,
                          TRUE~"B"))#TRUE用於匹配所有未被前面的條件覆蓋到的情況。


#practice
df %>% mutate(k=case_when(x=="a"&y==1~"A",#條件1 ~ 值1,
                          TRUE~"B"))

#2.1.2 replace one column based on multiple conditions
df %>% mutate(k=case_when(x=="a"~"A",
                          x=="b"~"B",
                          TRUE~"C"))
#2.1.3 Look up table
look_table <- data.frame(x=letters,
                         X=LETTERS)
df %>% merge(look_table)#by: 指定用於合併的列名。如果不指定，merge() 會使用兩個數據框中共有的列作為鍵。

#practice
letters
match(x, table, nomatch = NA_integer_, incomparables = NULL)
ad<-match(c("c","a","b","d"),letters)
ad
LETTERS[c(ad)]
