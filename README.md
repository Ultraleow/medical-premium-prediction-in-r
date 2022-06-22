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
 ```

 
 964  11
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
```
#Distribution of Premium Prices for Blood Pressure Patients and Non-Blood Pressure Patients

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
```
#Distribution of Premium Prices for People With Chronic Disease and People With No Chronic Disease

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
```
library(ggrepel)

#Box and Whisker Plot for Different BMI category

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




