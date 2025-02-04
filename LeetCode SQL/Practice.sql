-- SQL 50 Study Plan LeetCode


-- SELECT QUERIES

-- 1757. Recyclable and Low Fat Products
Select product_id from Products where low_fats = 'Y' and recyclable = 'Y';

-- 584. Find Customer Referee
SELECT name FROM Customer WHERE referee_id IS NULL OR referee_id != 2;

-- 595. Big Countries
SELECT name, population, area FROM world WHERE area >= 3000000 OR population >= 25000000;

-- 1148. Article Views I
SELECT DISTINCT author_id as id FROM Views WHERE author_id = viewer_id ORDER BY id;

-- 1683. Invalid Tweets
SELECT tweet_id FROM Tweets WHERE length(content) > 15;


-- BASIC JOIN QUERIES

-- 1378. Replace Employee ID With The Unique Identifier
SELECT eu.unique_id, e.name FROM Employees as e LEFT JOIN EmployeeUNI as eu ON e.id = eu.id;

-- 1068. Product Sales Analysis I
SELECT p.product_name, s.year, s.price FROM Sales s JOIN Product p ON s.product_id = p.product_id;
