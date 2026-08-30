-- Student Course Management System
-- Step 8: Safe UPDATE and DELETE examples.

USE student_course_management;

-- 1. Update course credits for one course.
-- The transaction is rolled back so the sample data remains unchanged.
START TRANSACTION;

SELECT course_id, course_name, credits
FROM Courses
WHERE course_id = 102;

UPDATE Courses
SET credits = 5
WHERE course_id = 102;

SELECT course_id, course_name, credits
FROM Courses
WHERE course_id = 102;

ROLLBACK;

-- 2. Change one instructor's department.
-- Department 2 exists, so this update does not break the foreign key.
START TRANSACTION;

SELECT instructor_id, instructor_name, department_id
FROM Instructors
WHERE instructor_id = 206;

UPDATE Instructors
SET department_id = 2
WHERE instructor_id = 206;

SELECT instructor_id, instructor_name, department_id
FROM Instructors
WHERE instructor_id = 206;

ROLLBACK;

-- 3. Update one student's phone number.
START TRANSACTION;

SELECT student_id, name, phone
FROM Students
WHERE student_id = 1002;

UPDATE Students
SET phone = '9876501999'
WHERE student_id = 1002;

SELECT student_id, name, phone
FROM Students
WHERE student_id = 1002;

ROLLBACK;

-- 4. Delete courses with no enrollments.
-- Always review the SELECT result before running the DELETE.
START TRANSACTION;

SELECT
    c.course_id,
    c.course_name
FROM Courses c
LEFT JOIN Enrollments e
    ON c.course_id = e.course_id
WHERE e.course_id IS NULL;

DELETE FROM Courses
WHERE course_id IN (
    SELECT course_id
    FROM (
        SELECT c.course_id
        FROM Courses c
        LEFT JOIN Enrollments e
            ON c.course_id = e.course_id
        WHERE e.course_id IS NULL
    ) AS courses_without_enrollments
);

-- Use COMMIT only after verifying the deleted rows.
-- ROLLBACK keeps the sample data available for later files.
ROLLBACK;

-- 5. Delete students who dropped all courses.
-- In this sample project, that means students with no enrollment records.
START TRANSACTION;

SELECT
    s.student_id,
    s.name
FROM Students s
LEFT JOIN Enrollments e
    ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

DELETE FROM Students
WHERE student_id IN (
    SELECT student_id
    FROM (
        SELECT s.student_id
        FROM Students s
        LEFT JOIN Enrollments e
            ON s.student_id = e.student_id
        WHERE e.student_id IS NULL
    ) AS students_without_enrollments
);

-- Use COMMIT only after verifying the deleted rows.
-- ROLLBACK keeps the sample data available for later files.
ROLLBACK;
