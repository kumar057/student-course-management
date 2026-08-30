-- Student Course Management System
-- Step 6: Aggregate function examples.

USE student_course_management;

-- 1. Count the total number of students.
SELECT
    COUNT(*) AS total_students
FROM Students;

-- 2. Count the total number of courses available.
SELECT
    COUNT(*) AS total_courses
FROM Courses;

-- 3. Find the average number of credits for all courses.
SELECT
    AVG(credits) AS average_course_credits
FROM Courses;

-- 4. Count how many students are enrolled in each course.
SELECT
    c.course_id,
    c.course_name,
    COUNT(e.student_id) AS enrolled_students
FROM Courses c
LEFT JOIN Enrollments e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY enrolled_students DESC, c.course_name;

-- 5. Find the course with the highest number of enrollments.
SELECT
    c.course_id,
    c.course_name,
    COUNT(e.student_id) AS enrollment_count
FROM Courses c
LEFT JOIN Enrollments e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY enrollment_count DESC, c.course_name
LIMIT 1;
