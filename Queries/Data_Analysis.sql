-- Active: 1696904028854@@127.0.0.1@5432@workoutprogram@public

SELECT * FROM workout_clean;

-- All of the unique workouts per muscle group throughout
-- the whole program --
SELECT muscle_group, workout
FROM workout_clean
GROUP BY muscle_group, workout
ORDER BY muscle_group;

-- Number of workouts per muscle group for the whole program
SELECT muscle_group, COUNT(workout_id) AS no_of_workouts
FROM workout_clean
GROUP BY muscle_group
ORDER BY no_of_workouts desc; 

-- Number of workout each MONTH
SELECT month, COUNT (workout_id) as no_of_workouts
FROM workout_clean
GROUP BY month
ORDER BY no_of_workouts desc;

-- Percentage of workouts per muscle_group
SELECT muscle_group, COUNT(workout_id) AS total_workouts,
    ROUND((COUNT(workout_id) * 100.0 / SUM(COUNT(workout_id)) OVER ()),3) AS percentage
FROM workout_clean
GROUP BY muscle_group
ORDER BY percentage desc;

-- Average number of sets per workout
SELECT workout, AVG(num_of_sets) as avg_no_of_sets
FROM workout_clean
GROUP BY workout
ORDER BY avg_no_of_sets;

-- Number of supersets
SELECT SUM(CASE WHEN superset = 'yes' then 1 else 0 end) as no_of_supersets
FROM workout_clean;

-- Number of workouts per stage
SELECT stage, COUNT (workout_id) as no_of_workouts
FROM workout_clean
GROUP by stage
ORDER BY no_of_workouts desc;

-- Average number of reps for the program
SELECT CEILING(AVG(reps)) as avg_no_of_reps
FROM workout_clean;

-- Average number of sets for the program
SELECT CEILING(AVG(num_of_sets)) as avg_no_of_sets
FROM workout_clean;

-- Average number of sets for each stage
SELECT stage, CEILING(AVG(num_of_sets)) as avg_no_of_sets
FROM workout_clean
GROUP BY stage;

-- Number of days working out per MONTH
SELECT month, COUNT(DISTINCT date_of_workout) as days_working_out
FROM workout_clean
GROUP BY month
ORDER BY days_working_out desc;

-- Number of days off (not working out) per month
SELECT month, 30 - COUNT(DISTINCT date_of_workout) as days_off
FROM workout_clean
GROUP BY month
ORDER BY days_off desc;

-- Equipment used
SELECT equipment
FROM workout_clean
GROUP by equipment;

-- Percentage of equipment used in the program
SELECT equipment, COUNT(workout_id) AS total_workouts,
    ROUND((COUNT(workout_id) * 100.0 / SUM(COUNT(workout_id)) OVER ()),3) AS percentage
FROM workout_clean
GROUP BY equipment 
ORDER BY percentage desc;

-- What weeks are associated with each stage
SELECT program_week, stage
FROM workout_clean
GROUP BY program_week, stage
ORDER BY program_week;

-- What equipment is used in each stage
SELECT DISTINCT equipment, stage
FROM workout_clean
GROUP BY stage, equipment
ORDER BY stage;

-- Rep range for all workouts in the program (excluding abs)
WITH CTE AS (
SELECT MIN(reps) as min_reps,
    MAX(reps) as max_reps
FROM (
    SELECT * FROM workout_clean
    WHERE muscle_group != 'abs'
)
)
SELECT CONCAT(min_reps, '-', max_reps) AS rep_range
FROM CTE;


