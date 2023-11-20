-- Active: 1696904028854@@127.0.0.1@5432@workoutprogram@public

CREATE TABLE workout (
    workout_id int PRIMARY KEY,
    workout text,
    muscle_group text,
    equipment text,
    reps int,
    num_of_sets int,
    superset text,
    program_week int,
    date_of_workout date,
    stage text
);

COPY workout
FROM 'D:\Projects\workoutprogram\12wk_Program_RM_new.csv'
DELIMITER ','
CSV Header;

SELECT * FROM workout;

-- Change all record values to lowercase
UPDATE workout
SET workout = LOWER(workout);
--SET muscle_group = LOWER(muscle_group);
--SET equipment = LOWER(equipment);
--SET stage = LOWER(stage);
