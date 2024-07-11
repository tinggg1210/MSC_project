#???c(1,2,NA) %>% !is.na() #error



str(as.Date("2023-04-17"))
str(c(1,2,3))
str(seq(1,3,1))

install.packages(dplyr)
install.packages("dplyr")
library(dplyr)

##3.2 separate individual function from nested functions with %>%
# syntax of using pipe
library(dplyr)

fun1(object)
# .= object
object %>% fun1(.)#左邊只能當右邊的第一個參數input
# . could be also skipped
object %>% fun1()

# . = fun1(object)
object %>% fun1() %>% .
object %>% fun1(.) %>% .

#embedded functions
fun2(fun1(object))
# .=fun2(fun1(object))
object %>% 
  fun1() %>% 
  fun2() %>% .
1 %>%
  c(.,2,3)%>%
  length(.)



#Examples of using pipe

# how many ways of creating a sequence?
c(1,2,3)
seq(1,3,1)
1:3

# embedded function : fun2(fun1())
length(c(1,2,3))
# use pipe, "." is the result of previous step
c(1,2,3) %>% length(.)

# replicate element as vector
rep(1,3)
# remove duplicates
rep(1,3) %>% unique()
# cumulative sum #cumsum()計算累積和
rep(1,3) %>% cumsum()

# is there any difference?
#paste() 函數用於將字符向量的元素合併為一個單一的字符串。參數 collapse 用於指定合併時使用的分隔符。
#在 paste() 函數的 ... 參數中使用數字類型（numeric）是可以的，因為 paste() 會自動將數字類型轉換為字符類型並拼接。
paste(c("a","1"),collapse = "")#"a1"
#paste0() 函數是 R 中的簡化版 paste() 函數，它將不同的字符串拼接在一起，不使用分隔符。
paste0(c("a","1"))#"a" "1"
#輸入：單個字符向量 c("a", "1")，包含兩個元素。
#輸出：每個元素保持不變，沒有合併。
#結果："a" "1"（一個字符向量，包含兩個元素）
paste0("a","1")#"a1"
#輸入：多個單一字符參數 "a" 和 "1"。
#輸出：將它們拼接為一個字符串。
#結果："a1"（單個合併後的字符串）


#challenge1
?as.Date
date_element <- as.Date('2023-04-17')
date00<-date_element+c(0,1,2,3,4)
date00<-date_element+0:4
date00<-date_element+seq(0,4,1)
date00
mean(date00)

#challenge2
vec1<-c("a","b")
vec2<-c("1","2")
str(vec1)
str(vec2)
#hint
#rep(c("a","b"),each=2)
#rep(c("a","b"),times=2)
#paste(..., sep = " ", collapse = NULL)
#sep跟collapse的差異:
 #vec1 <- c("A", "B", "C")
 #vec2 <- c("1", "2", "3")
 #result <- paste(vec1, vec2, sep = "_", collapse = "; ")
 #print(result)  # [1] "A_1; B_2; C_3"
 #sep 設為 "_"，將每組參數組合起來，而 collapse 設為 "; "，將整個向量合併成單一字符串並用 "; " 分隔。
each_vec1<-rep(vec1,each=2)
times_vec2<-rep(vec2,times=2)
paste(each_vec1,times_vec2,sep = "")

times_vec1<-rep(vec1,times=2)
each_vec2<-rep(vec2,each=2)
paste(times_vec1,each_vec2,sep = "")


#3.3 write your first function
#公式
function_name <- function(X, Y, ...) {
  #input: datatype, length, meaning.
  #output: datatype, length, meaning.
  #action1: intermediate_variable <- input %>% fun1()
  #action2: output <-intermediate_variable%>% fun2()
  result <- some_operation(X, Y, ...)
  return(result)
}

plusone <- function(x){
  x+1
}
# is function data type sensitive?
plusone(variable)
plusone(Variable) 

#challenge3
sunnyday <- function(vec) {
  #input: a numeric vector with length 3
  #output: 'average value of vec ± standard deviation of vec'
  #action1: mean_vec<-mean(vec)
  #action2: sd_vec<-sd(vec)
  #action3: paste(mean_vec,sd_vec,sep = "±")
  mean_vec<-mean(vec)
  sd_vec<-sd(vec)
  result <- paste(mean_vec,sd_vec,sep = "±")
  return(result)
}
sunnyday(c(1:3))



sunnyday<-function(vec){
  #input=c(1,2,3)
  #output='2+1'
  #action1 mean(vec)
  #action2 sd(vec)
  #action3 paste(act1±act2)
  action0<-c(vec)
  action1<-mean(action0)
  action2<-sd(action0)
  paste(action1,'±',action2, sep = "", collapse =, recycle0 = FALSE)
}
sunnyday(c(1:3))

sunnyday2<-function(...){
  #input=c(1,2,3)
  #output='2+1'
  #action1 mean(vec)
  #action2 sd(vec)
  #action3 paste(act1±act2)
  action0<-c(...)
  action1<-mean(action0)
  action2<-sd(action0)
  paste(action1,'±',action2, sep = "", collapse =, recycle0 = FALSE)
}
sunnyday2(4,5,6,7,9,0)

#Week2: Working directory and accessor

#1 Conditions: logical operators and vectors

# 建立邏輯向量，邏輯值：TRUE 和 FALSE
logical_vector <- c(TRUE, FALSE, T, F)

# AND 運算符 
#單個 &（逐元素 AND 運算）如果每對元素都為 TRUE，則返回 TRUE，否則返回 FALSE。
c(TRUE, FALSE, TRUE) & c(TRUE, TRUE, FALSE) # 結果：TRUE FALSE FALSE
# 雙個 &&（僅比較第一個元素）如果第一個元素都為 TRUE，則返回 TRUE，否則返回 FALSE。
TRUE && FALSE # 結果：FALSE
TRUE && TRUE  # 結果：TRUE

# OR 運算符 
# 單個 |（逐元素 OR 運算）如果每對元素中有一個元素為 TRUE，則返回 TRUE，否則返回 FALSE。
c(TRUE, FALSE, TRUE) | c(TRUE, TRUE, FALSE) # 結果：TRUE TRUE TRUE
# 雙個 ||（僅比較第一個元素）
TRUE || FALSE # 結果：TRUE
FALSE || FALSE # 結果：FALSE

#NOT 運算符
#! 用於取反，將 TRUE 變成 FALSE，反之亦然。
!TRUE  # 結果：FALSE
!FALSE # 結果：TRUE
!c(TRUE, FALSE, TRUE) # 結果：FALSE TRUE FALSE

#比較運算符
#==：等於
#!=：不等於
#<：小於
#<=：小於等於
#>：大於
#>=：大於等於

#成員運算符用於檢查一個向量的元素是否存在於另一個向量中，並返回一組邏輯值 TRUE 或 FALSE。
# 建立向量
x <- c(1, 2, 3, 4, 5)
# 確認哪些元素在向量中
result1 <- 3 %in% x  # 結果：TRUE
result2 <- 10 %in% x # 結果：FALSE
# 多個元素的情況
y <- c(2, 4, 6)
result3 <- y %in% x  # 結果：TRUE TRUE FALSE
#在資料框中的應用
 #建立資料框
df <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David"),
  Age = c(25, 30, 35, 40),
  Score = c(85, 90, 95, 80)
)
 #使用 `%in%` 檢查特定名稱是否在資料框中
subset_df <- df[df$Name %in% c("Alice", "Charlie"), ]
subset_df
 #結果將包含 Alice 和 Charlie 的資料



# check if pattern exist in vector
3%in%c(1,3) #TRUE
# what is the difference?
c(1,3)%in%3 # [1] FALSE  TRUE
2%in%c(1,3) # [1] FALSE
1==2 # [1] FALSE
1==c(2,1) # [1] FALSE  TRUE
# elementwise check whether L equals
c(2,1)==1 # [1] FALSE  TRUE
# check identity pairwise
c(1,2)==c(2,4) #[1] FALSE FALSE
# is '!' reverse the logical vector?
!1==2 #[1] TRUE
1!=2  #[1] TRUE
c(1,3)==2 #[1] FALSE FALSE
# what does which() returns?用於找到向量中符合特定條件的索引。
which(c(1,3)==3) 
 #step1:which(FALSE,TRUE)返回這個邏輯向量中為 TRUE 的元素的位置
 #step2:結果：2
# what will be the data type? check with str()
library(dplyr)
c(1,2,NA) %>% is.na(.) #FALSE FALSE  TRUE
c(1,2,NA) %>% is.na() %>% which() #[1] 3
c(1,2,NA) %>% is.na() %>% !.#[1]  TRUE  TRUE FALSE
c(1,2,NA) %>% !is.na() #error
c(1,2,NA) %>% is.na() %>% !.


!is.na(c(1,2,NA)) #[1]  TRUE  TRUE FALSE

#Preconditions examples inside a function-if else function
if (condition) {
  # Code to execute if the condition is TRUE
} else {
  # Code to execute if the condition is FALSE
}
# check if data type match
arg <- ""
is.character(arg)
if(is.character(arg)){
  print("character")
}
if(is.character(arg)){
  print("character")
}else{
  error("type other than character")
}
if(is.character(arg)){
  warning("wrong")
}#警告訊息：wrong 
if(is.character(arg)){
  stop("wrong")
}#錯誤: wrong

#challenge
plusone <- function(x){
  if(is.numeric(x)){
    x+1}else{
      stop('wrong input type')}
  }

plusone(1)
plusone('r')