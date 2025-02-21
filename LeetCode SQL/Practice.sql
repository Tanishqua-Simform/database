-- SQL 50 Study Plan LeetCode
-- Dt. 04, Feb, 2025
-- SELECT QUERIES
-- 1757. Recyclable and Low Fat Products
SELECT    product_id
FROM      products
WHERE     low_fats = 'Y'
AND       recyclable = 'Y';

-- 584. Find Customer Referee
SELECT    name
FROM      customer
WHERE     referee_id IS NULL
OR        referee_id != 2;

-- 595. Big Countries
SELECT    name,
          population,
          area
FROM      world
WHERE     area >= 3000000
OR        population >= 25000000;

-- 1148. Article Views I
SELECT    DISTINCT author_id AS id
FROM      views
WHERE     author_id = viewer_id
ORDER BY  id;

-- 1683. Invalid Tweets
SELECT    tweet_id
FROM      tweets
WHERE     LENGTH(content) > 15;

-- BASIC JOIN QUERIES
-- 1378. Replace Employee ID With The Unique Identifier
SELECT    eu.unique_id,
          e.name
FROM      employees AS e
LEFT JOIN employeeuni AS eu ON e.id = eu.id;

-- 1068. Product Sales Analysis I
SELECT    p.product_name,
          s.year,
          s.price
FROM      sales s
JOIN      product p ON s.product_id = p.product_id;

-- Dt. 05, Feb, 2025
-- 1581. Customer Who Visited but Did Not Make Any Transactions
SELECT    v.customer_id,
          COUNT(*) AS count_no_trans
FROM      visits v
LEFT JOIN transactions t ON v.visit_id = t.visit_id
WHERE     t.visit_id IS NULL
GROUP BY  (v.customer_id);

-- 197. Rising Temperature
SELECT    w1.id
FROM      weather w1
JOIN      weather w2 ON datediff (w1.recorddate, w2.recorddate) = 1
WHERE     w1.temperature > w2.temperature;

-- 1661. Average Time of Process per Machine
SELECT    e.machine_id,
          ROUND(AVG(e.timestamp - s.timestamp)::NUMERIC, 3) AS processing_time
FROM      activity e,
          activity s
WHERE     (e.machine_id, e.process_id) = (s.machine_id, s.process_id)
AND       e.activity_type = 'end'
AND       s.activity_type = 'start'
GROUP BY  e.machine_id;

-- 577. Employee Bonus
SELECT    e.name,
          b.bonus
FROM      employee e
LEFT JOIN bonus b ON e.empid = b.empid
WHERE     b.bonus < 1000
OR        b.bonus IS NULL;

-- 1280. Students and Examinations
SELECT    s.student_id,
          s.student_name,
          sub.subject_name,
          COUNT(e.subject_name) AS attended_exams
FROM      students s
CROSS     JOIN subjects sub
LEFT JOIN examinations e ON s.student_id = e.student_id
AND       sub.subject_name = e.subject_name
GROUP BY  s.student_id,
          s.student_name,
          sub.subject_name
ORDER BY  s.student_id,
          sub.subject_name;

-- 570. Managers with at Least 5 Direct Reports
SELECT    name
FROM      (
          SELECT    e.id,
                    e.name,
                    COUNT(*)
          FROM      employee e
          JOIN      employee m ON e.id = m.managerid
          GROUP BY  e.id,
                    e.name
          )
WHERE     count >= 5;

-- BASIC AGGREGATE FUNCTIONS
-- 620. Not Boring Movies
SELECT    id,
          movie,
          description,
          rating
FROM      cinema
WHERE     id % 2 = 1
AND       description != 'boring'
ORDER BY  rating DESC;

-- 1075. Project Employees I
SELECT    p.project_id,
          ROUND(AVG(experience_years), 2) AS average_years
FROM      project p
JOIN      employee e ON p.employee_id = e.employee_id
GROUP BY  p.project_id;

-- Dt. 06, Feb, 2025
-- SORTING AND GROUPING
-- 2356. Number of Unique Subjects Taught by Each Teacher
-- Original approach
SELECT    teacher_id,
          COUNT(*) AS cnt
FROM      (
          SELECT    teacher_id,
                    subject_id
          FROM      teacher
          GROUP BY  teacher_id,
                    subject_id
          ) AS new
GROUP BY  teacher_id;

-- Optimized approach
SELECT    teacher_id,
          COUNT(DISTINCT subject_id) AS cnt
FROM      teacher
GROUP BY  teacher_id;

-- Dt. 21, Feb, 2025
-- SUBQUERIES
-- 1978. Employees Whose Manager Left the Company
SELECT    employee_id
FROM      employees
WHERE     manager_id NOT IN (
          SELECT    employee_id
          FROM      employees
          )
AND       salary < 30000
ORDER BY  employee_id;

-- ADVANCED STRING FUNCTIONS
-- 1667. Fix Names in a Table
SELECT    user_id,
          CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS name
FROM      users
ORDER BY  user_id;

-- 1527. Patients With a Condition
SELECT    patient_id,
          patient_name,
          conditions
FROM      patients
WHERE     conditions LIKE '% DIAB1%'
OR        conditions LIKE 'DIAB1%';

-- 196. Delete Duplicate Emails
DELETE    FROM person
WHERE     id NOT IN (
          SELECT    MIN(id)
          FROM      person
          GROUP BY  email
          );

-- ADVANCED SELECT AND JOINS
-- 1731. The Number of Employees Which Report to Each Employee
SELECT    m.employee_id,
          m.name,
          COUNT(e.employee_id) AS reports_count,
          ROUND(AVG(e.age)) AS average_age
FROM      employees m
JOIN      employees e ON m.employee_id = e.reports_to
GROUP BY  m.employee_id,
          m.name
ORDER BY  employee_id;

-- 1789. Primary Department for Each Employee
-- Using Subquery
SELECT    employee_id,
          department_id
FROM      employee
WHERE     primary_flag = 'Y'
OR        employee_id IN (
          SELECT    employee_id
          FROM      employee
          GROUP BY  employee_id
          HAVING    COUNT(department_id) = 1
          );