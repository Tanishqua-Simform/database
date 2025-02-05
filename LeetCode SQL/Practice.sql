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
