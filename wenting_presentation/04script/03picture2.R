# Load necessary packages
library(ggplot2)
library(dplyr)
library(gridExtra)

# Read data
detect_data <- read.csv("D:/MSC_project/wenting_presentation/03processed_data/T32L75_detect.csv")
stomata_data <- read.csv("D:/MSC_project/wenting_presentation/03processed_data/stomata_per_picture.csv")

# 1. First filter T32L75_detect data: filter for 'complete' and 'blurry.complete' in truth.class
filtered_detect_data <- detect_data %>%
  filter(truth.class %in% c("complete", "blurry.complete"))

# Plot the first scatter plot: x-axis: truth.width, y-axis: detect.width
p1 <- ggplot(filtered_detect_data, aes(x = truth.width, y = detect.width)) +
  geom_point() +
  geom_smooth(method = "lm", col = "black") +
  labs(title = "Truth Width vs Detect Width",
       x = "Truth Width",
       y = "Detect Width") +
  theme_minimal() +
  annotate("text", x = Inf, y = Inf, label = paste("r =", round(cor(filtered_detect_data$truth.width, filtered_detect_data$detect.width), 2)), 
           hjust = 1.1, vjust = 2, size = 5, color = "black")

# Plot the second scatter plot: x-axis: truth.length, y-axis: detect.length
p2 <- ggplot(filtered_detect_data, aes(x = truth.length, y = detect.length)) +
  geom_point() +
  geom_smooth(method = "lm", col = "black") +
  labs(title = "Truth Length vs Detect Length",
       x = "Truth Length",
       y = "Detect Length") +
  theme_minimal() +
  annotate("text", x = Inf, y = Inf, label = paste("r =", round(cor(filtered_detect_data$truth.length, filtered_detect_data$detect.length), 2)), 
           hjust = 1.1, vjust = 2, size = 5, color = "black")

# Plot the third scatter plot: x-axis: truth.area, y-axis: detect.area
p3 <- ggplot(filtered_detect_data, aes(x = truth.area, y = detect.area)) +
  geom_point() +
  geom_smooth(method = "lm", col = "black") +
  labs(title = "Truth Area vs Detect Area",
       x = "Truth Area",
       y = "Detect Area") +
  theme_minimal() +
  annotate("text", x = Inf, y = Inf, label = paste("r =", round(cor(filtered_detect_data$truth.area, filtered_detect_data$detect.area), 2)), 
           hjust = 1.1, vjust = 2, size = 5, color = "black")

# 2. Use stomata_per_picture data to plot the fourth scatter plot: x-axis: true.density, y-axis: detect.density

p4 <- ggplot(stomata_data, aes(x = true.density, y = detect.density)) +
  geom_point() +
  geom_smooth(method = "lm", col = "black") +
  labs(title = "True Density vs Detect Density",
       x = "True Density",
       y = "Detect Density") +
  theme_minimal() +
  annotate("text", x = Inf, y = Inf, label = paste("r =", round(cor(stomata_data$true.density, stomata_data$detect.density), 2)), 
           hjust = 1.1, vjust = 2, size = 5, color = "black")

# Plot the fifth scatter plot: x-axis: true.number, y-axis: detect.number
p5 <- ggplot(stomata_data, aes(x = true.number, y = detect.number)) +
  geom_point() +
  geom_smooth(method = "lm", col = "black") +
  labs(title = "True Number vs Detect Number",
       x = "True Number",
       y = "Detect Number") +
  theme_minimal() +
  annotate("text", x = Inf, y = Inf, label = paste("r =", round(cor(stomata_data$true.number, stomata_data$detect.number), 2)), 
           hjust = 1.1, vjust = 2, size = 5, color = "black")


# 3. Combine the five plots into one big plot
combined_plot <- grid.arrange(p1, p2, p3, p4, p5, ncol = 2)

# Display the combined plot
print(combined_plot)
