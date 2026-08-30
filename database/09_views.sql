-- Student Course Management System
-- Step 9: Create and test views.

USE student_course_management;

-- 1. View showing student name, course name, and enrollment date.
CREATE OR REPLACE VIEW vw_student_course_enrollment AS
SELECT
    s.name AS student_name,
    c.course_name,
    e.enroll_date AS enrollment_date
FROM Students s
INNER JOIN Enrollments e
    ON s.student_id = e.student_id
INNER JOIN Courses c
    ON e.course_id = c.course_id;

SELECT * FROM vw_student_course_enrollment;

-- 2. View showing course, instructor, and department.
CREATE OR REPLACE VIEW vw_course_instructor_department AS
SELECT
    c.course_name,
    i.instructor_name,
    d.department_name
FROM Courses c
INNER JOIN Instructors i
    ON c.instructor_id = i.instructor_id
INNER JOIN Departments d
    ON c.department_id = d.department_id;

SELECT * FROM vw_course_instructor_department;

-- 3. View showing each student and the number of courses enrolled.
CREATE OR REPLACE VIEW vw_student_course_count AS
SELECT
    s.name AS student_name,
    COUNT(e.course_id) AS courses_enrolled
FROM Students s
LEFT JOIN Enrollments e
    ON s.student_id = e.student_id
GROUP BY s.student_id, s.name;

SELECT * FROM vw_student_course_count;

-- 4. View showing each course and the total number of enrolled students.
CREATE OR REPLACE VIEW vw_course_enrollment_count AS
SELECT
    c.course_name,
    COUNT(e.student_id) AS total_students_enrolled
FROM Courses c
LEFT JOIN Enrollments e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

SELECT * FROM vw_course_enrollment_count;

-- 5. View showing each student and department.
CREATE OR REPLACE VIEW vw_student_department AS
SELECT
    s.name AS student_name,
    d.department_name
FROM Students s
INNER JOIN Departments d
    ON s.department_id = d.department_id;

SELECT * FROM vw_student_department;
