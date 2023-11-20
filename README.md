# 12 Week Workout Program Data Analysis Project
Data Analyst Project for a 12 week workout program that I made for myself
## Introduction
In this case study, I will perform many real-world tasks of a junior data analyst at a fictional fitness company. In order to answer the key business questions, I will follow the steps of the data analysis process: [Ask](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/edit/main/README.md#ask), [Prepare](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/edit/main/README.md#prepare), [Process](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/edit/main/README.md#process), [Analyze](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/edit/main/README.md#analyze-and-share), [Share](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/edit/main/README.md#analyze-and-share), and [Act](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/edit/main/README.md#act).
### Quick links:
Data Source: For this project I took one of my 12 week workout programs and created a CSV from it. You can download the Data [Here](https://drive.google.com/uc?export=download&id=1AJovdTjjJM06A0DlkZkRYzWrUd2h6Tub)
  
SQL Queries:  
[01. Creating Table and Combining Data](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Queries/Create_table.sql)  
[02. Data Exploration](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Queries/Explore_Data.sql)  
[03. Data Cleaning](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Queries/Clean_table.sql)  
[04. Data Analysis](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Queries/Data_Analysis.sql)  

Data Visualizations: [Microsoft Power BI Interactive Dashboard (Download)](https://drive.google.com/uc?export=download&id=1Zvm5RVASFC9lLY4_9837WO4O1SPRpQB3)  
## Background

### Scenario
I am a junior data analyst working in the marketing analyst team at a fitness company. The director of marketing believes the company’s future success depends on maximizing the number people subscribing to their workout programas. Therefore, your team wants to understand the key components and valuable knowledge that is needed from a general 12 week program. From these insights, your team will design a new marketing strategy to bring in new subscribers. But first, the executives must approve your insights, so they must be backed up with compelling data insights and professional data visualizations.


## Ask
### Business Task
Devise insights on a 12 week program to allow people to better understand what is to come and what is needed.
### Analysis Questions
Three questions will guide the future marketing program:  
1. What are the key components of the 12 week workout program? 
2. What are the main equipments that are utilized in the program?
3. How do the different intensity levels differ in the program?  

The main objective is to provide insight on a simple 12 week program that everyone can follow.

The insights will help people ease in to a workout program with general valuble knowledge on what is to come, whether they are a beginner or are advanced.
## Prepare
### Data Source
For this project I took one of my 12 week workout programs and created a CSV from it. You can download the Data [Here](https://drive.google.com/uc?export=download&id=1AJovdTjjJM06A0DlkZkRYzWrUd2h6Tub)

### Data Organization
There is only one data file that consist of a workout program that spands over 12 weeks. The data consist of data such as the workout id, workout, muscle group, equipment, reps, number of sets, whether a workout is a superset or not, program week, date of a workout, and stage of the workout. The corresponding column names are workout_id, workout, muscle_group, equipment, reps, num_of_sets, superset, program_week, date_of_workout, stage.

## Process
I will use PostgreSQL to create a table from the dataset and clean it.    
Reason:  
PostgreSQL is the preferred choice over Microsoft Excel in projects that require scalable, secure, and collaborative data management with complex data types and advanced automation capabilities.
### Creating the table from the dataset
SQL Query: [01. Creating Table](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Queries/Create_table.sql)  
A table workout is created to store all of the data from the dataset. There is 453 rows of data for the entire 12 week program.
### Data Exploration
SQL Query: [02. Data Exploration](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Queries/Explore_Data.sql)    
Before cleaning the data, I am familiarizing myself with the data to find the inconsistencies.  

Observations:  
1. The following table shows number of __null values__ in each column.  
   
   ![image](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Images/w1.png)

2. We will use workout_id to check for duplicates, as that is the primary key and has no NULL values.  

   ![image](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Images/w2.png)

   Running the query we see that there are __0 duplicates__ in the dataset.
  
3. All of the muscle groups and the number of workout for each muscle group.

   ![image](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Images/w4.png)

4. Types of equipment used in the program.

   ![image](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Images/w5.png)
   
   Number of workouts for each eqipment.

   ![image](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Images/w6.png)

6. How many weeks are there in the program.

   ![image](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Images/w7.png)

   Result after running query

   ![image](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Images/w8.png)

7. The types of stages in the program 

  ![image](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Images/w9.png)

### Data Cleaning
SQL Query: [Data Cleaning](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Queries/Clean_table.sql)  
1. All the rows having missing values are deleted.  
2. Added 1 column of data, __month__ to specify the month the workout is taking place in. Should only be 4 months in the program (Mar, Apr, May, Jun). 
3. Workouts with invalid data are taken out.
     - __workout__ is not NULL
     - __reps__ are not 0
     - __num_of_sets__ are not 0
     - __program_week__ is in between 1-12. The workout program is a 12 week program.

A new clean table is created in the database called __workout_clean__ . This table will be used to analyze the data for the rest of the project.

Here is what the new table is looking like after all of the cleaning

![image](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Images/w10.png)

Total of __0__ rows are removed in this step. (I did create the dataset, so I'm assuming all of the data is valid)
  
## Analyze and Share
SQL Query: [Data Analysis](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Queries/Data_Analysis.sql)  
Data Visualization: [Microsoft Power BI Interactive Dashboard (Download)](https://drive.google.com/uc?export=download&id=1Zvm5RVASFC9lLY4_9837WO4O1SPRpQB3) 

Now that the data is clean and ready to be analyzed, let's focud on the analysis question that we discussed in the beginning of this project.

__What are the key components of the 12 week workout program and how do the intensity levels differ?__

The total number of workuts are:

![image](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Images/w15.png)

Out of those, __180__ are supersets.

The rep range for all workouts is __4-30__ reps for a workout. In other words, the least amount of reps you will ever do is __4__, and the most is __30__, in the program.
The set range is __2-6__.

First let's look at the distruibution of workouts by muscle group

![image](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Images/w11.png)

Here is the percentage ditribution:

![image](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Images/w16.png)
  
Here we can clearly see that leg workouts make up the most of the workout program. We are able to understand that this program focuses on legs more than any other muscle group.
On the other hand biceps make up the least amount of workouts in the program.
  
Next the number of workout for each equipment used in the program.
  
![image](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Images/w12.png)
  
Looking at the visual, we can observe that the top three equipment used in the program are __machine__, __dumbbells__, and __body weight__ (body weight in the case is considered an equipment). On the other hand we can see that the __thick bar__ is rarely used in the 12 week program, with only 1 workout using it out of all 453.
  
Number of workouts per muscle group each month.  
  
![image](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Images/w13.png)  

In this visual we can see most (all excluding abs) see a peak in the number of workout in the month of April. In this case, people should be prepared to get more workouts in during that month, and provide sufficient time to complete each and all of the workouts.

On the otherhand, the number of workouts tend to be the lowest in June towards the end of the program. This makes sense, as the workouts tend to be more intense at the end of the program in the __shred__ stage.

Here are the number of days off (days not working out) for each month:

![image](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Images/w17.png)

Let's look at the toal days of each stage the workout program consists of. The four stages in the program are __preperatory__, __hypertrophy__, __loading__, and __shred__.

![image](https://github.com/Romeeeo/Workout_Program_Data_Analyst_Project/blob/main/Images/w14.png)

Here we can see that the hypertrophy stage makes up most of the program. This makes senses, as this is wear most of the muscle growing is done, after preparing for it. The preperatory stage makes up the least amount of days in the program. This tells us that the majority of the stage consist of muscle growing and losing fat. The beginning of the porgram (preperatory stage) gets you ready and your body prepared for the rest of the program that is to come, hence the name.

Summary:
  
|Analysis and Insights|
|------|
|The program heavily focuses on building muscles for your legs.|
|The program tends to lean more towards the 8-12 rep range and 3-4 sets range for most workouts.|
|Workouts tend to increase in the month of April in the hypertrophy stage, where muscle growth and fat loss is most incetivised.|  
|THe program utilizes mahines, dumbbells, and your body weight for most of the workout.|
|Arms are less focused in this program (shoulders, triceps, and biceps).|
|Workouts tend to be repeated throughout the weeks.|
|The shred stage (towards the end of the program) is when the workout become more intense.|
  
## Act
After analyzing the 12 week program, we can suggest recommendations to people on subscribing to the program.

1. People will most likely need to have a gym memebership in order to utilize the equipment used in the program.
2. Legs will need to be more prepared than any other muscle group.
3. People will get more knowledge on workout and what muscle group they work on after the program is done, as workouts are easy to understand and they tend to repeat throughout the weeks.
4. The program is each to understand and gives valuable specifics.
