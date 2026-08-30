-- Student Course Management System
-- Step 7: Subquery examples.

USE student_course_management;

-- 1. Find students not enrolled in any course.
-- The subquery returns student IDs that appear in Enrollments.
SELECT
    student_id,
    name
FROM Students
WHERE student_id NOT IN (
    SELECT e.student_id
    FROM Enrollments e
    WHERE e.student_id IS NOT NULL
)
ORDER BY name;

-- 2. Find courses with no students enrolled.
-- The subquery returns course IDs that appear in Enrollments.
SELECT
    course_id,
    course_name
FROM Courses
WHERE course_id NOT IN (
    SELECT e.course_id
    FROM Enrollments e
    WHERE e.course_id IS NOT NULL
)
ORDER BY course_name;

-- 3. Find students enrolled in more than one course.
-- The subquery groups enrollments by student and keeps students with more than one row.
SELECT
    student_id,
    name
FROM Students
WHERE student_id IN (
    SELECT e.student_id
    FROM Enrollments e
    GROUP BY e.student_id
    HAVING COUNT(*) > 1
)
ORDER BY name;

-- 4. Show courses whose credits are above the average credits.
-- The subquery calculates the average credits across all courses.
SELECT
    course_id,
    course_name,
    credits
FROM Courses
WHERE credits > (
    SELECT AVG(credits)
    FROM Courses
)
ORDER BY credits DESC, course_name;

-- 5. Find instructors teaching more than one course.
-- The subquery groups courses by instructor and keeps instructors with more than one course.
SELECT
    instructor_id,
    instructor_name
FROM Instructors
WHERE instructor_id IN (
    SELECT c.instructor_id
    FROM Courses c
    WHERE c.instructor_id IS NOT NULL
    GROUP BY c.instructor_id
    HAVING COUNT(*) > 1
)
ORDER BY instructor_name;
