library(ggplot2)
library(rstatix)
library(dplyr)
library(ggpubr)
library(gridExtra)


file_path <- "D:/MSC_project/wenting_presentation/03processed_data/true_data.csv"
data <- read.csv(file_path)

# boxplot: y軸為truth.width，x軸為surface_tp
boxplot_width <- ggplot(data) +
  geom_boxplot(aes(x = surface_tp, y = truth.width),fill = '#00AFBB') +
  labs(x = "surface type",
       y = "stomata width") +
  theme_minimal()

stat.test <- data %>%
  t_test(truth.width ~ surface_tp) %>%
  adjust_pvalue(method = "bonferroni") %>%
  add_significance()
stat.test <-stat.test %>% add_xy_position(x = "surface_tp")
bxp_width<-boxplot_width + stat_pvalue_manual(stat.test, label = "p = {p}", 
                          y.position = "y.position", 
                          tip.length = 0.03)
bxp_width

# boxplot: y軸為truth.length，x軸為surface_tp
boxplot_length <- ggplot(data) +
  geom_boxplot(aes(x = surface_tp, y = truth.length),fill = '#00AFBB') +
  labs(x = "surface type",
       y = "stomata length") +
  theme_minimal()

stat.test <- data %>%
  t_test(truth.length ~ surface_tp) %>%
  adjust_pvalue(method = "bonferroni") %>%
  add_significance()
stat.test <-stat.test %>% add_xy_position(x = "surface_tp")
bxp_length<-boxplot_length + stat_pvalue_manual(stat.test, label = "p = {p}", 
                                              y.position = "y.position", 
                                              tip.length = 0.03)
bxp_length


# boxplot: y軸為truth.area，x軸為surface_tp
boxplot_area <- ggplot(data) +
  geom_boxplot(aes(x = surface_tp, y = truth.area),fill = '#00AFBB') +
  labs(x = "surface type",
       y = "stomata area") +
  theme_minimal()

stat.test <- data %>%
  t_test(truth.area ~ surface_tp) %>%
  adjust_pvalue(method = "bonferroni") %>%
  add_significance()
stat.test <-stat.test %>% add_xy_position(x = "surface_tp")
bxp_area<-boxplot_area + stat_pvalue_manual(stat.test, label = "p = {p}", 
                                                y.position = "y.position", 
                                                tip.length = 0.03)

file_path <- "D:/MSC_project/wenting_presentation/03processed_data/per_pic.csv"
data1 <- read.csv(file_path)

# boxplot: y軸為true.density，x軸為surface_tp
boxplot_density <- ggplot(data1) +
  geom_boxplot(aes(x = surface_tp, y = true.density),fill = '#00AFBB') +
  labs(x = "surface type",
       y = "stomata density") +
  theme_minimal()

stat.test <- data1 %>%
  t_test(true.density ~ surface_tp) %>%
  adjust_pvalue(method = "bonferroni") %>%
  add_significance()
stat.test <-stat.test %>% add_xy_position(x = "surface_tp")
bxp_density<-boxplot_density + stat_pvalue_manual(stat.test, label = "p = {p}", 
                                              y.position = "y.position", 
                                              tip.length = 0.03)


# 顯示所有boxplot
print(bxp_width)
print(bxp_length)
print(bxp_area)
print(bxp_density)
combined_plot <- grid.arrange(bxp_width, bxp_length, bxp_area, bxp_density, ncol = 2)


#scatter plot y軸為true.area_mean，x軸為true.density
library(ggplot2)
per_pic <- read.csv("D:/MSC_project/wenting_presentation/03processed_data/per_pic.csv")

# 繪製散點圖
ggplot(per_pic, aes(x = true.density, y = true.area_mean)) +
  geom_point() +
  geom_smooth(method = "loess", se = FALSE, color = "blue") +
  labs(title = "Scatter Plot of True Area Mean vs. True Density",
       x = "True Density",
       y = "True Area Mean") +
  theme_minimal()
