#2 Working directory
#What is working directory?在電腦中當前正在使用的目錄。當你在 R 或其他編程環境中讀取或寫入文件時，系統會預設在這個目錄中進行操作。了解和設定工作目錄是進行文件操作（例如讀取數據文件或保存輸出文件）的基礎。
#read.csv()讀取文件
#write.csv()寫入文件
#getwd()查看當前工作目錄
#setwd()設定工作目錄
#注意事項:在 Windows 中使用反斜杠 \，記得要變成/,例如：C:/Users/YourName/Documents/Data

getwd()#[1] "D:/MSC_project/src"
setwd(".") #"." 表示當前工作目錄
getwd() #[1] "D:/MSC_project/src"
setwd("..")#".." 表示當前工作目錄的父目錄
getwd()#[1] "D:/MSC_project"

dirname()#(1)從文件路徑中提取目錄部分或是(2)從目錄路徑中提取父目錄
#(1)
path <- "/home/user/documents/file.txt"
dir <- dirname(path)
print(dir)#[1] "/home/user/documents"
#(2)
path <- "/home/user/documents/"
dir <- dirname(path)
print(dir)#[1] "/home/user"

list.files()#列出指定目錄中的所有文件和子目錄

#3 get element from a vector with accessors []
vec[c(2,1,3)]#變更提取的順序:2>1>3
vec[-2]#從向量 vec 中移除第二個元素，並返回剩餘的元素。
vec[0]# indexing start from 1, not 0 therefore you get, numeric(0)
vec[4]#超過原本的數量，會返回[1] NA，表示該位置沒有值。
vec %>% .[length(.)+1]#vec[length(vec)+1]
vec[4:1]#等同於 vec[c(4, 3, 2, 1)]，即按照索引 4, 3, 2, 1 提取元素。
vec[c(F,T,F)]#每個邏輯值對應 vec 中相應位置的元素，TRUE 表示選擇該元素，FALSE 表示不選擇該元素。
vec[vec==5]#從向量 vec 中提取所有等於 5 的元素。#當找不到時返回numeric(0)
vec <- c(1, 2, 3, 4, 5)
 logical_vec <- c(TRUE, FALSE)
 subset_vec <- vec[logical_vec]#當你使用邏輯向量來索引一個向量時，邏輯向量的長度會自動重複（recycle）以匹配被索引向量的長度。如果邏輯向量的長度小於被索引向量的長度，R 會重複使用邏輯向量中的元素，直到達到被索引向量的長度。
 subset_vec#[1] 1 3 5

#4 list: keep the diversity of data type
#list是一種數據結構，它可以包含不同類型的元素，這與向量（vector）不同。
#每一個數據稱為列表的「元素」。這些元素可以是數字、字符、向量、數據框、函數，甚至是其他列表:
my_list <- list(name = "Alice", age = 25, scores = c(90, 85, 88))
#第一個元素：名稱：name，值："Alice"，類型：字符向量
#命名元素（Named Elements）：name、age 和 scores 是命名元素。
#位置元素（Positional Elements）：位置元素是指通過元素在列表或數據框中的位置來訪問元素。這些位置從 1 開始編號。



#使用 $ 操作符：用於直接訪問列表或數據框的命名元素。只能用於命名元素，不能用於位置索引。返回元素本身的值
 #1訪問命名元素：
  #name <- my_list$name('name'或name都可以)
  #print(name)  # [1] "Alice" 
 #2修改命名元素：
  #my_list$name <- "Bob"
  #print(my_list$name)  # [1] "Bob"
 #3添加新元素：
  #my_list$gender <- "Female"
  #print(my_list$gender)  # [1] "Female"
#使用 [] 操作符
 #1訪問命名元素：
  #name <- my_list["name"]
  #print(name)  # $name [1] "Alice" 這裡，name 是一個子列表，包含 name 元素。
 #2訪問多個元素也可以用位置元素：
  #sub_list <- my_list[c("name", "age")]或是用my_list[1:2]
  #print(sub_list) # $name [1] "Alice"、$age [1] 25 這裡，sub_list 是一個子列表，包含 name 和 age 元素。
  #如果沒有命名元素其結果會跑出[[1]]表示這是一個列表中的第一個元素。[1] 1 表示這個元素的值是數字 1。
#使用 [[]] 操作符：用於訪問列表或數據框的命名元素或位置元素。返回元素本身的值。
 #1訪問命名元素：
  #name <- my_list[["name"]]
  #print(name)  # [1] "Alice"
 #2訪問位置元素：
  #age <- my_list[[2]]
  #print(age)  # [1] 25 這裡，age 是一個數值，包含值 25。
 #3訪問元素中某特定值
  #score_90 <- my_list[["scores"]
  #print(score_90) # [1] 90

#lapply(X, FUN, ...) 函數是一個用來對列表或向量中的每個元素應用指定函數並返回結果列表的高階函數。
#它返回一個相同長度的新列表，保持了原始列表的結構，同時每個元素都是經過函數處理後的結果。



#exercise

library(dplyr)

# working directory, abbreviated as "."
getwd()
# parent directory, abbreviated as ".."
dirname(getwd())
# assign current path to variable
current_path <- getwd()
# check the type 
current_path %>% str()


# check files in the directory

# are they different?
"." %>% list.files(path=.)     #[1] "Week1.R" "Week2.R" "Week3.R"
getwd() %>% list.files(path=.) #[1] "Week1.R" "Week2.R" "Week3.R"

# are they different? same,列出父目錄裡的所有文件
".." %>% list.files(path=.)
getwd() %>% dirname() %>% list.files(path=.)


# absolute path, did you get error?
"C:/Users/marse/seadrive_root/Tien-Che/My Libraries/PhD_Tien/Project/Postdoc_teaching/BSC_project_IPFS2023/data" %>% list.files(path=.)
# relative path in R base
parent_path <- getwd() 
paste0(parent_path,"/data") %>% list.files(path=.)

# Does this works? 
".\data" %>% list.files(path=.)
"data" %>% list.files(path=.)


#3 exercise
empty_vec <- c()
length(empty_vec)
# what is the type of the empty vec?
empty_vec %>% str()#NULL

# NULL: empty 
empty_vec[1]
empty_vec[0]


vec <- c(1,3,5)
vec[1]#[1] 1
#reorder the vector 
vec[c(2,1,3)]#[1] 3 1 5

# removing the indexed elements
vec[-1]#[1] 3 5
vec[-2]#[1] 1 5

# indexing start from 1, not 0
# therefore you get, numeric(0)
vec[0]
# when access exceeding the range of a vector, what datatype do you get? 
vec[4]
vec %>% .[length(.)+1]
vec[1:4]
vec[4:1]

# find specific element or position
vec[c(F,T,F)]
vec[vec==5]
# when codition not match at all, it will return? 
vec[vec==2]
vec[c(F,F,F)]
vec %>% .[c(F)]
vec[vec=="a"]

# default str vector
letters
LETTERS
# when the query does not match, guess what will be the datatype? 
letters %>% .[.==2]
letters %>% .[c(F)]
# vector over write
vec
vec <- c(2,1,3)
vec


#
vec <- c(1, 2, 3, 4, 5)
logical_vec <- c(TRUE, FALSE)
subset_vec <- vec[logical_vec]
subset_vec#[1] 1 3 5


#exercise
# create a simple list
list(1)
# create a simple list with name "x" for first element
list(x=1)
list(x=1)["x"]
# extract content
list(x=1)$'x'
list(x=1)[[1]]
list(x=1)[["x"]]

# extract with pipe
list(x=1) %>% .[[1]]
list(x=1) %>% .$"x"

# long list
list_complex_example <- list(1,c(1,2),
                          T,c(T,T),
                          "str",c("a","b"),
                          list(1),
                          mean,data.frame())
# check the content
list_complex_example
# check structure of this list 
# list_complex_example %>% str()
# list_complex_example %>% glimpse()
# list_complex_example
# first list 
list_complex_example[1]
# content of first list
list_complex_example[[1]]
# first element of content of first list
list_complex_example[[1]][1]

#challenge
# non-sense
long_list_example[[1]][2]
long_list_example[1][1]
long_list_example[1][2]
long_list_example[2][2]
# meaningful
long_list_example[[2]][2]


# input is vector
c(1,4) %>% 
  lapply(.,FUN=function(x){x+3})
# input is list
list(2,4,c(1,4)) %>% 
  lapply(.,FUN=function(x){x+3})
# input has differnt type
list(2,4,c(1,4),"8") %>% 
  lapply(.,FUN=function(x){x+3})
