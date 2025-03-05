-- View sample data  
SELECT * FROM lung_cancer_prediction LIMIT 10;
--Check for missing and null values
SELECT COUNT(*) FROM lung_cancer_prediction WHERE Age IS NULL;
SELECT COUNT(*) FROM lung_cancer_prediction WHERE Smoking_Status IS NULL;
--Total number of rows
SELECT COUNT(*) FROM lung_cancer_prediction;
--Age Distribution (Average, Minimum, and Maximum)
SELECT AVG(Age), MIN(Age), MAX(Age) FROM lung_cancer_prediction;
--Count of Smoking Status Categories:
SELECT Smoking_Status, COUNT(*) 
FROM lung_cancer_prediction 
GROUP BY Smoking_Status;
--Count of Lung Cancer Cases
SELECT Final_Prediction, COUNT(*) 
FROM lung_cancer_prediction 
GROUP BY Final_Prediction;
--Rural vs. Urban Patient Distribution
SELECT Rural_or_Urban, COUNT(*) 
FROM lung_cancer_prediction 
GROUP BY Rural_or_Urban;
--Smoking Status vs. Lung Cancer Prediction
SELECT Smoking_Status, Final_Prediction, COUNT(*) 
FROM lung_cancer_prediction 
GROUP BY Smoking_Status, Final_Prediction;
--Percentage of Patients from Different Countries
SELECT Country, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM lung_cancer_prediction) AS Percentage 
FROM lung_cancer_prediction 
GROUP BY Country;
-- Does Smoking Status Affect Lung Cancer Risk?
SELECT Smoking_Status, AVG(Final_Prediction) 
FROM lung_cancer_prediction 
GROUP BY Smoking_Status;
--Does Air Pollution Exposure Vary by Socioeconomic Status?
SELECT Socioeconomic_Status, Air_Pollution_Exposure, COUNT(*) 
FROM lung_cancer_prediction 
GROUP BY Socioeconomic_Status, Air_Pollution_Exposure;
--How Does Healthcare Access Impact Mortality & Survival?
SELECT Healthcare_Access, AVG(Mortality_Risk), AVG("5_Year_Survival_Probability") 
FROM lung_cancer_prediction 
GROUP BY Healthcare_Access;
--What is the Distribution of Cancer Diagnosis Stages Across Insurance Types?
SELECT Insurance_Coverage, Stage_at_Diagnosis, COUNT(*) 
FROM lung_cancer_prediction 
GROUP BY Insurance_Coverage, Stage_at_Diagnosis;
--Does Delayed Diagnosis Affect Final Prediction?
SELECT delay_in_diagnosis, AVG(Final_Prediction) 
FROM lung_cancer_prediction 
GROUP BY delay_in_diagnosis;
--Top 5 Countries with Highest Lung Cancer Cases
SELECT Country, COUNT(*) AS Cases 
FROM lung_cancer_prediction 
WHERE Final_Prediction = 'Yes' 
GROUP BY Country 
ORDER BY Cases DESC 
LIMIT 5;
--Survival Probability for Different Mutation Types
SELECT Mutation_Type, AVG("5_Year_Survival_Probability") 
FROM lung_cancer_prediction 
GROUP BY Mutation_Type;
--What Percentage of Lung Cancer Patients Were Exposed to Secondhand Smoke
SELECT Second_Hand_Smoke, 
       COUNT(*) * 100.0 / (SELECT COUNT(*) 
                           FROM lung_cancer_prediction 
                           WHERE Final_Prediction = 'Yes') AS Percentage 
FROM lung_cancer_prediction 
WHERE Final_Prediction = 'Yes' 
GROUP BY Second_Hand_Smoke;



