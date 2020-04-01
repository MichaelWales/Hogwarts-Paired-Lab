DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS houses;

CREATE TABLE students (
id SERIAL PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
house_id INT REFERENCES houses(id),
age INT
);

CREATE TABLE houses (
  id SERIAL PRIMARY KEY,
  student_id INT REFERENCES students(id),
  name VARCHAR(255)
);
