# Bar Chart
rm(list=ls())
data <- read.csv('/Users/sajjadislam/Documents/Academic Projects/Data Intelligence/project/Train_Data.csv')
View(data)
Frequency<-table(data$'region')
Frequency
View(Frequency)
barplot(Frequency,main="Bar Chart for Number of Patients Vs Region",
        xlab="Number of Patient", 
        horiz=TRUE, 
        col="blue", 
        xlim=c(0,1200), 
        las=1, 
        cex.names=.8)
abline(v=0)

# Histogram
rm(list=ls())
data <- read.csv('/Users/sajjadislam/Documents/Academic Projects/Data Intelligence/project/Train_Data.csv')

intervals<-seq(0,100,by=10)
value.cut<-cut(data$age, intervals, left=FALSE, right=TRUE)
value.freq<-table(value.cut)
value.freq
View(value.freq)
hist(data$age, 
     breaks=intervals, 
     right=TRUE, 
     main="Histogram for Age", 
     xlab="Age", 
     col="blue")


# Scatter plot
rm(list=ls())
data <- read.csv('/Users/sajjadislam/Documents/Academic Projects/Data Intelligence/project/Train_Data.csv')
plot(data$charges~data$age, 
     main="Scatterplot of charges vs age", 
     xlab="age", 
     ylab="charges", 
     col="chocolate",
     pch=1)


plot(data$charges~data$bmi, 
     main="Scatterplot of charges vs bmi", 
     xlab="bmi", 
     ylab="charges", 
     col="chocolate",
     pch=1)

# Heat map
rm(list=ls())
data <- read.csv('/Users/sajjadislam/Documents/Academic Projects/Data Intelligence/project/Train_Data.csv')
selected_df <- data[, c("age", "bmi", "children", "charges")]
# Calculate correlation matrix
cor_matrix <- cor(selected_df)
heatmap(cor_matrix, 
        col=heat.colors(256), 
        scale="none", 
        Rowv=NA, 
        Colv=NA,cexRow = 1, cexCol = 1)
# Create a heat map
heatmap(cor_matrix, col = colorRampPalette(c("blue", "white", "red"))(10000), cexRow = 1, cexCol = 1)
