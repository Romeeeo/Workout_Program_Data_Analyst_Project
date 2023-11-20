-- Active: 1696904028854@@127.0.0.1@5432@workoutprogram@public

SELECT * FROM workout;


-- How many NULLS are in each column
SELECT 
  sum(case when workout_id IS NULL then 1 else 0 end) workout_id
  ,sum(case when workout is null then 1 else 0 end) workout
  ,sum(case when muscle_group is null then 1 else 0 end) muscle_group
  ,sum(case when equipment is null then 1 else 0 end) equipment
  ,sum(case when reps is null then 1 else 0 end) reps
  ,sum(case when num_of_sets is null then 1 else 0 end) num_of_sets
  ,sum(case when superset is null then 1 else 0 end) superset
  ,sum(case when program_week is null then 1 else 0 end) program_week
  ,sum(case when date_of_workout is null then 1 else 0 end) date_of_workout
  ,sum(case when stage is null then 1 else 0 end) stage
FROM workout;


-- number of for duplicate rows 
SELECT COUNT(workout_id) - COUNT(DISTINCT workout_id) AS duplicate_rows
FROM workout;

-- All of the muscle groups
SELECT DISTINCT muscle_group
FROM workout;

-- Number of workouts for each muscle group
SELECT muscle_group, COUNT(workout_id) as num_of_workouts
FROM workout
GROUP BY muscle_group
ORDER BY num_of_workouts desc;

-- Types of equipments used in the program
SELECT DISTINCT equipment
FROM workout;

-- Number of workouts for each equipment
SELECT equipment, COUNT(workout_id) as num_of_workouts
FROM workout
GROUP BY equipment
ORDER BY num_of_workouts desc;

-- How many weeks are there in the program
SELECT DISTINCT program_week
FROM workout
ORDER BY program_week DESC
LIMIT 1;

-- The types of stages in the program
SELECT DISTINCT stage
FROM workout;

