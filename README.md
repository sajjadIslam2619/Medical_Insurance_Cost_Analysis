# Medical_Insurance_Cost_Analysis
A robust BI analytics project to extract insights from data, enabling data-driven decision-making. Utilizes advanced analytics for pattern identification and strategy formulation.

# Data Source
Medical Insurance dataset: https://www.kaggle.com/datasets/rajgupta2019/medical-insurance-dataset

# Introduction 
Unorganized data is not useful for business decision-making purposes. The lack of effective data utilization hinders productivity within the organization. Organization struggles with meaningful interaction with current health insurance data, which is leading to inefficiencies in pricing strategy, risk assessment, and customer segmentation. Consequently, productivity is hampered due to the lack of data-driven decision-making. 
The business requires a comprehensive understanding of the different factors such as age, sex, body mass index (BMI), smoking habits, region, and number of children, that contribute to the insurance charges for individuals. This understanding is vital for creating effective pricing strategies, identifying high-risk customers, and developing targeted marketing campaigns.
Our Business Intelligence (BI) project will design and implement a robust analytics platform that will analyze the current data, extract meaningful insights, and enable the organization to make more informed, data-driven decisions. This will use advanced analytical methods to identify patterns and correlations in the data that can be used for strategy formulation.
By leveraging BI to understand how various factors affect insurance charges, the company can devise fairer pricing models, leading to increased customer satisfaction and market share. This data-driven approach also aids in identifying high-risk customers, thereby strengthening risk management and financial stability. Furthermore, the insights derived enable personalized marketing campaigns, enhancing customer acquisition and retention rates.

![prj-imp-outcome](https://github.com/sajjadIslam2619/Medical_Insurance_Cost_Analysis/assets/7568561/173bee44-4165-48b2-901d-5750eba28ae5)

# Business Intelligence Methods:
### The Business Process: 
The BI roadmap is a dynamic plan that outlines a BI program's incremental and iterative development over a specific time frame. It includes individual projects aligned with key business initiatives, delivering high-level business outcomes, utilizing relevant data source feeds, introducing appropriate technologies, and involving relevant business groups, while continuously evolving to adapt to changing business needs and emerging opportunities. 

![roadmap](https://github.com/sajjadIslam2619/Medical_Insurance_Cost_Analysis/assets/7568561/2bf14c29-24cd-46e2-b926-a92306d02dbc)

The primary deliverable of this project is to provide clarity and accurate predictions of insurance costs by leveraging individual circumstances. To accomplish this, we will acquire the open-source Medical Insurance dataset [1] available on Kaggle, which serves as a valuable resource for our analysis. In the subsequent phase, we will focus on comprehensive data management processes, which encompass crucial steps such as data cleaning to address any inconsistencies or errors, and data processing to ensure the information is in a suitable format for analysis. Once the data management phase is completed, we will proceed with the data analysis stage. This stage entails exploring the dataset, conducting in-depth examinations, and applying various statistical and analytical techniques to gain valuable insights. By uncovering patterns, correlations, and trends within the data, we can develop a deeper understanding of the factors that influence insurance costs. In the final step, we will use the data analysis insights to construct robust predictive models. These models will incorporate relevant variables from the dataset and employ advanced algorithms to forecast insurance costs based on individual circumstances. 

### Data and Data Structures: 
The acquired Medical Insurance dataset [1] is well structured. The first 5 observations of the dataset are given below:

![dataset](https://github.com/sajjadIslam2619/Medical_Insurance_Cost_Analysis/assets/7568561/f47ff52c-a156-4b3e-a481-1436eca82d63)

In every BI project that involves working with a dataset, data management plays a crucial role as the first and foremost step. Data management encompasses activities such as data cleaning, data integration, and data transformation, ensuring the dataset is of high quality, consistent, and suitable for analysis. By effectively managing the data, organizations can lay a solid foundation for accurate and reliable insights, leading to informed decision-making and successful BI implementation. Some common problems with data are discussed below: 

#### Data cleaning: 
Data cleaning is an essential step in the data management process, involving the identification and treatment of missing values, outliers, and inconsistencies in the dataset. By addressing data quality issues through techniques such as imputation or removal of outliers, and ensuring standardized data format and consistency across variables, the dataset becomes more reliable and suitable for further analysis and decision-making.
##### Data Exploration and Analysis: 
Data exploration and analysis are essential steps in the data management process, involving the examination of variables such as age, BMI, and charges through descriptive statistics to understand their distribution and characteristics. By performing data segmentation and aggregation, meaningful insights can be derived, such as analyzing insurance charges based on factors like gender, smoking status, region, or number of children. Additionally, calculating relevant metrics, such as average charges or the percentage of smokers in different regions, provides key insights that can inform and support the BI campaign.
#### Data Visualization: 
Data visualization plays a vital role in the data management process, enabling the creation of visually appealing and informative charts like bar graphs, pie charts, and histograms to illustrate the distribution of variables and categorical data such as gender or region. Scatter plots and box plots are used to visually represent relationships between variables, such as age and charges, to identify patterns or correlations. Interactive dashboards and infographics are also utilized to summarize key findings, providing stakeholders with an easy and engaging way to explore and comprehend the data.
#### Statistical Methodology: 
There are three different types of analytics techniques such as descriptive analytics, predictive analytics, and prescriptive analytics. In this project, descriptive and predictive analytics techniques are used. 

![methods](https://github.com/sajjadIslam2619/Medical_Insurance_Cost_Analysis/assets/7568561/1f4cf193-617c-41dd-8887-800aa94ed4c3)

During the Data Management phase, the initial task involved examining the presence of missing and null values. Subsequently, both numerical and categorical values underwent a transformation process. Notably, the age variable initially represented as floating-point numbers, was converted into integer values. Similarly, categorical variables such as sex, region, and smoker are encoded into numerical equivalents. Following these transformations, the cleaned dataset is used for outlier detection using both ‘box plots’ and ‘summary statistics’. Additionally, a normal distribution plot is employed to assess the distribution of charges. 
In the data visualization step, ‘binning’ is used to observe the frequency of patients of each age group. Two ‘scatter plots’ are used to analyze the relationship between ‘age vs charges and ‘BMI vs charges’. Finally, a  heatmap is drawn to analyze the correlation among different features. 
For predictive analysis, regression models are used. Five different regression model is implemented with different independent variables. Here is a table of five different models. 

![models](https://github.com/sajjadIslam2619/Medical_Insurance_Cost_Analysis/assets/7568561/cd79afb9-85fd-4696-9020-683a24d28fdc)

### Excluded methods: 
In the data preprocessing steps ‘data subsetting’ is not used. Because there are no missing values in the dataset and all the features/independent variables seem important for the analytics. Covariance measures the direction of the linear relationship and it is hard to interpret because it is sensitive to the units of measurement. It is not used in this project in the descriptive analytics. Logistic regression is not used in this project. Because it is used for predicting binary or categorical outcomes. If the "charges" variable were binary (e.g., determining whether a charge is above or below a certain threshold), logistic regression would be more appropriate.

# Results: 
### Data Management: 
In the data preparation step no missing data is found. So omission or imputation of missing value is not required. To check the outliers in the dataset box plot is used in the numerical variables such as age, bmi, children, and charges. For bmi 27 outliers and for charges 362 outliers are found. Figure-2 of the box plot shows the outliers [5]. 
In the dataset, there are 3 categorical variables such as sex, smoker, and region. To deal with these variables a ‘dummy variable/ indicator variable’ is used. There are 4 regions northeast, northwest, southeast, and southwest. Create 2 groups/class north and south and make the north a ‘benchmark category’. For the sex category, make the female and for the category, smoker made non-smoker as the benchmark category. [2] Here is a table with the categorical variables. 

![result-with-outliers](https://github.com/sajjadIslam2619/Medical_Insurance_Cost_Analysis/assets/7568561/569b1cad-4c53-4ee6-8cc8-56de6a1c7c9c)

Based on the provided table, we can observe a balanced distribution of data across all categories. Additionally, it is anticipated that the number of individuals classified as non-smokers will exceed the number of individuals classified as smokers. From Table 6, most of the outliers are in the ‘smoker’ class. So we can anticipate that charges are very high for smokers than non-smokers. [2]
Table 7 shows the correlation coefficient between variables. Firstly, there is a weak positive correlation (0.1489185) between age and BMI, indicating a slight tendency for BMI to increase with age. Secondly, a moderate positive correlation (0.4479785) exists between age and charges, suggesting that as age increases, there tends to be a stronger association with higher medical insurance charges. Lastly, a weak negative correlation (-0.05521774) is observed between BMI and charges, indicating a slight tendency for lower BMI to be associated with higher charges, although the relationship is not very strong.

![correlation](https://github.com/sajjadIslam2619/Medical_Insurance_Cost_Analysis/assets/7568561/9faba63b-a3b7-408a-ae74-21394d36610e)

After plotting the distribution of charges, it was observed that the data exhibited positive skewness. To address this skewness mathematically, the charges were transformed by taking the square root of each value. This transformation aims to reduce the skewness and create a more symmetric distribution of the charges. Shown in Figure 3. [6]

### Data Visualization: 
Data visualization is used in business intelligence projects to effectively communicate complex data patterns and insights in a visually compelling manner, facilitating better understanding and informed decision-making among stakeholders. In this project, we have created several visual analytics. Figure 4 shows the bar chart for the Number of Patients Vs Region [7]. Figure 5 shows the histogram of age [8]. The relationship between charges and BMI, as well as age, is depicted in Figure 6. By examining the scatter plot, it becomes evident that age exhibits a linear correlation with charges, while there is no apparent direct relationship between BMI and charges. 

![fig-6](https://github.com/sajjadIslam2619/Medical_Insurance_Cost_Analysis/assets/7568561/f570748f-add1-4ba6-b4aa-cb83b81ca3c1)

### Predictive Analysis: 
In this project 5 regression models are implemented. Table 5 displays the independent variables used in the implementation of five regression models. Figures 8, 9, 10, 11, and 12 present the summaries of each model [11,12,13,14,15]. Figure 13 shows the regression line of all 5 models [16]. Table 7 shows the models’ results. Based on the analysis of several regression models, it is evident that Model 1 outperforms the other models in terms of R-squared, adjusted R-squared, and residual standard error (RSE). Model 1 demonstrates the highest multiple R-squared (0.7126), indicating that it explains a larger proportion of the variance in the dependent variable (charges) compared to the other models. Moreover, it also has the highest adjusted R-squared (0.7121), which considers the number of predictors and provides a more accurate assessment of the model's goodness of fit. Additionally, Model 1 exhibits the lowest RSE (5718), implying a smaller average deviation between the observed and predicted values. Consequently, Model 1 is considered the most effective model in explaining the relationship between the independent variables (age, sex, BMI, smoker, region, children) and the dependent variable (charges).

![result](https://github.com/sajjadIslam2619/Medical_Insurance_Cost_Analysis/assets/7568561/f95c459d-30f6-44b5-b540-b1cdc163d27d)

### Hypothesis test: 
For Model 1 we can conduct a hypothesis test for the ‘smoker’ variable. 
 - Null hypothesis (H0): There is no relationship between smoking and charges.
 - Alternative hypothesis (HA): There is a significant relationship between smoking and charges.
   
From the model summary, we found that the p-value is < 2.2e-16. Based on the extremely small p-value (< 0.001), we can reject the null hypothesis in favor of the alternative hypothesis. This indicates that there is a significant relationship between smoking status and charges in the dataset. Given that the p-value for the smoker coefficient is < 2.2e-16 (essentially 0), we can conclude that the p-value is smaller than the significance level of 0.05 (5% significant level). Therefore, we reject the null hypothesis (H0) and conclude that there is sufficient evidence to support the alternative hypothesis (HA) that there is a significant relationship between smoking status and charges.

# Conclusion: 
Through our Business Intelligence (BI) project, we have unlocked valuable insights from the health insurance data, identifying key factors influencing insurance charges. However, our analysis has certain limitations. The data used might not capture all possible factors affecting insurance charges, such as pre-existing conditions or lifestyle factors beyond smoking. Further, the regression model assumes a linear relationship between predictors and charges, which might not accurately reflect the complex nature of health insurance pricing. 
Despite these limitations, our BI project has significantly improved our understanding of the current data and its relevance to insurance charges. This data-driven approach opened new avenues for further research and improvement. 
Our comprehensive data analysis with multiple regression models has proven invaluable for better decision-making. Model 1, which includes variables like age, sex, BMI, smoking habits, region, and number of children, has shown the most promising results in predicting insurance charges. These insights will assist in devising effective pricing strategies, managing risk, and enhancing targeted marketing campaigns.
In short, our BI project has not only advanced our understanding of data but has also underscored the value of a data-driven approach to business. This foundation paves the way for further refinement and exploration, propelling the organization through increased efficiency and customer satisfaction.

# Referance: 
1. Medical Insurance dataset: https://www.kaggle.com/datasets/rajgupta2019/medical-insurance-dataset
2. Data Management R Program: Data_Management.R
3. Data Visualization R Program: Data_Viz.R 
4. Regression R Program: Regression_Implement.R 
5. Figure 2 Box plots of ‘BMI’ and ‘charges’ 
6. Figure 3 Distribution plot of charges. 
7. Figure 3 Distribution plot of charges  
8. Figure 4 Bar Chart for Number of Patients Vs Region 
9. Figure 5 Histogram of Age
10. Figure 6 Scatter plot ‘charges vs age’ and ‘charges vs bmi’
11. Figure 7 Data Summary 
12. Figure 8 Model 1 summary 
13. Figure 9 Model 2 summary 
14. Figure 10 Model 3 summary 
15. Figure 11 Model 4 summary 
16. Figure 12 Model 5 summary 
17. Figure 13 Regression line of 5 models 


# Appendix: 
![Fig-2](https://github.com/sajjadIslam2619/Medical_Insurance_Cost_Analysis/assets/7568561/adde783a-b697-419c-96ea-69d299043649)
![Fig-3](https://github.com/sajjadIslam2619/Medical_Insurance_Cost_Analysis/assets/7568561/8d761238-4142-4cde-bc94-c2de1dd44939)
![fig-4](https://github.com/sajjadIslam2619/Medical_Insurance_Cost_Analysis/assets/7568561/3a564b84-2a14-49a0-b6a7-bb24a3a24352)
![fig-5](https://github.com/sajjadIslam2619/Medical_Insurance_Cost_Analysis/assets/7568561/2963a6eb-5543-4d74-be48-a0ac82335c11)
![fig-7](https://github.com/sajjadIslam2619/Medical_Insurance_Cost_Analysis/assets/7568561/33e07c36-c719-4e55-ad74-9e789ab1c69b)
![fig-8](https://github.com/sajjadIslam2619/Medical_Insurance_Cost_Analysis/assets/7568561/4db404f5-e183-4302-9cb2-3312e4755e2e)
![Fig-9](https://github.com/sajjadIslam2619/Medical_Insurance_Cost_Analysis/assets/7568561/9693c5ef-9643-40ed-9a88-881b98587a9a)
![fig-10](https://github.com/sajjadIslam2619/Medical_Insurance_Cost_Analysis/assets/7568561/7e7ceace-f5b0-497b-8090-ce166e3b5f35)
![fig-12](https://github.com/sajjadIslam2619/Medical_Insurance_Cost_Analysis/assets/7568561/585c8607-2f26-406b-94b3-a949a38010cc)
![fig-13](https://github.com/sajjadIslam2619/Medical_Insurance_Cost_Analysis/assets/7568561/afca98d5-bcc3-4651-9187-14982243c837)









