#?unique()

#5 dataframe is a special type of list
#對於dataframe跟list異同
#list:可以包含任意類型的數據：數字、字符、布爾值、向量、列表、數據框等。
#list:每個元素可以是不同的數據類型和長度。
#list:用於存儲異構數據，尤其是當數據結構不規則或者需要存儲嵌套數據時。
#list:非常靈活，適合存儲和傳遞不同類型和結構的數據。
#data.frame：創建一個列表是一種特殊的列表，其中每個元素（列）都是向量。
#data.frame：每一列中的數據類型必須一致，但不同列可以是不同數據類型。
#data.frame：所有列的長度必須相同。
#data.frame：用於存儲和處理結構化的表格數據，類似於數據庫中的表格或 Excel 工作表。
#data.frame：常用於數據分析、數據處理和統計建模。
# 創建一個列表
my_list <- list(
  name = "Alice",
  age = 30,
  scores = c(85, 90, 95),
  details = list(height = 170, weight = 60)
)
# 訪問元素
print(my_list$name)       # "Alice"
print(my_list[[2]])       # 30
print(my_list$scores)     # c(85, 90, 95)
print(my_list$details$height)  # 170
# 添加新元素
my_list$gender <- "Female"
print(my_list)

# 創建一個數據框
my_data_frame <- data.frame(
  name = c("Alice", "Bob", "Carol"),
  age = c(30, 25, 35),
  scores = c(90, 85, 88),
  gender = c("Female", "Male", "Female")
)
my_data_frame
or
my_data_frame <- data.frame(
  name = c("Alice", "Bob", "Carol"))
my_data_frame$age = c(30, 25, 35)
my_data_frame$scores = c(90, 85, 88)
my_data_frame$gender = c("Female", "Male", "Female")
my_data_frame

# 查看數據框的結構
print(my_data_frame)
# 添加新列(用$)
my_data_frame$height <- c(170, 180, 165)
print(my_data_frame)
  #或用mutate()在下方
# 合併列並將原本的移除  
tidyr::unite()
# 管理行名
df <- expand.grid(x=letters[1:4],
                  y=1:2)
df
rownames(df)#獲取數據框 df 的行名。
rownames(df) <- LETTERS[1:nrow(df)]#將數據框 df 的行名設置為大寫字母
rownames(df)
df
# 管理列名
colnames(df)  # 或者
names(df)
colnames(df) <- LETTERS[1:ncol(df)] #將數據框 df 的列名設置為大寫字母
rownames(df)
df

#data.frame[row行, column列]訪問
df <- data.frame(
  id = 1:5,
  name = c("Alice", "Bob", "Catherine", "David", "Ella"),
  age = c(25, 30, 22, 35, 28),
  department = c("HR", "Marketing", "IT", "Finance", "HR")
)
df
#使用 dplyr::filter：R 中，使用基本的 [] 索引篩選數據框時行名會被保留。使用 dplyr::filter 篩選時行名不會被保留
 # 筛选出年龄大于 25 的行
  older_than_25 <- filter(df, age > 25)
  print(older_than_25)
 # 筛选出部门为 HR 的行
  hr_department <- filter(df, department == "HR")
  print(hr_department)


#row行索引：可以是數字(2or1:3)、條件(df$age > 25or df$scores == 85)或留空。
 #使用方括號 [ ] 獲取特定的行：
  # 獲取第二行的所有列
  second_row <- df[2, ]
  print(second_row)
  # 獲取第一到第三行的所有列
  first_three_rows <- df[1:3, ]
  print(first_three_rows)
  # 選擇 'age' 大於 25 的行
  older_than_25 <- df[df$age > 25, ]
  print(older_than_25)
  # 選擇 'department' 為 'HR' 的行
  hr_department <- df[df$department == "HR", ]
  print(hr_department)
 #使用 dplyr::filter：R 中，使用基本的 [] 索引篩選數據框時行名會被保留。使用 dplyr::filter 篩選時行名不會被保留
  # 筛选出年龄大于 25 的行
  older_than_25 <- filter(df, age > 25)
  print(older_than_25)
  # 筛选出部门为 HR 的行
  hr_department <- filter(df, department == "HR")
  print(hr_department)
  
  
  
  
#column列索引：表示列索引，可以是數字(1or1:2)、列名("age"or c("name", "scores"))或留空。
 #使用方括號 [ ] 獲取特定的列
  # 獲取第三列（這裡是 'age' 列）
  age_column <- df[, 3]
  print(age_column) 
  # 獲取 'name' 列
  names_column <- df[, "name"]
  print(names_column)
 #使用 $ 或 [[ 直接訪問列：
  # 使用 $ 訪問 'department' 列
  department_column <- df$department
  print(department_column)
  # 使用 [[ 訪問 'age' 列
  age_column2 <- df[["age"]]#使用雙方括號 [[ ]]，表示提取單個元素或單個列。'age' 是列名，這個索引器僅用於提取單個元素，因此會返回 thermal_time 列的值。
  print(age_column2)
  age_column2 <- df["age"]#使用方括號 [ ]，表示提取列。這種方式可以提取整個age列。
  print(age_column2)
  
#同時索引行和列
 #使用方括號 [ , ] 同時索引行和列 
  # 選擇第一到第三行和第二到第三列的數據
  subset_df <- df[1:3, 2:3]
  print(subset_df)
  
  # 基於條件選擇行（年齡大於 25），並選擇 'name' 和 'department' 列
  subset_condition <- df[df$age > 25, c("name", "department")]
  print(subset_condition)
  


mutate()
# 是 dplyr 包中的一個函數，用於在 data.frame 或 tibble 中添加或修改列。這個函數非常強大且靈活，可以用來進行數據轉換和新特徵的創建。
#mutate(.data, ...)其中...：一個或多個名稱-值對，表示要添加或修改的列。
# 創建一個數據框
library(dplyr)
df <- data.frame(
  name = c("Alice", "Bob", "Carol"),
  age = c(30, 25, 35),
  scores = c(90, 85, 88)
)
print(df)
# 添加新列和修改現有列
df <- df %>%
  mutate(
    age_plus_5 = age + 5,#添加新列
    scores = scores - 2,#修改現有列
    weighted_sum = 0.3 * age + 0.7 * scores#多列的操作
  )
print(df)
#添加新列(這個新列是combine前面的columns)
df <- expand.grid(x=letters[1:4],
                  y=1:2)
df
df%>% mutate(paste(x,y))#添加新column叫paste(x, y)：x 和 y 變量的值連接在一起（預設分隔符為空白）。
df%>% mutate(z=paste(x,y))#添加新column叫z：x 和 y 變量的值連接在一起（預設分隔符為空白）。
df%>% mutate(z=paste(x,y,sep = "-"))#添加新column叫z：x 和 y 變量的值連接在一起（分隔符為-）。
df %>% mutate(id=1:n())#新增到最後一個row
df %>% mutate(id=1:nrow(.))#新增到最後一個row(nrow() 來獲取數據框的行數)
rownames(df)
rownames(df) <- LETTERS[1:nrow(df)]
rownames(df)
df







tidyr::unite()#函數將 x 和 y 兩列合併成一個新的列 z。預設的分隔符是底線 _。
df <- expand.grid(x=letters[1:4],
                  y=1:2)
df %>% tidyr::unite(data = .,col = "z",c(x,y))
df

#t():函數來實現將數據框（data frame）進行轉置（transpose）的操作
# 創建一個示例數據框
df <- data.frame(
  A = c(1, 2, 3),
  B = c(4, 5, 6),
  C = c(7, 8, 9)
)
# 查看原始數據框
print(df)
# 將數據框進行轉置
df_transposed <- t(df)
# 查看轉置後的數據框
print(df_transposed)

#Week3: dataframe and ggplot2
names()#可以把變數都叫出來
lapply()
summary()
unique()

#1 dplyr
dplyr::filter()
merge() #merged_data <- merge(x = dataframe1, y = dataframe2, by = "common_column")by：一個字符向量，指定用於合併的共同列的名稱。這是兩個數據框中都有的列，它們的值將被用來匹配行。
left_join()#是在 R 的 dplyr 套件中提供的一個函數，用於將兩個資料框（data frame）按照共同的變量進行左連接。左連接是一種合併操作，它保留第一個資料框中的所有行，並將第二個資料框中與之匹配的行合併在一起。
cbind()# "column bind"函數將提供的資料框或向量按列合併成一個新的資料框。如果提供的是資料框，則它們的行數應該相同，否則 cbind() 將根據最短的資料框的行數進行合併，並在其他資料框中缺少的行上添加缺失值。





#exercise
# create a dataframe 
df <- data.frame(time=as.Date("2023-04-16",format="%Y-%m-%d")+seq(1,3,1),
                 temp=c(20,15,13),
                 thermal_time=cumsum(c(20,15,13))) 
# another way
df <- data.frame(time=as.Date("2023-04-16",format="%Y-%m-%d")+seq(1,3,1)) 
                 df$temp=c(20,15,13)
                 df$thermal_time=cumsum(df$temp)
df
# third method
library(dplyr)
df <- data.frame(time=as.Date("2023-04-16",format="%Y-%m-%d")+seq(1,3,1)) %>% 
  mutate(temp=c(20,15,13), 
         thermal_time=cumsum(temp))
df

#challenge: Is it possible to create data frame with vectors of different length?
data.frame(time=as.Date("2023-04-16",format="%Y-%m-%d")+seq(1,3,1), 
           temp=c(20,13))#不同的列數: 3, 2出現error

df <- data.frame(time=as.Date("2023-04-16",format="%Y-%m-%d")+seq(1,3,1),
                 temp=c(20,15,13),
                 thermal_time=cumsum(c(20,15,13))) 
df
#Access column thermal_time as vector
column_thermal_time_as_vector<-df$thermal_time
column_thermal_time_as_vector

#Extract temp when time is 2023-04-17
time_is_2023_04_17<-df[df$time=='2023-04-17', "temp"]
time_is_2023_04_17
temp_on_2023_04_17 <- df[df$time == as.Date("2023-04-17"), "temp"]
print(temp_on_2023_04_17)


#Extract first row and first column with [1,]and [,1]
df[1,1]

#0.1 practice dataframe with real data
df <- data.frame(time=as.Date("2023-04-16",format="%Y-%m-%d")+seq(1,3,1),
                 temp=c(20,15,13), 
                 thermal_time=cumsum(c(20,15,13)))
df
df %>% dplyr::glimpse() 
names(df)
# extract column from dataframe
df$thermal_time
df[,3]
df[,'thermal_time']
df[['thermal_time']]

# not work
df[thermal_time]
# different error message
#!! name space conflict
df[time]
time

# summarize dataframe
lapply(df, range)
# turn as data frame
lapply(df, range) %>% data.frame()

summary(df)

#Note
#read the file with relative path using function read.csv().
getwd()
setwd('D:/MSC_project/data')
getwd()
read.csv('ear_summarized.csv')
ear<-read.csv('ear_summarized.csv')
ear
#find the row and column number of data frame by nrown() and ncol()
library(dplyr)
num_rows<-nrow(ear)
num_column<-ncol(ear)
number<-list(rows=num_rows,cols=num_column)
number
#check the range of each column using lapply(), how many unique days exist in column date? check unique()
range_of_each_column<-lapply(ear,range)
range_of_each_column
unique_dates <- unique(data$date)
num_unique_dates <- length(unique_dates)
print(num_unique_dates)
#compare the result of glimpse() and str()
glimpse(ear)
str(ear)
#extract column weight using [],[[]]and $
ear[,'weight']
ear[['weight']]
ear$weight
#what is the function of head() and tail()?
head(ear)
tail(ear)
#how to extract the first three row using []?
ear[1:3,]

df <- data.frame(time=as.Date("2023-04-16",format="%Y-%m-%d")+seq(1,3,1),
                 temp=c(20,15,13), 
                 thermal_time=cumsum(c(20,15,13)))
# df$time %>% str()
df %>% dplyr::filter(time=='2023-04-17') %>% .$temp
df %>% dplyr::filter(time==as.Date('2023-04-17')) %>% .$temp
# result is not save
df %>% dplyr::mutate(Year="2023") 
df
# result is saved
df$Year <- "2023"
df
df[['Year']] <- "2023"
df
#Combine dataframes by column
df <- data.frame(time=as.Date("2023-04-16",format="%Y-%m-%d")+seq(1,3,1),
                 temp=c(20,15,13), 
                 thermal_time=cumsum(c(20,15,13)))
df
# with same length dataframe
ear_df <- data.frame(time=as.Date("2023-04-16",format="%Y-%m-%d")+seq(1,3,1),
                     ear_weight=c(20,40,50))
ear_df
merge(df,ear_df,by="time")
dplyr::left_join(df,ear_df,by="time")
# combind with vector of same length 
cbind(df, ear_weight=c(20,40,50))
df$ear_weight <- c(20,40)

# with differnt length 
short_ear_df <- data.frame(time=as.Date("2023-04-16",format="%Y-%m-%d")+seq(1,2,1),
                           ear_weight=c(20,40))
short_ear_df
merge(df,short_ear_df,by="time")
dplyr::left_join(df,short_ear_df,by="time")

# combind with vector of different length 
cbind(df, ear_weight=c(20,40))
df$ear_weight <- c(20,40)





