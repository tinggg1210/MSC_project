#add a new 1column of Surface_Type:abaxial,adaxial
library(dplyr)
file_path <- "D:/MSC_project/wenting_presentation/03processed_data/T32L75_detect.csv"
data <- read.csv(file_path)
data <- data %>%
  mutate(last_char = substr(pic_name, nchar(pic_name), nchar(pic_name)))
data <- data %>%
  mutate(Surface_Type= case_when(
    last_char %in% c("1", "2", "3", "4") ~ "abaxial",
    last_char %in% c("5", "6", "7", "8") ~ "adaxial",
    TRUE ~ NA_character_
  ))
head(data)
write.csv(data, file_path, row.names = FALSE)




# Generate a CSV file containing the mean width, mean length, mean area, and density for each photo.
library(dplyr)
data1 <- read.csv("D:/MSC_project/wenting_presentation/03processed_data/T32L75_detect.csv")
# first selection
filtered_data_truth <- data1 %>%
  filter(truth.class %in% c("complete", "blurry.complete"))
stomata_stats_truth <- filtered_data_truth %>%
  group_by(pic_name) %>%
  summarise(
    mean.width = mean(truth.width),
    mean.length = mean(truth.length),
    mean.area = mean(truth.area),
    Surface_Type = first(Surface_Type),  
    true.number = n()
  ) %>%
  mutate(true.density = true.number / 0.806)
# second selection
filtered_data_detect <- data %>%
  filter(detect.class %in% c("complete", "blurry.complete"))
stomata_stats_detect <- filtered_data_detect %>%
  group_by(pic_name) %>%
  summarise(
    detect.number = n()
  ) %>%
  mutate(detect.density = detect.number / 0.806)

stomata_per_picture <- stomata_stats_truth %>%
  left_join(stomata_stats_detect, by = "pic_name")

write.csv(stomata_per_picture, "D:/MSC_project/wenting_presentation/03processed_data/stomata_per_picture.csv", row.names = FALSE)




#add genotype into the a CSV file
stomata_per_picture <- read.csv("D:/MSC_project/wenting_presentation/03processed_data/stomata_per_picture.csv")
final_merged_data <- read.csv("D:/MSC_project/wenting_presentation/01data/final_merged_data.csv")

stomata_per_picture$pic_name_trimmed <- sub("_\\d+$", "", stomata_per_picture$pic_name)
final_merged_data$pic_name_trimmed <- sub("_\\d+$", "", final_merged_data$pic_name)

merged_data <- merge(stomata_per_picture, final_merged_data[, c("pic_name_trimmed", "BRISONr", "Genotype", "code", "breeder", "Year_of_release", "RYear", "Quality_recent", "Release_state", "Hybrid.status", "Group")], 
                     by = "pic_name_trimmed", all.x = TRUE)

merged_data$pic_name_trimmed <- NULL

write.csv(merged_data, "D:/MSC_project/wenting_presentation/03processed_data/stomata_per_picture.csv", row.names = FALSE)






