rm(list=ls())

data_train <- read.csv('/Users/sajjadislam/Documents/Academic Projects/Data Intelligence/project/Train_Data.csv')

data_stroke <- read.csv('/Users/sajjadislam/Documents/Academic Projects/Data Intelligence/project/healthcare-dataset-stroke-data.csv')
data_stroke <- data_stroke[, c("gender", "age", "hypertension", "heart_disease", "bmi", "stroke")]

##### Sort data #####
sortedData_train<-data_train[order(data_train$age),]
sortedData_stroke<-data_stroke[order(data_stroke$age),]


##### Missing Value #####
which(is.na(sortedData_train$age))
which(is.na(sortedData_train$sex))
which(is.na(sortedData_train$bmi))
which(is.na(sortedData_train$smoker))
which(is.na(sortedData_train$region))
which(is.na(sortedData_train$children))
which(is.na(sortedData_train$charges))


which(is.na(sortedData_stroke$bmi))
bmi_na_indices <- which(sortedData_stroke$bmi == "N/A")
print(length(bmi_na_indices))
sortedData_stroke <- sortedData_stroke[-bmi_na_indices, ]
which(is.na(sortedData_stroke$age))
which(is.na(sortedData_stroke$gender))
which(is.na(sortedData_stroke$hypertension))
which(is.na(sortedData_stroke$heart_disease))
which(is.na(sortedData_stroke$stroke))

# Convert categorical variable to numerical using label encoding
category_mapping <- c("female" = 0, "male" = 1)
sortedData_train$sex <- category_mapping[sortedData_train$sex]
category_mapping <- c("no" = 0, "yes" = 1)
sortedData_train$smoker <- category_mapping[sortedData_train$smoker]
category_mapping <- c("northeast" = 0, "northwest" = 0, "southeast" = 1, "southwest" = 1)
sortedData_train$region <- category_mapping[sortedData_train$region]

sex_sum <- table(sortedData_train$sex)
smoker_sum <- table(sortedData_train$smoker)
region_sum <- table(sortedData_train$region)

# Print the categorical sums
cat("Sex:\n")
print(sex_sum)
cat("\n")

cat("Smoker:\n")
print(smoker_sum)
cat("\n")

cat("Region:\n")
print(region_sum)

sortedData_train <- round(sortedData_train, digits = 0)
View(sortedData_train)

category_mapping <- c("Female" = 1, "Male" = 2)
sortedData_stroke$gender <- category_mapping[sortedData_stroke$gender]
colnames(sortedData_stroke)[colnames(sortedData_stroke) == "gender"] <- "sex"

sortedData_stroke$bmi <- as.numeric(sortedData_stroke$bmi)
# Round 'bmi' values to the nearest integer
sortedData_stroke$bmi <- round(sortedData_stroke$bmi)

sortedData_stroke <- round(sortedData_stroke, digits = 0)
View(sortedData_stroke)


##### Merge #####
merged_data <- merge(sortedData_train, sortedData_stroke, by = c("bmi", "age", "sex"))
View(merged_data)


#### Clean #####
summary_stats <- summary(sortedData_train)
print(summary_stats)
boxplot(sortedData_train$age, main = "Box Plot of Age", ylab = "Age")

# 27 outliers in 'bmi' columns 
boxplot(sortedData_train$bmi, main = "Box Plot of bmi", ylab = "BMI")
boxplot_bmi_out <- boxplot(sortedData_train$bmi, plot = FALSE)$out
print(length(boxplot_bmi_out))

# 362 outliers in 'charges'
boxplot(sortedData_train$charges, main = "Box Plot of charges", ylab = "charges")
boxplot_charges_out <- boxplot(sortedData_train$charges, plot = FALSE)$out
print(length(boxplot_charges_out))

sortedData_train <- sortedData_train[!(sortedData_train$bmi %in% boxplot_bmi_out), ]
sortedData_train <- sortedData_train[!(sortedData_train$charges %in% boxplot_charges_out), ]

sex_sum <- table(sortedData_train$sex)
smoker_sum <- table(sortedData_train$smoker)
region_sum <- table(sortedData_train$region)

# Print the categorical sums
cat("Sex:\n")
print(sex_sum)
cat("\n")

cat("Smoker:\n")
print(smoker_sum)
cat("\n")

cat("Region:\n")
print(region_sum)

correlation_age_bmi <- cor(sortedData_train$age, sortedData_train$bmi)
print(correlation_age_bmi)

correlation_age_charges <- cor(sortedData_train$age, sortedData_train$charges)
print(correlation_age_charges)

correlation_bmi_charges <- cor(sortedData_train$bmi, sortedData_train$charges)
print(correlation_bmi_charges)


hist(sortedData_train$charges)
plot(density(sortedData_train$charges), main = "Distribution Plot of Charges", xlab = "Charges", ylab = "Density")
sortedData_train$charges <- sqrt(sortedData_train$charges)
plot(density(sortedData_train$charges), main = "Distribution Plot of sqrt(Charges)", xlab = "Charges", ylab = "Density")
sortedData_train$charges <- log(sortedData_train$charges)
plot(density(sortedData_train$charges), main = "Normal Distribution Plot of Charges", xlab = "Charges", ylab = "Density")

summary_stats <- summary(merged_data)
print(summary_stats)
boxplot(merged_data$age, main = "Box Plot of Age", ylab = "Age")

# 27 outliers in 'bmi' columns 
boxplot(merged_data$bmi, main = "Box Plot of bmi", ylab = "BMI")
boxplot_bmi_out <- boxplot(merged_data$bmi, plot = FALSE)$out
print(length(boxplot_bmi_out))

merged_data <- merged_data[!(merged_data$bmi %in% boxplot_bmi_out), ]

boxplot(merged_data$children, main = "Box Plot of children", ylab = "Children")
# 362 outliers in 'charges' columns before removing 'bmi' outliers and 355 after removing 'bmi' outliers 
boxplot(merged_data$charges, main = "Box Plot of charges", ylab = "Charges")
boxplot_charges_out <- boxplot(merged_data$charges, plot = FALSE)$out
merged_data <- merged_data[!(merged_data$bmi %in% boxplot_charges_out), ]
print(length(boxplot_charges_out))

summary_stats <- summary(merged_data)
print(summary_stats)


##### Indicator Variables: bmi, smoker #####


##### Mathematical Transformations ######
hist(merged_data$charges)
plot(density(merged_data$charges), main = "Normal Distribution Plot of Charges", xlab = "Charges", ylab = "Density")
merged_data$charges <- sqrt(merged_data$charges)
plot(density(merged_data$charges), main = "Normal Distribution Plot of Charges", xlab = "Charges", ylab = "Density")
merged_data$charges <- log(merged_data$charges)
plot(density(merged_data$charges), main = "Normal Distribution Plot of Charges", xlab = "Charges", ylab = "Density")

