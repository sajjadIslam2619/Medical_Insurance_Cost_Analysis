rm(list=ls())

data_train <- read.csv('Train_Data.csv')

##### Sort data #####
sortedData_train<-data_train[order(data_train$age),]


##### Missing Value #####
which(is.na(sortedData_train$age))
which(is.na(sortedData_train$sex))
which(is.na(sortedData_train$bmi))
which(is.na(sortedData_train$smoker))
which(is.na(sortedData_train$region))
which(is.na(sortedData_train$children))
which(is.na(sortedData_train$charges))


# Convert categorical variable to numerical using label encoding
category_mapping <- c("female" = 0, "male" = 1)
sortedData_train$sex <- category_mapping[sortedData_train$sex]
category_mapping <- c("no" = 0, "yes" = 1)
sortedData_train$smoker <- category_mapping[sortedData_train$smoker]
category_mapping <- c("northeast" = 0, "northwest" = 0, "southeast" = 1, "southwest" = 1)
sortedData_train$region <- category_mapping[sortedData_train$region]

sortedData_train <- round(sortedData_train, digits = 0)
View(sortedData_train)


#### Clean #####
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

#hist(sortedData_train$charges)
#plot(density(sortedData_train$charges), main = "Normal Distribution Plot of Charges", xlab = "Charges", ylab = "Density")

# Regression
model1<-lm(charges~age+sex+bmi+smoker+region+children, data=sortedData_train)
summary(model1)

model2<-lm(charges~age+bmi+smoker+bmi*sex, data=sortedData_train)
summary(model2)

model3<-lm(charges~I(log(age)^2)+bmi+smoker+bmi*sex, data=sortedData_train)
summary(model3)

model4<-lm(charges~I(log(age)^2)+I(log(bmi)^2)+smoker+bmi*sex, data=sortedData_train)
summary(model4)

model5<-lm(charges~exp(age)+exp(bmi)+smoker, data=sortedData_train)
summary(model5)


plot(sortedData_train$age, sortedData_train$charges, main = "Model 1 Regression Line", xlab = "AGE", ylab = "Charges")
abline(model1, col = "red")

plot(sortedData_train$age, sortedData_train$charges, main = "Model 2 Regression Line", xlab = "AGE", ylab = "Charges")
abline(model2, col = "red")

plot(sortedData_train$age, sortedData_train$charges, main = "Model 3 Regression Line", xlab = "AGE", ylab = "Charges")
abline(model3, col = "red")

plot(sortedData_train$age, sortedData_train$charges, main = "Model 4 Regression Line", xlab = "AGE", ylab = "Charges")
abline(model4, col = "red")

plot(sortedData_train$age, sortedData_train$charges, main = "Model 5 Regression Line", xlab = "AGE", ylab = "Charges")
abline(model5, col = "red")



