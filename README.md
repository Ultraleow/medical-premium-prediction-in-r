# Link for slide
https://rpubs.com/ultraleow/predict-the-premium-G6

# Link for data product (include insurance predictor)
https://netkul-jun0shou-leow.shinyapps.io/predict-the-premiumv2/

1.	What is the domain of interest you are working on?

Insurance Industry

2.	Why are you personally interested to work in this domain?

People are always confused about their medical insurance and don't know the insurance cost at different ages and conditions. This situation is an obstacle for them when they are considering an insurance package, and they are unsure whether they are overcommitted or not. With enough quality data, we can innovate a useful data-driven product that can make predictions of the insurance premium.

3.	For whom are you answering the question being asked? Name the beneficiary of the product.

1.Medical insurance buyers
When customers are unsure how much they need to pay for their health insurance, they can use this data product and check it up anytime and anywhere. Customers can just key in their current medical condition and body information to estimate the amount of insurance premium they have to pay before making any decision. This would help them to save time and money and improve their budget planning
2.Insurance Company/Agent
It can be more convenient and accurate to predict the insurance cost you need to offer to your customer in a second. Insurance agents can provide customers with efficient and convenient services by shortening the calculation process for the premium that customers need to pay quickly. With this data product, they can bring the balance between the lowest offer that can attract our customers and maximise the profit brought to the company. We might save the labour cost and reduces the error rate during the process.

4.	What data are you using? State the source.

Medical Insurance Premium Prediction from Kaggle
This dataset is released by a medical insurance company for almost 1000 customers. This dataset is voluntarily given by customers.
https://www.kaggle.com/datasets/tejashvi14/medical-insurance-premium-prediction
Relevant attributes include
Age	Diabetes
	Blood PressureProblems
	Any
Transplants
	Any
Chronic
Diseases
	Height
	Weight
	Known
Allergies
	HistoryOf
CancerIn
Family
	Number
Of
Major
Surgeries
	PremiumPrice


5.	What kind of analysis are you doing?
Descriptive Analysis
A descriptive data analysis seeks to summarise the measurements in a single number without interpretation.
Exploratory Analysis
Exploratory data analysis (EDA) builds on a descriptive analysis by searching for discoveries, trends, correlations, or relationships between the measurements of multiple variables to generate ideas or hypotheses or discover new insights.
Method: 
Summary Statistics, Examples of summary statistics for a single numerical variable is the mean, median, mode, max, min, range, quartiles/percentiles, variance, standard deviation, coefficient of determination, skewness, and kurtosis. 
For bivariate data, the summary statistics is the linear correlation, chi squared, or the p value-based z-test, t-test or analysis of variance
Predictive Analysis
Predictive data analysis uses a subset of measurements (the features) to predict another measurement (the outcome) on a single person or unit. We are going to use machine learning to solve this regression problem. We will try at least five algorithms and compare the accuracy among them.
Regression methods
Multiple Linear Regression, Polynomial Regression, Decision Tree, Random Forest, Gaussian process regression, Support Vector Regression, Neural network
Reference: 
https://towardsdatascience.com/7-of-the-most-commonly-used-regression-algorithms-and-how-to-choose-the-right-one-fc3c8890f9e3
6.	Do you consider your results significant? Briefly explain.
Yes, we are committed to studying causality and variable correlation to build the best health insurance plan for potential buyers and help people make better financial decisions. Leverage health insurance plans to ease their burden and play a key role when illness strikes.
Our results are also maximising stakeholder benefits and helping them make better decisions. Overall, we could balance medicare buyers who can get coverage at the lowest cost and insurance agents who get more benefits. We seek balance.
7.	What is your data product? Give a brief description.

ShinyApp: Medical Insurance Premium Estimation
People who wish to purchase a medical insurance package can utilise it at any time and choose the corresponding option according to whether they have certain diseases to figure out the cost of medical insurance they need to pay. We utilise the medical conditions to estimate the medical premium using machine learning. With this, potential buyers can check the medical insurance premium they need to play anytime and anywhere without the phenomenon of staggering fees.

8.	Did you consider “reproducibility” in your work? If yes, show evidence.

Yes. We have published R code with the original Kaggle dataset, methodology used and activities conducted on GitHub.

Link to GitHub: https://github.com/Ultraleow/PODS_G6_medical-premium-prediction-in-r

9.	Discuss the current issues and challenges facing Data Science today.
1.Data Security
a. Data security includes all security measures and tools applied to analytics and data processes
b. Information theft is the most common data security concern, especially for organizations that have access to sensitive data like financial information or customers’ personal information need to follow the three fundamentals of data security: Confidentiality; Integrity; Accessibility.
C. Python dominates among data science, we’d better take a proactive approach to integrating open-source solutions, to keep security. Ensuring that data scientists do not have to use their preferred tools outside of the policy boundary.
2. Deficiency of Skilled Talent
a. Data scientist have to with in-depth knowledge and domain expertise.
b. Along with a deep understanding of ML and AI algorithms,  Data scientist are required to also know about the business perspective of data science. And able to tell their business story through their data
3. Lack of clarity on business platform
a. One needs to investigate and understand the issue properly
b. Provide Clear goal and actionable insights
4.Data Integration
a. Many companies face hurdles getting information in a large number of data's centralized system for reference and decision-making.  
b. We need to obtain data that can actually answer the problems.
5. Automation of Data Cleaning
a.Data cleaning refers to clean incorrect data, data redundancy, and duplicate data with no structure or format.
b. We need looking for use artificial intelligence and machine learning to automate scrubbing data  to speed up data analytics and gain accurate insights from big data.
6. Cloud Computing
a. Many Big Data analytic tools are hosted in the cloud. But Cloud computing wasn’t designed for real-time data processing and data streaming. That strain on the system can result in slow processing speeds, bottlenecks, and down-time—which not only prevents organizations from realizing the full potential of Big Data, but also puts their business and consumers at risk.
b. Need to find a way to automate real-time processing of large amounts of data to manage the heavy load and avoid some of the biggest data analytic risks.



###Medical Insurance Premium Prediction for Consumer

Exploratory Data Analysis
```
data$bmi <- 10000*(data$Weight/(data$Height)^2)

data <- data %>%

  mutate( bmiCategory = case_when(
  
    bmi<18.49999 ~ "under weight",
    
    bmi>18.5 & bmi<24.99999 ~ "normal weight",
    
    bmi>25 & bmi<29.99999 ~ "over weight",
    
    bmi>30 ~ "obesity"
  )) 
```
![image](https://user-images.githubusercontent.com/102680739/174873126-89390300-054e-4c27-b25c-ae3b7c03ef8d.png)

Applying factors to different colums
```
str(data)

'data.frame':	964 obs. of  11 variables:
 ```
 
 $ Age                    : num  45 60 36 52 38 30 48 38 60 66 ...
 
 $ Diabetes               : num  0 1 1 1 0 0 1 0 0 1 ...
 
 $ BloodPressureProblems  : num  0 0 1 1 0 0 0 0 1 0 ...
 
 $ AnyTransplants         : num  0 0 0 0 0 0 0 0 0 0 ...
 
 $ AnyChronicDiseases     : num  0 0 0 1 1 0 0 0 0 0 ...
 
 $ Height                 : num  155 180 158 183 166 160 169 182 175 186 ...
 
 $ Weight                 : num  57 73 59 93 88 69 74 93 74 67 ...
 
 $ KnownAllergies         : num  0 0 0 0 0 1 1 0 0 0 ...
 
 $ HistoryOfCancerInFamily: num  0 0 0 0 0 0 0 0 0 0 ...
 
 $ NumberOfMajorSurgeries : num  0 0 1 2 1 1 0 0 2 0 ...
 
 $ PremiumPrice           : num  1408 1633 1295 1576 1295 ...

 Correlation Matrix
 
 ```
ggcorr(data, label = T, color = "black", size = 5)+

  labs(title = "Correlation Matrix")+
  
  theme(plot.title = element_text(family = "Roboto Condensed", size = 19, face = "bold",vjust = 1),
  
        plot.subtitle = element_text(family = "Roboto Condensed", size = 16,vjust = 0))
```        
  ![Correlation Matrix](https://user-images.githubusercontent.com/102680739/174867423-bf45fcf2-af1d-42bd-a5e7-543c3dc9bd6a.png)

Diabetics People Premium Analysis

#Average Difference in Premium Prices for Diabetic and Non-Diabetic People
```
data %>% 

  select(Diabetes,PremiumPrice) %>%
  
  group_by(Diabetes) %>% 
  
  summarise( PremiumPrice = mean(PremiumPrice)) %>% 
  
   ggplot(.,aes(Diabetes,PremiumPrice))+
   
  geom_bar(stat = "identity",width = 0.5,fill='sky blue',color = "red",alpha = 0.8)+
  
  geom_text(aes(label=PremiumPrice), vjust=2.0, color="white", size=4.0)+
  
labs(title = "Bar plot for Diabetics People")
```
![Diabetics](https://user-images.githubusercontent.com/102680739/174870184-0beb5113-64c6-456c-9201-fbc809268bf9.png)
```
data$Diabetes <- as.factor(data$Diabetes)

data$BloodPressureProblems <- as.factor(data$BloodPressureProblems)

data$AnyTransplants <- as.factor(data$AnyTransplants)

data$AnyChronicDiseases <- as.factor(data$AnyChronicDiseases)

data$KnownAllergies <- as.factor(data$KnownAllergies)

data$HistoryOfCancerInFamily <- as.factor(data$HistoryOfCancerInFamily)

data$NumberOfMajorSurgeries <- as.factor(data$NumberOfMajorSurgeries)
```
#Distribution of Premium Prices for Diabetic and Non-Diabetic Peoples

```
library(ggplot2)

cols <- c("#F76D5E", "#FFFFBF")

ggplot(data, aes(x=PremiumPrice,fill=Diabetes))+

  geom_density(alpha=0.8) +
  
  labs(title = "Density plot for Diabetics and Non-diabetic proples")
  
scale_fill_manual(values = cols)
```

![diabetes](https://user-images.githubusercontent.com/102680739/174870395-2f2643c8-2bd1-47c9-9af8-e11cb0e28801.png)

#Average Difference in Premium Prices for People Gone Through Any Transplants vs Those Who haven't Gone Through Any Transplants

```
data %>% 

  select(BloodPressureProblems,PremiumPrice) %>%
  
  group_by(BloodPressureProblems) %>% 
  
  summarise( PremiumPrice = mean(PremiumPrice)) %>% 
  
  ggplot(.,aes(BloodPressureProblems,PremiumPrice))+
  
  geom_bar(stat = "identity",width = 0.5,fill='sky blue',color = "red",alpha = 0.8)+
  
  geom_text(aes(label=PremiumPrice), vjust=2.0, color="white", size=4.0)+
  
  labs(title = "Bar plot for blood pressure problem")
  ```
  
![BLOOD](https://user-images.githubusercontent.com/102680739/174870508-fc4f9d7d-74f7-4030-a54a-059739fd42b9.png)


#Distribution of Premium Prices for Blood Pressure Patients and Non-Blood Pressure Patients

```
library(ggplot2)

cols <- c("#F76D5E", "#FFFFBF")

ggplot(data, aes(x=PremiumPrice,fill = AnyTransplants))+

  geom_density(alpha=0.8) +
  
  labs(title = "Density plot for people with and without any organ transplant")
  
scale_fill_manual(values = cols)
```

![any tancplants](https://user-images.githubusercontent.com/102680739/174870687-1a9f57a4-30c2-49da-91f3-fb3c5b4d98a9.png)

#Average Difference in Premium Prices for People With Chronic Disease and People With No Chronic Disease

```
data %>% 

  select(AnyChronicDiseases,PremiumPrice) %>%
  
  group_by(AnyChronicDiseases) %>% 
  
  summarise( PremiumPrice = mean(PremiumPrice)) %>% 
  
  ggplot(.,aes(AnyChronicDiseases,PremiumPrice))+
  
  geom_bar(stat = "identity",width = 0.5,fill='sky blue',color = "red",alpha = 0.8)+
  
  geom_text(aes(label=PremiumPrice), vjust=2.0, color="white", size=4.0)+
  
  labs(title = "Bar plot for people with cronic disease")
```

![Chronic Disease](https://user-images.githubusercontent.com/102680739/174871095-3eb47c1b-c85b-4b69-924b-984f7f29abd2.png)

#Distribution of Premium Prices for People With Chronic Disease and People With No Chronic Disease

```
library(ggplot2)

cols <- c("#F76D5E", "#FFFFBF")

ggplot(data, aes(PremiumPrice,fill = AnyChronicDiseases))+

  geom_density(alpha = 0.6)+
  
  labs(title = "Density plot for  having chronic diseases")
  
scale_fill_manual(values = cols)
```

![anychronicdiseasea](https://user-images.githubusercontent.com/102680739/174871267-21447f48-c1a9-4e72-ac30-a846afe9c7f5.png)

#Average Difference in Premium Prices for Allergy patients and No Allergy Patients

```
data %>% 

  select(KnownAllergies,PremiumPrice) %>%
  
  group_by(KnownAllergies) %>%
  
  summarise( PremiumPrice = mean(PremiumPrice)) %>% 
  
  ggplot(.,aes(KnownAllergies,PremiumPrice))+
  
  geom_bar(stat = "identity",width = 0.5,fill='sky blue',color = "red",alpha = 0.8)+
  
  geom_text(aes(label=PremiumPrice), vjust=2.0, color="white", size=4.0)+
  
  labs(title = "Bar plot for people having allergies")
  ```
  
![known allgeric](https://user-images.githubusercontent.com/102680739/174871495-20fcf16c-96a2-4b2f-b102-967893407fdc.png)

#Distribution of Premium Prices for Allergy Patients and No Allergy Patients

```
library(ggplot2)

cols <- c("#F76D5E", "#FFFFBF")

ggplot(data, aes(PremiumPrice,fill = KnownAllergies))+

  geom_density(alpha = 0.6)+
  
  labs(title = "Density plot for people with and without allergies")
  
scale_fill_manual(values = cols)
```

![known ](https://user-images.githubusercontent.com/102680739/174871631-8d265867-c341-4d46-a6b3-ccfad4c60729.png)

#Average Difference in Premium Prices for Patients with History of Cancer and Patients without History of Cancer

```
data %>% 

  select(HistoryOfCancerInFamily,PremiumPrice) %>%
  
  group_by(HistoryOfCancerInFamily) %>% 
  
  summarise( PremiumPrice = mean(PremiumPrice)) %>% 
  
  ggplot(.,aes(HistoryOfCancerInFamily,PremiumPrice))+
  
  geom_bar(stat = "identity",width = 0.5,fill='sky blue',color = "red",alpha = 0.8)+
  
  geom_text(aes(label=PremiumPrice), vjust=2.0, color="white", size=4.0)+
  
  labs(title = "Bar plot for people with history of cancers")
  ```
  ![History of Cancer in Family](https://user-images.githubusercontent.com/102680739/174871761-85db0a96-1922-47ca-92fa-9fd4d1e6c3a7.png)
  
  #Distribution of Premium Prices for Patients with History of Cancer and Patients without History of Cancer
  
  ```
library(ggplot2)

cols <- c("#F76D5E", "#FFFFBF")

ggplot(data, aes(PremiumPrice,fill = HistoryOfCancerInFamily))+

  geom_density(alpha = 0.6)+
  
  labs(title = "Density plot for people with and without history of cancers")
  
scale_fill_manual(values = cols)
```

  ![history](https://user-images.githubusercontent.com/102680739/174871832-83ee81d7-482c-4607-9641-feca012ec4f3.png)
  
  #Average Difference in Premium Prices for People gone through major surgeries
 
 ``` 
data %>% 

  select(NumberOfMajorSurgeries,PremiumPrice) %>%
  
  group_by(NumberOfMajorSurgeries) %>% 
  
  summarise( PremiumPrice = mean(PremiumPrice)) %>% 
  
  ggplot(.,aes(NumberOfMajorSurgeries,PremiumPrice))+
  
  geom_bar(stat = "identity",width = 0.5,fill='sky blue',color = "red",alpha = 0.8)+
  
  geom_text(aes(label=PremiumPrice), vjust=2.0, color="white", size=4.0)+
  
  labs(title = "Bar plot for major surgeries")
  ```
![major surgeries](https://user-images.githubusercontent.com/102680739/174871945-258aaf2a-2d88-4841-a67e-2fcc4b3cc103.png)

#Distribution of Premium Prices for People gone through major surgeries

```
ggplot(data %>% 

         select(NumberOfMajorSurgeries,PremiumPrice) %>%
         
         filter(!NumberOfMajorSurgeries == 3),
         
       aes(PremiumPrice,fill = NumberOfMajorSurgeries))+
       
  geom_density( alpha = 0.6)+
  
  labs(title = "Density plot for people with differnt number of surgeries")
  
scale_fill_manual(values = cols)
```

![number](https://user-images.githubusercontent.com/102680739/174872085-a1484ebe-f114-4c1b-8b4b-c859ad06a133.png)

#Box and Whisker Plot for Different BMI category

```
library(ggrepel)

data %>% 

  mutate(bmiCategory = str_to_title(bmiCategory)) %>% 
  
  ggplot(aes(bmiCategory, PremiumPrice))+
  
  geom_boxplot()+
  
  geom_jitter(aes(color = bmiCategory),alpha = 0.4)+
  
  labs(title = "Distribution of Premium Price Over Differnt BMI category")+
  
  theme_ipsum_rc()
  ```
  
  ![BIN](https://user-images.githubusercontent.com/102680739/174872466-35dea772-33b8-47da-8b17-3ed9221d9fb0.png)




