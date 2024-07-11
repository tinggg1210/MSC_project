##1.prduce true_data:1.filter true class:complete&blurry.complete2.create 'surface_tp'column3.merge genotype list
library(dplyr)
# Read the T32L75_detect file
T32L75_detect <- read.csv("D:/MSC_project/wenting_presentation/01data/T32L75_detect.csv")

# 1. Filter out rows with 'complete' and 'blurry.complete' in the 'truth.class' column
filtered_data <- T32L75_detect %>%
  filter(truth.class %in% c("complete", "blurry.complete"))

# 2. Create a new column called 'surface_tp'
filtered_data <- filtered_data %>%
  mutate(surface_tp = ifelse(as.numeric(substr(pic_name, nchar(pic_name), nchar(pic_name))) %in% 1:4, "abaxial", "adaxial"))

# 3. Read the Genotypes_list file
Genotypes_list <- read.csv("D:/MSC_project/wenting_presentation/01data/Genotypes_list.csv")

# Merge data based on the 'BRISONr' column in Genotypes_list and the numeric part after 'g' in the 'pic_name' column in T32L75_detect
merged_data <- filtered_data %>%
  mutate(BRISONr = as.numeric(sub(".*g([0-9]+)_.*", "\\1", pic_name))) %>%
  left_join(Genotypes_list, by = "BRISONr")

# Save the result as a new CSV file
write.csv(merged_data, "D:/MSC_project/wenting_presentation/03processed_data/true_data.csv", row.names = FALSE)


##2.produce per_pic:1.filter true class:complete&blurry.complete2.create calculated newcolumn&'surface_tp'column3.merge genotype list
library(dplyr)

# Read the T32L75_detect file
T32L75_detect <- read.csv("D:/MSC_project/wenting_presentation/01data/T32L75_detect.csv")

# 1. Filter out rows with 'complete' and 'blurry.complete' in the 'truth.class' column
filtered_data <- T32L75_detect %>%
  filter(truth.class %in% c("complete", "blurry.complete"))

# 2. Group by 'pic_name' and create new columns
grouped_data <- filtered_data %>%
  group_by(pic_name) %>%
  summarize(
    pic_name = first(pic_name),
    detect.bcn = sum(detect.class == "blurry.complete"),
    detect.cn = sum(detect.class == "complete"),
    detect.n = detect.bcn + detect.cn,
    detect.density = detect.n / 0.806,
    true.bcn = sum(truth.class == "blurry.complete"),
    true.cn = sum(truth.class == "complete"),
    true.n = true.bcn + true.cn,
    true.density = true.n / 0.806,
    true.area_mean = mean(truth.area, na.rm = TRUE)
  ) %>%
  ungroup() %>%
  mutate(
    surface_tp = ifelse(as.numeric(substr(pic_name, nchar(pic_name), nchar(pic_name))) %in% 1:4, "abaxial", "adaxial")
  )

# 3. Read the Genotypes_list file
Genotypes_list <- read.csv("D:/MSC_project/wenting_presentation/01data/Genotypes_list.csv")

# Extract the numeric part after 'g' and before '_' from 'pic_name' and merge data
grouped_data <- grouped_data %>%
  mutate(BRISONr = as.numeric(sub(".*g([0-9]+)_.*", "\\1", pic_name))) %>%
  left_join(Genotypes_list, by = "BRISONr")

# 4. Save the result as a new CSV file
write.csv(grouped_data, "D:/MSC_project/wenting_presentation/03processed_data/per_pic.csv", row.names = FALSE)


##3.prduce detect_data:1.filter detect class:complete&blurry.complete2.create 'surface_tp'column
library(dplyr)

# Read the T32L75_detect file
T32L75_detect <- read.csv("D:/MSC_project/wenting_presentation/01data/T32L75_detect.csv")

# 1. Filter out rows with 'complete' and 'blurry.complete' in the 'detect.class' column
filtered_data <- T32L75_detect %>%
  filter(detect.class %in% c("complete", "blurry.complete"))

# 2. Create a new column called 'surface_tp'
filtered_data <- filtered_data %>%
  mutate(surface_tp = ifelse(as.numeric(substr(pic_name, nchar(pic_name), nchar(pic_name))) %in% 1:4, "abaxial", "adaxial"))

# Save the result as a new CSV file
write.csv(filtered_data, "D:/MSC_project/wenting_presentation/03processed_data/detect_data.csv", row.names = FALSE)


