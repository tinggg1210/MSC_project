variable
# assignment str"v" to name "variable"
## "" and unquote str and variable 
variable <- 'v'
Variable <- 1

variable +1
Variable +1 

# str??
str()
?str
str(variable)
str(Variable)
# data type coersion
str(NA)
str(c(NA,1))
str(c(NA,"a"))
str(c(NA,TRUE))
str(c(1,"a"))
?
as.Date("2023-04-17")
as.Date("2023-04-17",format="%Y-%m-%d")
# is ther any error?
as.Date("20230417")
as.Date("2023-04-17")
as.Date("17042023")
as.Date("17-04-2023",format="%d-%m-%Y")
# additive properties of Date 
as.Date("2023-04-17")-7
as.Date("2023-04-17")+2