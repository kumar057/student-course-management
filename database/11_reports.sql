-- Student Course Management System
-- Step 11: Reports and analysis queries.

USE student_course_management;

-- 1. Top 5 most popular courses based on number of enrolled students.
SELECT
    c.course_id,
    c.course_name,
    COUNT(e.student_id) AS total_enrolled_students
FROM Courses c
LEFT JOIN Enrollments e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY total_enrolled_students DESC, c.course_name
LIMIT 5;

-- 2. Department with the most students.
SELECT
    d.department_id,
    d.department_name,
    COUNT(s.student_id) AS total_students
FROM Departments d
LEFT JOIN Students s
    ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name
ORDER BY total_students DESC, d.department_name
LIMIT 1;

-- 3. Instructor teaching the most courses.
SELECT
    i.instructor_id,
    i.instructor_name,
    COUNT(c.course_id) AS total_courses
FROM Instructors i
LEFT JOIN Courses c
    ON i.instructor_id = c.instructor_id
GROUP BY i.instructor_id, i.instructor_name
ORDER BY total_courses DESC, i.instructor_name
LIMIT 1;

-- 4. Student enrollment count per semester.
SELECT
    semester,
    COUNT(*) AS total_enrollments
FROM Enrollments
GROUP BY semester
ORDER BY total_enrollments DESC, semester;

-- 5. Top 5 courses with the highest credits.
SELECT
    course_id,
    course_name,
    credits
FROM Courses
ORDER BY credits DESC, course_name
LIMIT 5;
