-- Student Course Management System
-- Step 4: Basic SELECT queries.

USE student_course_management;

-- 1. Display all courses with credits greater than 3.
SELECT
    course_id,
    course_name,
    credits
FROM Courses
WHERE credits > 3
ORDER BY course_id;

-- 2. List students from the IT department.
SELECT
    s.student_id,
    s.name,
    s.email,
    d.department_name
FROM Students s
INNER JOIN Departments d
    ON s.department_id = d.department_id
WHERE d.department_name = 'IT'
ORDER BY s.name;

-- 3. Show all instructors teaching programming courses.
SELECT DISTINCT
    i.instructor_id,
    i.instructor_name,
    c.course_name
FROM Instructors i
INNER JOIN Courses c
    ON i.instructor_id = c.instructor_id
WHERE c.course_name LIKE '%Programming%'
ORDER BY i.instructor_name, c.course_name;

-- 4. Display students registered after 2023.
SELECT
    student_id,
    name,
    registration_date
FROM Students
WHERE registration_date >= '2024-01-01'
ORDER BY registration_date;
