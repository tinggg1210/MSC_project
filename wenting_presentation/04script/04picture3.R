library(ggplot2)

#lineplot for True Density by Year of Release
data1 <- read.csv("D:/MSC_project/wenting_presentation/03processed_data/per_pic.csv")

ggplot(data1, aes(x = Year_of_release, y = true.density, color = surface_tp, group = surface_tp)) +
  geom_line() +
  geom_point() +
  labs(title = "True Density by Year of Release",
       x = "year of Release",
       y = "stomata density",
       color = "Surface Type") +
  theme_minimal()



SlidingWindow <- function(FUN, data, window, step){
  # from EvobiR
  total <- length(data)
  spots <- seq(from = 1, to = (total - window + 1), by = step)
  vector(length = length(spots))
  result <-purrr::map_dbl(1:length(spots),function(i){
    match.fun(FUN)(data[spots[i]:(spots[i] + window - 1)])
  })
  # complete failure message
  if(!exists("result")) stop("Hmmm unknown error... Sorry")
  # 
  # return the result to the user
  return(result)
}

tr <- "your_column_name"
x <- "your data frame"

RYear <- SlidingWindow("Namean", x$RYear, PointNr,1)
slide_mean <- SlidingWindow("Namean", x[[tr]], PointNr,1)
slide_sd <- SlidingWindow("Nasd", x[[tr]], PointNr,1)
lr <- try(lm(slide_mean~RYear)) 