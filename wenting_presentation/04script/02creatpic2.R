# 加载所需的库
library(ggplot2)
library(ggpmisc)
library(gridExtra)

# 读取数据
data <- read.csv("D:/MSC_project/wenting_presentation/03processed_data/true_data.csv")
data1 <- read.csv("D:/MSC_project/wenting_presentation/03processed_data/per_pic.csv")

# 创建图表
plot1<-ggplot(data, aes(x = Year_of_release, y = truth.width, color = surface_tp)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "Year of Release", y = "Stomata Width") +
  theme_minimal() +
  theme(legend.position = "none")+
  stat_smooth(method = "lm", se = FALSE, aes(group = surface_tp), linetype = "dashed") +
  stat_poly_eq(aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")), 
               formula = y ~ x, parse = TRUE, size = 4)

plot2<-ggplot(data, aes(x = Year_of_release, y = truth.length, color = surface_tp)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "Year of Release", y = "Stomata Length",color = "Surface Type") +
  theme_minimal() +
  stat_smooth(method = "lm", se = FALSE, aes(group = surface_tp), linetype = "dashed") +
  stat_poly_eq(aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")), 
               formula = y ~ x, parse = TRUE, size = 4)

plot3<-ggplot(data, aes(x = Year_of_release, y = truth.area, color = surface_tp)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "Year of Release", y = "Stomata Area") +
  theme_minimal() +
  theme(legend.position = "none")+
  stat_smooth(method = "lm", se = FALSE, aes(group = surface_tp), linetype = "dashed") +
  stat_poly_eq(aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")), 
               formula = y ~ x, parse = TRUE, size = 4)

plot4<-ggplot(data1, aes(x = Year_of_release, y = true.density, color = surface_tp)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "Year of Release", y = "Stomata Density",,color = "Surface Type") +
  theme_minimal() +
  stat_smooth(method = "lm", se = FALSE, aes(group = surface_tp), linetype = "dashed") +
  stat_poly_eq(aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")), 
               formula = y ~ x, parse = TRUE, size = 4)

combined_plot <- grid.arrange(plot1, plot2, plot3, plot4, ncol = 2, nrow = 2)


