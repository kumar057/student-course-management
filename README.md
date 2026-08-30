# Student Course Management System

## Project Description

This project is a beginner-friendly MySQL database for managing students, departments, instructors, courses, and course enrollments.

## Technologies

* MySQL 8.x
* VS Code
* Codex

## Database Tables

1. Departments: stores department names and department heads.
2. Students: stores student contact details, department, and registration date.
3. Instructors: stores instructor contact details and department.
4. Courses: stores course names, credits, department, and instructor.
5. Enrollments: connects students to the courses they take.

## Relationships

* Students.department_id references Departments.department_id.
* Instructors.department_id references Departments.department_id.
* Courses.department_id references Departments.department_id.
* Courses.instructor_id references Instructors.instructor_id.
* Enrollments.student_id references Students.student_id.
* Enrollments.course_id references Courses.course_id.

## Project Structure

```text
student-course-management/
|-- database/
|   |-- 01_create_database.sql
|   |-- 02_create_tables.sql
|   |-- 03_insert_sample_data.sql
|   |-- 04_basic_queries.sql
|   |-- 05_joins.sql
|   |-- 06_aggregate_functions.sql
|   |-- 07_subqueries.sql
|   |-- 08_updates_deletes.sql
|   |-- 09_views.sql
|   |-- 10_stored_procedures.sql
|   `-- 11_reports.sql
`-- README.md
```

## How to Run

1. Open MySQL 8.x.
2. Run `database/01_create_database.sql`.
3. Run `database/02_create_tables.sql`.
4. Run `database/03_insert_sample_data.sql`.
5. Run the remaining SQL files in order.
6. Test the views in `database/09_views.sql`.
7. Test the stored procedures in `database/10_stored_procedures.sql`.
8. Run the reports in `database/11_reports.sql`.

## SQL Concepts Used

* CREATE DATABASE
* CREATE TABLE
* PRIMARY KEY
* FOREIGN KEY
* UNIQUE
* CHECK
* INSERT
* SELECT
* WHERE
* JOIN
* GROUP BY
* ORDER BY
* Aggregate functions
* Subqueries
* UPDATE
* DELETE
* Views
* Stored Procedures
* Transactions
