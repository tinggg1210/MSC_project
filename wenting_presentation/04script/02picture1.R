library(ggplot2)
library(dplyr)

stomata_data <- read.csv("D:/MSC_project/wenting_presentation/03processed_data/stomata_per_picture.csv")

p1 <- ggplot(stomata_data, aes(x = Surface_Type, y = mean.width, fill = Surface_Type)) +
  geom_boxplot() +
  labs(title = "boxplot of stomata width by surface type",
       x = "surface type",
       y = "stomata width") +
  theme_minimal() +
  theme(legend.position = "none")

p2 <- ggplot(stomata_data, aes(x = Surface_Type, y = mean.length, fill = Surface_Type)) +
  geom_boxplot() +
  labs(title = "boxplot of stomata length by surface type",
       x = "surface type",
       y = "stomata length") +
  theme_minimal() +
  theme(legend.position = "none")

p3 <- ggplot(stomata_data, aes(x = Surface_Type, y = mean.area, fill = Surface_Type)) +
  geom_boxplot() +
  labs(title = "boxplot of stomata area by surface type",
       x = "surface type",
       y = "stomata area") +
  theme_minimal() +
  theme(legend.position = "none")

p4 <- ggplot(stomata_data, aes(x = Surface_Type, y = true.density, fill = Surface_Type)) +
  geom_boxplot() +
  labs(title = "boxplot of stomata area by surface type",
       x = "surface type",
       y = "stomata density") +
  theme_minimal() +
  theme(legend.position = "none")

library(gridExtra)
grid.arrange(p1, p2, p3, p4, ncol = 2)


# correlation matrix
library(dplyr)
library(ggcorrplot)
stomata_data1 <- read.csv("D:/MSC_project/wenting_presentation/03processed_data/stomata_per_picture.csv")
cor_matrix <- stomata_data1 %>%
  select(mean.width, mean.length, mean.area, true.density) %>%
  cor()
ggcorrplot(cor_matrix, 
           lab = TRUE, 
           title = "correlation matrix for stomata traits",
           colors = c("green", "white", "orange"))
