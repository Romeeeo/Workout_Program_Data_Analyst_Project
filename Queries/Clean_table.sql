-- Active: 1696904028854@@127.0.0.1@5432@workoutprogram@public

SELECT * FROM workout;

CREATE TABLE IF NOT EXISTS workout_clean AS (
  SELECT 
    workout_id, workout, muscle_group, equipment, 
    reps, num_of_sets, superset, program_week, date_of_workout,
    CASE EXTRACT(MONTH FROM date_of_workout)
      WHEN 1 THEN 'JAN'
      WHEN 2 THEN 'FEB'
      WHEN 3 THEN 'MAR'
      WHEN 4 THEN 'APR'
      WHEN 5 THEN 'MAY'
      WHEN 6 THEN 'JUN'
      WHEN 7 THEN 'JUL'
      WHEN 8 THEN 'AUG'
      WHEN 9 THEN 'SEP'
      WHEN 10 THEN 'OCT'
      WHEN 11 THEN 'NOV'
      WHEN 12 THEN 'DEC'
    END AS month,
    stage
  FROM workout
  WHERE
    workout IS NOT NULL AND
    reps >= 1 AND
    num_of_sets >= 1 AND
    program_week >= 1 AND program_week <= 12
);

-- Number of rows in new clean data
SELECT COUNT(workout_id) AS no_of_rows
FROM workout_clean;

-- Number of rows in old data
SELECT COUNT(workout_id) as no_of_rows
FROM workout;

-- Number of the rows deleted from the clean table
SELECT COUNT(w.workout_id) - COUNT(wc.workout_id) as number_of_rows_removed
FROM workout w, workout_clean wc;

SELECT * FROM workout;

SELECT * FROM workout_clean;

-- Test  month column
SELECT * FROM workout_clean
WHERE month = 'APR';