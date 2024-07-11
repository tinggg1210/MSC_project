#???Note that windows user may need to first download the Rtools that match your R version.
#???如何更新r系統，r studio跟r root 都要處裡嗎？更新完畢後package要重新下載嗎？


#1.2 Concept of datatype & name space:

#vector cintains only 1 datatype
#Vector 是一種基本的數據結構，它是一組相同類型元素的有序集合。
#創建向量：c() 函數
# 邏輯向量
logical_vec <- c(TRUE, FALSE, NA)
# 整數向量
integer_vec <- c(1L, 2L, 3L)
# 數值向量
numeric_vec <- c(1.5, 2.6, 3.7)
# 複數向量
complex_vec <- c(1+1i, 2+2i, 3+3i)
# 字元向量：其中空字符串是一個字符向量，長度為 1，內容為空。
character_vec <- c("apple", "banana", "cherry")
# 原生向量
raw_vec <- charToRaw("Hello")
#索引與切片：使用 [] 來獲取單個或多個元素
# 獲取第一個元素
numeric_vec[1]
# 獲取第一和第三個元素
numeric_vec[c(1, 3)]
# 排除第二個元素
numeric_vec[-2]
#向量的運算:針對數值向量進行加減乘除等操作
vec1 <- c(1, 2, 3)
vec2 <- c(4, 5, 6)
# 加法
vec_sum <- vec1 + vec2
# 乘法
vec_prod <- vec1 * vec2

#Variable = variable names + object

#2 Data type is everything

#Data Types常見的數據類型
#Numeric（數字類型）包含整數和浮點數（數字）例如：1, 2.5, 3.1415
#Integer（整數）整數，結尾加上 L 表示例如：2L, 10L
#Complex（複數）具有虛數部分的數字例如：1+2i, 3-4i
#Logical（邏輯值）只有兩個值：TRUE 和 FALSE
#Character（字符）字符串或文本例如："Hello", "World"
#Factor（因子）類別數據類型，儲存定性變量
#Raw（原始類型）用於儲存原始字節數據
#Date（日期）和 POSIXct/POSIXlt（日期時間）Date 用於日期，POSIXct 和 POSIXlt 用於日期和時間
#List（列表）儲存不同類型元素的集合
#Data Frame（數據框）表格形式的數據結構，可以儲存不同類型的列
#Matrix（矩陣）二維數據結構，只能包含同一數據類型
#Array（數組）多維數據結構，只能包含同一數據類型

variable
# assignment str"v" to name "variable"
## "" and unquote str and variable 
variable <- "v"
Variable <- 1

variable +1
Variable +1 

#2.1Always check your data type first!
# str()可以check data type
str()
?str
str(variable)
str(Variable)
# data type coersion（數據類型強制轉換）指的是將一種數據類型自動或手動轉換為另一種數據類型的過程。
#R 中的向量是同質的（即所有元素必須具有相同的數據類型），因此如果你嘗試將不同類型的數據放在同一向量中，R 會自動將所有元素轉換為最高級別的數據類型。數據類型的優先順序如下：
#logical < integer < numeric < complex < character(最高級)
str(NA)#logi NA。雖然邏輯型通常只有 TRUE 和 FALSE 兩個值，但邏輯型的 NA 是一個特殊的缺失值，預設下 NA 被視為邏輯型缺失值，因此會顯示為 logi NA。
str(c(NA,1))#num [1:2] NA 1#其中[1:2] 表示這個數值型向量的索引範圍是 1 到 2
str(c(NA,"a"))
str(c(NA,TRUE))
str(c(1,"a"))

#2.2 Date
#as.Date() 是 R 語言中用於將數據轉換為日期類型的函數。它常見的用法包括從字符串、數字或其他類型轉換成 Date 對象，以便進行日期計算和操作。
#as.Date(x, format, tryFormats, origin, ...)
# 轉換字符串為日期
date1 <- as.Date("2024-05-05", format = "%Y-%m-%d")#format預設是t="%Y-%m-%d"
print(date1)
# [1] "2024-05-05"
# 使用不同的格式轉換
date2 <- as.Date("05/05/2024", format = "%m/%d/%Y")
print(date2)
# [1] "2024-05-05"

as.Date("2023-04-17")
as.Date("2023-04-17",format="%Y-%m-%d")
# is ther any error?
as.Date("20230417")#error-字串的格式不夠標準明確
as.Date("2023-04-17")
as.Date("17042023")#error-字串的格式不夠標準明確
as.Date("17-04-2023",format="%d-%m-%Y")
# additive properties of Date 
as.Date("2023-04-17")-7#"2023-04-10"
as.Date("2023-04-17")+2#"2023-04-19"
str(as.Date("2023-04-17"))#Date[1:1], format: "2023-04-17"

## example: fun(object)
c(1,2,3)
seq(1,3,1)#seq(from = , to = , by = , length.out = , along.with = )
mean(c(1,2,3))
str(TRUE)

#3.1 r packages : collection of functions
install.packages(dplyr)#要是character type
install.packages("dplyr")
library(dplyr)
install.packages("tidyverse")
library(tidyverse)
