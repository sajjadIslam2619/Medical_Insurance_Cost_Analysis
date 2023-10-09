##clear working directory
rm(list=ls())
data_train <- read.csv('Train_Data.csv')
View(data_train)
print(class(data_train))

data_test <- read.csv('Test_Data.csv')
View(data_test)
print(class(data_test))

# Perform inner join based on a common column
#merged_data <- merge(data_train, data_test, by = "bmi")
# Display the merged data
#View(merged_data)

##### Sort #####
sortedData_train<-data_train[order(data_train$age),]

column_names <- colnames(sortedData_train)
print(column_names)

##### Missing Value #####
which(is.na(sortedData_train$age))
which(is.na(sortedData_train$sex))
which(is.na(sortedData_train$bmi))
which(is.na(sortedData_train$smoker))
which(is.na(sortedData_train$region))
which(is.na(sortedData_train$children))
which(is.na(sortedData_train$charges))
#is.na(sortedData_train$age)


# Check for missing values in the entire dataframe except for the 'age' column
#missing_values <- !complete.cases(sortedData_train)
# Display the rows with missing values
#print(sortedData_train[missing_values, ])

##### Omit: not necessary. No missing value #####
##### Merge: not necessary yet. No related dataset found #####

print(dim(sortedData_train))
##### Clean: Summary stat and Create box plot

# Check the number of unique categories in the column
num_categories_sex <- length(unique(sortedData_train$sex))
print(paste("Number of unique categories (sex):", num_categories_sex))
#female   male 
#1601   2029 
category_counts <- table(sortedData_train$sex)
print(category_counts)

num_categories_smoker <- length(unique(sortedData_train$smoker))
print(paste("Number of unique categories (smoker):", num_categories_smoker))
#no  yes 
#3070  560 
category_counts <- table(sortedData_train$smoker)
print(category_counts)

num_categories_region <- length(unique(sortedData_train$region))
print(paste("Number of unique categories (region):", num_categories_region))
#northeast northwest southeast southwest 
#848       911      1021       850
category_counts <- table(sortedData_train$region)
print(category_counts)

# Convert categorical variable to numerical using label encoding
category_mapping <- c("female" = 1, "male" = 2)
sortedData_train$sex <- category_mapping[sortedData_train$sex]
category_mapping <- c("no" = 1, "yes" = 2)
sortedData_train$smoker <- category_mapping[sortedData_train$smoker]
category_mapping <- c("northeast" = 1, "northwest" = 2, "southeast" = 3, "southwest" = 4)
sortedData_train$region <- category_mapping[sortedData_train$region]


sortedData_train <- round(sortedData_train, digits = 0)
View(sortedData_train)

summary_stats <- summary(sortedData_train)
print(summary_stats)
boxplot(sortedData_train$age, main = "Box Plot of Age", ylab = "Age")

# 27 outliers in 'bmi' columns 
boxplot(sortedData_train$bmi, main = "Box Plot of bmi", ylab = "BMI")
boxplot_bmi_out <- boxplot(sortedData_train$bmi, plot = FALSE)$out
print(length(boxplot_bmi_out))

sortedData_train <- sortedData_train[!(sortedData_train$bmi %in% boxplot_bmi_out), ]

boxplot(sortedData_train$children, main = "Box Plot of children", ylab = "Children")
# 362 outliers in 'charges' columns before removing 'bmi' outliers and 355 after removing 'bmi' outliers 
boxplot(sortedData_train$charges, main = "Box Plot of charges", ylab = "Charges")
boxplot_charges_out <- boxplot(sortedData_train$charges, plot = FALSE)$out
sortedData_train <- sortedData_train[!(sortedData_train$bmi %in% boxplot_charges_out), ]
print(length(boxplot_charges_out))

summary_stats <- summary(sortedData_train)
print(summary_stats)

##### Indicator Variables: bmi, smoker #####

##### Mathematical Transformations ######
hist(sortedData_train$bmi)
plot(density(sortedData_train$bmi), main = "Normal Distribution Plot of BMI", xlab = "BMI", ylab = "Density")
sortedData_train$bmi <- sqrt(sortedData_train$bmi)
plot(density(sortedData_train$bmi), main = "Normal Distribution Plot of BMI", xlab = "BMI", ylab = "Density")
sortedData_train$bmi <- log(sortedData_train$bmi)
plot(density(sortedData_train$bmi), main = "Normal Distribution Plot of BMI", xlab = "BMI", ylab = "Density")

hist(sortedData_train$charges)
plot(density(sortedData_train$charges), main = "Normal Distribution Plot of Charges", xlab = "Charges", ylab = "Density")
sortedData_train$charges <- sqrt(sortedData_train$charges)
plot(density(sortedData_train$charges), main = "Normal Distribution Plot of Charges", xlab = "Charges", ylab = "Density")
sortedData_train$charges <- log(sortedData_train$charges)
plot(density(sortedData_train$charges), main = "Normal Distribution Plot of Charges", xlab = "Charges", ylab = "Density")


###################################
data_stroke <- read.csv('/Users/sajjadislam/Documents/Academic Projects/Data Intelligence/project/healthcare-dataset-stroke-data.csv')
#View(data_stroke)

# Get the column names
column_names <- colnames(data_stroke)
print(column_names)

data_stroke <- data_stroke[, c("gender", "age", "hypertension", "heart_disease", "bmi", "stroke")]


sortedData_stroke<-data_stroke[order(data_stroke$age),]
View(sortedData_stroke)

which(is.na(sortedData_stroke$bmi))
bmi_na_indices <- which(sortedData_stroke$bmi == "N/A")
sortedData_stroke <- sortedData_stroke[-bmi_na_indices, ]
which(is.na(sortedData_stroke$age))
which(is.na(sortedData_stroke$gender))
which(is.na(sortedData_stroke$hypertension))
which(is.na(sortedData_stroke$heart_disease))
which(is.na(sortedData_stroke$stroke))

View(sortedData_stroke)

category_mapping <- c("Female" = 1, "Male" = 2)
sortedData_stroke$gender <- category_mapping[sortedData_stroke$gender]
colnames(sortedData_stroke)[colnames(sortedData_stroke) == "gender"] <- "sex"

View(sortedData_stroke)
column_names <- colnames(sortedData_stroke)
print(column_names)

sortedData_stroke$bmi <- as.numeric(sortedData_stroke$bmi)
# Round 'bmi' values to the nearest integer
sortedData_stroke$bmi <- round(sortedData_stroke$bmi)

sortedData_stroke <- round(sortedData_stroke, digits = 0)
View(sortedData_stroke)

# Merge the dataframes
#merged_data <- merge(sortedData_train, sortedData_stroke, by = "bmi")
merged_data <- merge(sortedData_train, sortedData_stroke, by = c("bmi", "age", "sex"))

# Print the merged dataframe
View(merged_data)




