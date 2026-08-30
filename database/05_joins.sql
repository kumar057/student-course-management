-- Student Course Management System
-- Step 5: INNER JOIN examples.

USE student_course_management;

-- 1. Join Students, Enrollments, and Courses to show each student's enrolled courses.
SELECT
    s.name AS student_name,
    c.course_name
FROM Students s
INNER JOIN Enrollments e
    ON s.student_id = e.student_id
INNER JOIN Courses c
    ON e.course_id = c.course_id
ORDER BY s.name, c.course_name;

-- 2. Join Courses and Instructors to display each course with its instructor.
SELECT
    c.course_name,
    i.instructor_name
FROM Courses c
INNER JOIN Instructors i
    ON c.instructor_id = i.instructor_id
ORDER BY c.course_name;

-- 3. Join Enrollments and Students to show enrollment dates with student names.
SELECT
    e.enroll_date,
    s.name AS student_name
FROM Enrollments e
INNER JOIN Students s
    ON e.student_id = s.student_id
ORDER BY e.enroll_date, s.name;

-- 4. Join Courses and Departments to list courses with their departments.
SELECT
    c.course_name,
    d.department_name
FROM Courses c
INNER JOIN Departments d
    ON c.department_id = d.department_id
ORDER BY d.department_name, c.course_name;

-- 5. Join Students, Enrollments, Courses, and Instructors to show each student's course instructor.
SELECT
    s.name AS student_name,
    c.course_name,
    i.instructor_name
FROM Students s
INNER JOIN Enrollments e
    ON s.student_id = e.student_id
INNER JOIN Courses c
    ON e.course_id = c.course_id
INNER JOIN Instructors i
    ON c.instructor_id = i.instructor_id
ORDER BY s.name, c.course_name;
