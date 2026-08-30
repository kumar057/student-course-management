-- Student Course Management System
-- Step 3: Insert sample data.

USE student_course_management;

-- Departments must be inserted first because students, instructors, and courses reference them.
INSERT INTO Departments (department_id, department_name, department_head) VALUES
(1, 'IT', 'Dr. Kavita Sharma'),
(2, 'CSE', 'Dr. Sanjay Mehta'),
(3, 'ECE', 'Dr. Leela Nair'),
(4, 'Mechanical', 'Prof. Mahesh Rao'),
(5, 'Civil', 'Prof. Anita Desai');

-- Students include registrations before and after 2023.
-- Students 1008 and 1010 intentionally have no enrollments.
INSERT INTO Students (student_id, name, email, phone, department_id, registration_date) VALUES
(1001, 'Aarav Sharma', 'aarav.sharma@example.com', '9876501001', 1, '2022-08-10'),
(1002, 'Priya Nair', 'priya.nair@example.com', '9876501002', 1, '2024-01-15'),
(1003, 'Rohan Gupta', 'rohan.gupta@example.com', '9876501003', 2, '2023-06-05'),
(1004, 'Sneha Verma', 'sneha.verma@example.com', '9876501004', 2, '2024-08-21'),
(1005, 'Kiran Das', 'kiran.das@example.com', '9876501005', 3, '2022-11-12'),
(1006, 'Ananya Rao', 'ananya.rao@example.com', '9876501006', 3, '2025-02-10'),
(1007, 'Vivek Singh', 'vivek.singh@example.com', '9876501007', 4, '2023-09-01'),
(1008, 'Neha Kapoor', 'neha.kapoor@example.com', '9876501008', 5, '2021-07-19'),
(1009, 'Iqbal Khan', 'iqbal.khan@example.com', '9876501009', 1, '2024-03-04'),
(1010, 'Farah Ali', 'farah.ali@example.com', '9876501010', 5, '2025-07-11');

-- Several instructors teach more than one course.
INSERT INTO Instructors (instructor_id, instructor_name, email, phone, department_id) VALUES
(201, 'Dr. Asha Patel', 'asha.patel@example.com', '9876600201', 1),
(202, 'Dr. Rajesh Kumar', 'rajesh.kumar@example.com', '9876600202', 2),
(203, 'Dr. Nisha Rao', 'nisha.rao@example.com', '9876600203', 3),
(204, 'Prof. Vikram Singh', 'vikram.singh@example.com', '9876600204', 4),
(205, 'Dr. Meera Iyer', 'meera.iyer@example.com', '9876600205', 5),
(206, 'Dr. Arjun Menon', 'arjun.menon@example.com', '9876600206', 1);

-- Courses 108 and 110 intentionally have no enrollments.
INSERT INTO Courses (course_id, course_name, credits, department_id, instructor_id) VALUES
(101, 'Database Management Systems', 4, 1, 201),
(102, 'Python Programming', 4, 1, 201),
(103, 'Java Programming', 4, 2, 202),
(104, 'Data Structures', 4, 2, 202),
(105, 'Digital Electronics', 3, 3, 203),
(106, 'Signals and Systems', 4, 3, 203),
(107, 'Thermodynamics', 4, 4, 204),
(108, 'Fluid Mechanics', 3, 4, 204),
(109, 'Surveying', 3, 5, 205),
(110, 'Bridge Design', 4, 5, 205);

-- Enrollments include multiple courses, semesters, and grades.
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enroll_date, semester, grade) VALUES
(1, 1001, 101, '2022-08-20', 'Fall 2022', 'A'),
(2, 1001, 102, '2022-08-21', 'Fall 2022', 'B+'),
(3, 1001, 105, '2023-01-10', 'Spring 2023', 'A-'),
(4, 1002, 101, '2024-01-20', 'Spring 2024', 'A'),
(5, 1002, 102, '2024-01-21', 'Spring 2024', 'A-'),
(6, 1002, 104, '2024-08-10', 'Fall 2024', 'B+'),
(7, 1003, 101, '2023-06-10', 'Summer 2023', 'B'),
(8, 1003, 103, '2023-08-14', 'Fall 2023', 'A'),
(9, 1003, 104, '2023-08-15', 'Fall 2023', 'B+'),
(10, 1004, 101, '2024-08-25', 'Fall 2024', 'A-'),
(11, 1004, 103, '2024-08-26', 'Fall 2024', 'A'),
(12, 1004, 106, '2025-01-08', 'Spring 2025', 'B'),
(13, 1005, 105, '2022-11-20', 'Fall 2022', 'B+'),
(14, 1005, 106, '2023-01-12', 'Spring 2023', 'A-'),
(15, 1005, 101, '2023-01-13', 'Spring 2023', 'B'),
(16, 1006, 106, '2025-02-20', 'Spring 2025', 'A'),
(17, 1006, 105, '2025-02-21', 'Spring 2025', 'A-'),
(18, 1006, 102, '2025-08-01', 'Fall 2025', 'B+'),
(19, 1007, 107, '2023-09-05', 'Fall 2023', 'B'),
(20, 1007, 101, '2024-01-16', 'Spring 2024', 'C+'),
(21, 1009, 102, '2024-03-10', 'Spring 2024', 'A'),
(22, 1009, 103, '2024-08-11', 'Fall 2024', 'B+'),
(23, 1009, 109, '2025-01-15', 'Spring 2025', 'B');
