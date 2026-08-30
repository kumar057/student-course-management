-- Student Course Management System
-- Step 10: Create and test stored procedures.

USE student_course_management;

DROP PROCEDURE IF EXISTS sp_students_by_course;
DROP PROCEDURE IF EXISTS sp_courses_by_department;
DROP PROCEDURE IF EXISTS sp_student_count_by_department;
DROP PROCEDURE IF EXISTS sp_course_details;
DROP PROCEDURE IF EXISTS sp_students_enrolled_after_year;

DELIMITER //

-- Procedure 1: Display all students enrolled in a specific course.
CREATE PROCEDURE sp_students_by_course(IN p_course_id INT)
BEGIN
    SELECT
        s.student_id,
        s.name AS student_name,
        c.course_name,
        e.semester,
        e.grade
    FROM Enrollments e
    INNER JOIN Students s
        ON e.student_id = s.student_id
    INNER JOIN Courses c
        ON e.course_id = c.course_id
    WHERE c.course_id = p_course_id
    ORDER BY s.name;
END //

-- Procedure 2: Show courses offered by a particular department.
CREATE PROCEDURE sp_courses_by_department(IN p_department_id INT)
BEGIN
    SELECT
        c.course_id,
        c.course_name,
        c.credits,
        d.department_name
    FROM Courses c
    INNER JOIN Departments d
        ON c.department_id = d.department_id
    WHERE d.department_id = p_department_id
    ORDER BY c.course_name;
END //

-- Procedure 3: Count total students in a given department.
CREATE PROCEDURE sp_student_count_by_department(IN p_department_id INT)
BEGIN
    SELECT
        d.department_name,
        COUNT(s.student_id) AS total_students
    FROM Departments d
    LEFT JOIN Students s
        ON d.department_id = s.department_id
    WHERE d.department_id = p_department_id
    GROUP BY d.department_id, d.department_name;
END //

-- Procedure 4: Display course details by course ID.
CREATE PROCEDURE sp_course_details(IN p_course_id INT)
BEGIN
    SELECT
        c.course_id,
        c.course_name,
        c.credits,
        d.department_name,
        i.instructor_name
    FROM Courses c
    INNER JOIN Departments d
        ON c.department_id = d.department_id
    INNER JOIN Instructors i
        ON c.instructor_id = i.instructor_id
    WHERE c.course_id = p_course_id;
END //

-- Procedure 5: List students with course enrollments after a given year.
CREATE PROCEDURE sp_students_enrolled_after_year(IN p_year INT)
BEGIN
    SELECT DISTINCT
        s.student_id,
        s.name AS student_name,
        e.enroll_date
    FROM Students s
    INNER JOIN Enrollments e
        ON s.student_id = e.student_id
    WHERE YEAR(e.enroll_date) > p_year
    ORDER BY e.enroll_date, s.name;
END //

DELIMITER ;

-- Example procedure calls.
CALL sp_students_by_course(101);
CALL sp_courses_by_department(1);
CALL sp_student_count_by_department(1);
CALL sp_course_details(101);
CALL sp_students_enrolled_after_year(2023);
