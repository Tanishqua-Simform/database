<a id="0"></a>

# [Database](#1) | [PostgreSQL](#2) | [MongoDB](#3)

We have developed good Front-end skills by now. It is time to get started with the Back-end!

##### Dt. 03 Feb, 2025.

<a id="1"></a>

## [Database](#0)

##### Basic Concepts

A Database Management System (DBMS) is software that manages data storage, retrieval, and manipulation efficiently. It consists of -

- Users - End-users, database administrators, and developers.
- Applications - Interfaces that allow users to interact with data.
- DBMS Software - The core system handling data operations.
- Database - Collection of structured data.

##### Database Architecture? [\*](https//www.guru99.com/dbms-architecture.html)

- One-Tier Architecture
  - The Client, Server, and Database all reside on the same machine
  - Direct database access, mainly for local applications.
  - Example - A personal finance management application that stores user expenses in a local SQLite database on a mobile device.
- Two-Tier Architecture
  - Presentation layer runs on a client and data is stored on a server
  - Client-server model with direct queries.
  - Example - A university management system where students use a web portal to query student records stored in a centralized database server.
- Three-Tier Architecture
  - Presentation layer (PC, Tablet, Mobile, etc.), Application layer (server) and Database Server
  - Involves a middle-tier for better abstraction and security.
  - Example - An online banking system uses a DBMS to store customer details, account balances, and transaction history. The customer interacts with the banking app (application layer), which communicates with the database via queries handled by the DBMS.

### ER Models [\*](https//www.geeksforgeeks.org/introduction-of-er-model/)

The Entity-Relationship (ER) Model is used to visually design databases before implementation.

##### Components

- Entities - Real-world objects such as Student, Course.
- Attributes - Characteristics of entities such as Name, Age.
- Relationships - Associations between entities such as Student enrolls in Course.
- Keys - Unique identifiers including Primary Key and Foreign Key.

##### Types of Entities

- Strong Entity - An entity that has a primary key and exists independently, such as a Student or Course.
- Weak Entity - An entity that does not have a primary key and depends on a strong entity for identification, such as a dependent in an Employee database.
- Associative Entity - Used to represent a relationship as an entity when additional attributes need to be stored, such as an Enrollment entity linking Students and Courses.

##### Types of Attributes

- Simple Attribute - Attributes that cannot be broken down further, such as Name or Age.
- Composite Attribute - Attributes that can be divided into smaller sub-parts, such as Full Name split into First Name and Last Name.
- Derived Attribute - Attributes that can be derived from other attributes, such as Age derived from Date of Birth.
- Multivalued Attribute - Attributes that can have multiple values, such as Phone Numbers for a person.
- Key Attribute - An attribute that uniquely identifies an entity, such as StudentID or EmployeeID.

##### Types of Relationships (Cardinality)

- One-to-One (1 -1) - Each entity in set A is related to at most one entity in set B, and vice versa. Example - A country has one capital city.
- One-to-Many (1 -M) - One entity in set A can be related to multiple entities in set B, but each entity in set B is related to only one entity in set A. Example - A teacher teaches multiple students, but each student has only one teacher (in a specific subject).
- Many-to-Many (M -N) - Multiple entities in set A can be related to multiple entities in set B. Example - A student can enroll in multiple courses, and each course can have multiple students.

##### Types of Keys

- Primary Key - A unique identifier for an entity, such as StudentID.
- Candidate Key - A set of attributes that uniquely identify an entity; one of them is chosen as the primary key.
- Super Key - A set of attributes that uniquely identify an entity but may contain additional attributes beyond the minimal requirement.
- Foreign Key - An attribute in one table that refers to the primary key in another table, establishing relationships.
- Composite Key - A key consisting of multiple attributes used together to uniquely identify a record, such as (StudentID, CourseID) in an enrollment table.
- Alternate Key - The candidate keys that were not chosen as the primary key.

##### ER Diagram Symbols

- Rectangle - Entity
- Ellipse - Attribute
- Diamond - Relationship
- Line - Connection between entities and attributes

### ER to Relational Model [\*](https//www.studytonight.com/dbms/er-to-relational-model.php)

##### Conversion Process

- Entities become tables.
- Attributes become columns.
- Primary Keys serve as unique identifiers.
- Relationships are implemented using foreign keys.
- Weak Entities require separate tables with foreign key dependencies.

### Relational Algebra [\*](https//www.studytonight.com/dbms/relational-algebra.php)

Relational Algebra provides fundamental operations to query databases mathematically.

##### Basic Operators

- Selection (σ) - Filters rows based on conditions.
- Projection (π) - Selects specific columns.
- Union (∪) - Combines results of two relations.
- Intersection (∩) - Common records between relations.
- Difference (-) - Returns records present in one but not the other relation.
- Cartesian Product (×) - Joins all records from both relations.
- Join (⨝) - Combines related tuples based on common attributes.

##### Real-World Example

In an e-commerce platform, selection retrieves customers who purchased a specific product, projection extracts only customer names and emails, and join links orders with customer details.

### Database Normalization [\*](https//www.studytonight.com/dbms/database-normalization.php)

Database Normalization ensures data consistency, removes redundancy, and improves efficiency.

##### Why We Need Normalization

- Eliminates data redundancy, preventing duplicate information from being stored.
- Ensures data consistency, reducing anomalies in insert, update, and delete operations.
- Enhances data integrity by organizing data logically.
- Optimizes storage by structuring data efficiently.
- Improves query performance by minimizing unnecessary data scans.

##### Normal Forms -

- First Normal Form (1NF)
  - Ensures atomicity by eliminating duplicate columns and multivalued attributes.
  - Example - A table storing student courses as comma-separated values violates 1NF. Splitting courses into separate rows fixes this.
- Second Normal Form (2NF)
  - Removes partial dependencies by ensuring each non-key column depends on the full primary key.
  - Example - In a student-course table with (StudentID, CourseID) as primary key, storing StudentName violates 2NF since it depends only on StudentID. Separating students into a different table fixes this.
- Third Normal Form (3NF)
  - Eliminates transitive dependencies where non-key columns should not depend on other non-key columns.
  - Example - A table with StudentID, DepartmentID, and DepartmentName violates 3NF since DepartmentName depends on DepartmentID. Creating a separate department table fixes this.
- Boyce-Codd Normal Form (BCNF)
  - Ensures every determinant is a candidate key.
  - Example - If a professor teaches a subject in a department, and we have (Professor, Subject, Department), BCNF requires that all determinants (Professor and Subject) be unique keys.

That is it for today! I have also installed Postgres in my machine and have practiced simple SQL queries. [Postgres Practice](/Postgres%20Practice/) folder contains it.
I will resume from here tomorrow with more complex theories. Stay tuned!

##### Dt. 04 Feb, 2025.

Today, I will be covering Transactions and concurrency control, indexing, B and B+ Tree, File organization, SQL and NoSQL, and SQL Stored Procedures.

To refer [CodeHelp DBMS Notes.](https://drive.google.com/file/d/1y3KKghRhQjKfbWhvLipMOCCemKd_XdTm/view)

### Transactions [\*](https://www.w3schools.in/dbms/transaction/)

A transaction in a database is a sequence of operations performed as a single logical unit of work. Transactions ensure data integrity and consistency even in the presence of failures or concurrent access.

#### ACID Properties

ACID properties ensure the reliability of transactions in a database system.

- Atomicity - A transaction is treated as a single unit that either completes fully or does not execute at all.
  - Example - If a flight booking system fails after deducting payment but before confirming the ticket, the transaction is rolled back.
  - Implementation - Atomicity is implemented using rollback and commit operations. If a transaction fails, the system rolls back to its previous state. Transaction logs and undo operations ensure that incomplete transactions do not affect the database.
- Consistency - Ensures the database transitions from one valid state to another without violating integrity constraints.
  - Example - A student database should not allow an entry for a student without assigning a unique ID.
- Isolation - Transactions execute independently without interference from other transactions.
  - Example - In an e-commerce system, two users placing orders at the same time should not interfere with each other’s stock updates.
  - Issues in Isolation -
    - Dirty Read - Occurs when a transaction reads uncommitted changes made by another transaction, leading to inconsistent data.
    - Non-Repeatable Read - Happens when a transaction reads the same row twice, but another transaction modifies the data between reads, leading to different results.
    - Phantom Read - Occurs when a transaction retrieves a set of rows, but another transaction inserts or deletes rows in the same range before the initial transaction completes.
- Durability - Once a transaction is committed, changes persist even after system failures.
  - Implementation - Durability is implemented using transaction logs and write-ahead logging (WAL). Once a transaction is committed, its changes are written to permanent storage.
  - Recovery Methods for Ensuring Durability -
    - Shadow Copy Scheme - Maintains two copies of the database - one active and one shadow.
    - Log-Based Recovery - Uses logs to track changes before committing. If a failure occurs, the system can replay logs to restore the database.

##### Schedules

A schedule is an ordered sequence of transactions that ensures database consistency. There are different types of schedules -

- Serial Schedule - Transactions are executed one after the other without overlapping.
- Non-Serial Schedule - Transactions are interleaved but must ensure consistency.
- Recoverable Schedule - Ensures that if a transaction depends on another, it commits only after the dependent transaction commits.
- Cascadeless Schedule - Prevents cascading rollbacks by ensuring no transaction reads uncommitted data.
- Strict Schedule - Ensures that once a transaction writes a data item, no other transaction can access it until the writing transaction commits or rolls back.

##### Real-World Example

In an online shopping system, purchasing multiple items involves updating stock levels and processing payment. If payment is successful but stock update fails, the transaction is rolled back to ensure consistency.

#### Integrity Constraints

Integrity constraints ensure that the data in a database remains accurate, consistent, and reliable. They enforce rules that prevent invalid data from being inserted, updated, or deleted.

##### Types of Integrity Constraints

- Entity Integrity - Ensures that each table has a unique primary key and that the primary key value is never null.
  - Example - In a student database, each student must have a unique student ID.
- Referential Integrity - Ensures that foreign key values in one table must match primary key values in another table.
  - Example - In an order processing system, an order must reference an existing customer ID in the customer table.
- Domain Integrity - Ensures that values in a column must adhere to defined constraints, such as data type, range, or format.
  - Example - A birthdate column should only accept valid date values and not text.
- User-Defined Integrity - Custom business rules applied to maintain data consistency.
  - Example - A bank system ensures that withdrawal amounts do not exceed the account balance.

#### Serializability

Serializability ensures that concurrent transactions produce the same result as if they were executed sequentially.

##### Why We Need Serializability

- Prevents lost updates.
- Avoids dirty reads.
- Eliminates inconsistent retrievals.
- Maintains database integrity.

##### Types of Serializability

- Conflict Serializability
- View Serializability

##### Real-World Example

In a ticket booking system, if multiple users book seats simultaneously, serializability ensures that the final state remains consistent without overselling seats.

## Concurrency Control [\*](https://www.javatpoint.com/dbms-concurrency-control)

Concurrency control mechanisms ensure that multiple transactions can execute simultaneously without leading to data inconsistencies.

##### Techniques for Concurrency Control

- Lock-Based Protocols - Transactions acquire locks on data items to ensure mutual exclusivity.
  - Example - A bank transaction locks an account balance before updating it to prevent conflicting updates.
- Timestamp-Based Protocols - Transactions are assigned timestamps to determine execution order.
  - Example - In an inventory system, timestamps prevent outdated stock updates from overwriting newer ones.
- Optimistic/Validation-Based Concurrency Control - Transactions execute without locking but validate before committing.
  - Example - An online shopping cart allows multiple users to modify quantities, but final validation ensures stock consistency.

### Indexing [\*](https://www.javatpoint.com/indexing-in-dbms)

Indexing is a technique used to optimize the performance of database queries by reducing the time required to retrieve data.

##### Types of Indexing

- Primary Index - Built on a table’s primary key to enable fast access.
- Secondary Index - Built on non-primary key attributes to improve search performance.
- Clustered Index - Determines the physical order of data in a table.
- Non-Clustered Index - Maintains a separate structure for indexing without affecting the data's physical order.
- Sparse Index - Contains index entries for only some of the data records, making it memory efficient.
- Dense Index - Contains index entries for every data record, allowing faster lookups but consuming more storage.

##### Benefits

- Faster Query Performance - Indexes improve the speed of data retrieval operations by providing a quick path to the data.
- Efficient Sorting - Indexes can be used to speed up the sorting of data.
- Enhanced Search - Indexes allow more efficient searching for rows based on specific columns.
- Reduced Disk I/O - By indexing key columns, the database can avoid scanning entire tables, reducing the number of disk reads.

##### Limitations

- Storage Overhead - Indexes consume additional disk space, especially for dense indexes.
- Slower Write Operations - Insert, update, and delete operations may be slower because the index needs to be updated as well.
- Complexity - Managing multiple indexes can become complex and affect performance if not done properly.
- Increased Maintenance - Indexes require maintenance and optimization, especially when data changes frequently.

##### Real-World Example

A library catalog system uses indexing to quickly find books based on title, author, or ISBN.

### B and B+ Trees [\*](https://www.javatpoint.com/dbms-b-plus-tree)

B-trees and B+ trees are data structures used in database indexing to improve search efficiency.

##### B-Trees

- A self-balancing tree structure used for indexing.
- Each node contains multiple keys and pointers to child nodes.
- Ensures that search, insert, and delete operations are efficient.

##### B+ Trees

- A variation of B-trees where data is stored only in leaf nodes.
- Internal nodes contain only keys, improving search performance.
- Leaf nodes are linked, making range queries faster.

##### Real-World Example

Databases use B+ trees for indexing to allow quick searches on large datasets, such as retrieving all customers whose last names fall within a specific range.

### File Organization in Database [\*](https://www.geeksforgeeks.org/file-organization-in-dbms-set-1/)

File organization refers to the method in which data is stored on physical storage devices. Proper file organization is essential for the performance of the database, affecting how efficiently data is accessed, modified, and managed.

##### Types of File Organization

- Heap File Organization - Data is stored in an unordered manner, and records are inserted as they come.
- Sequential File Organization - Data is stored in a sequential manner, and it requires a sort operation before accessing or inserting data.
- Hashed File Organization - Uses a hash function to determine where data should be stored, which speeds up access for specific queries.
- Clustered File Organization - Stores related records together based on a clustering key to improve retrieval performance.

##### Spanned Mapping

- Definition - Spanned mapping allows a record to span multiple blocks of memory, meaning that when a record is too large to fit into one block, it continues to the next available block.
- Advantages -
  - Efficiently handles records that exceed the size of a single block.
  - Minimizes wasted space.
- Disadvantages -
  - Slower access to records, as the system must search multiple blocks to retrieve the full record.
  - Complexity in managing the continuity of a record across multiple blocks.

##### Unspanned Mapping

- Definition - Unspanned mapping ensures that each record fits entirely within a single block of memory. If the record is larger than the available space in the block, it is split and stored in another block.
- Advantages -
  - Simplifies access to records, as each record is fully contained in one block.
  - Faster retrieval, as no additional blocks need to be accessed.
- Disadvantages -
  - Wasted space if records do not fully utilize the block.
  - Less efficient when records vary significantly in size.

### SQL (Structured Query Language) [\*](https://www.guvi.com/blog/nosql-vs-sql-which-database-should-you-use/)

SQL is a standardized language used to manage and manipulate relational databases. It allows users to create, read, update, and delete (CRUD) data using structured commands.

##### Where to Use SQL

- Applications requiring structured data - SQL is ideal for applications where data integrity and consistency are crucial, such as banking and finance.
- Multi-row transactions - Best suited for scenarios that require complex queries and transactions, like inventory management or order processing.
- Relational Data Modeling - When data is well-structured and relationships between different entities are well-defined.

##### Advantages

- Structured and Consistent - Ensures strong consistency with ACID (Atomicity, Consistency, Isolation, Durability) compliance.
- Powerful Querying Capabilities - Allows complex queries using joins, aggregations, and indexing.
- Scalability (Vertical) - SQL databases efficiently scale vertically by adding more processing power (CPU, RAM).
- Strong Data Integrity and Security - Constraints such as primary keys, foreign keys, and unique constraints ensure data validity.

##### Disadvantages

- Rigid Schema - Requires predefined schema, making it less flexible for changing data structures.
- Scalability (Horizontal) - Not well-suited for horizontal scaling (distributing load across multiple servers).
- Performance Bottlenecks - With large-scale distributed applications, joins and complex queries can slow down performance.

##### Examples

- MySQL - Open-source, widely used for web applications.
- PostgreSQL - Advanced open-source SQL database with strong support for complex queries.
- Oracle Database - Enterprise-grade SQL database for high-performance applications.
- Microsoft SQL Server - A robust solution for enterprise-level database management.

##### SQL Query

```sql
SELECT customer_name, order_date
FROM orders
WHERE order_status = 'Completed'
ORDER BY order_date DESC;
```

### NoSQL (Not Only SQL)

NoSQL databases are designed to handle unstructured and semi-structured data, providing flexibility and scalability for modern applications.

##### Where to Use NoSQL

- Big Data & Real-Time Applications - Suitable for applications handling massive volumes of data, such as social media, IoT, and real-time analytics.
- Flexible Schema Requirements - Best for applications with dynamic or evolving data structures, like content management systems.
- High Availability and Scalability Needs - Ideal for distributed systems requiring horizontal scaling.

##### Advantages

- Schema Flexibility - Does not require a predefined schema, allowing storage of different data formats.
- Horizontal Scalability - Can distribute data across multiple servers easily.
- High Performance - Optimized for speed in read/write operations.
- Handles Unstructured Data - Supports key-value, document, column-family, and graph-based storage models.

##### Disadvantages

- Lack of Standardization - Unlike SQL, NoSQL lacks a universal query language.
- Weaker Data Consistency - Many NoSQL databases trade consistency for availability and partition tolerance (CAP theorem).
- Learning Curve - Developers need to understand different NoSQL database models and their use cases.

##### Examples

- MongoDB - Document-based NoSQL database, commonly used for web applications.
- Cassandra - Column-family NoSQL database designed for high availability and fault tolerance.
- Redis - Key-value NoSQL database used for caching and session storage.
- Neo4j - Graph-based NoSQL database for applications needing complex relationships.

##### NoSQL Query (MongoDB)

```json
db.orders.find({ "order_status" - "Completed" }).sort({ "order_date" - -1 });
```

#### SQL vs. NoSQL - Key Differences

| Feature        | SQL (Relational)                             | NoSQL (Non-Relational)                                                           |
| -------------- | -------------------------------------------- | -------------------------------------------------------------------------------- |
| Data Structure | Structured, tabular                          | Unstructured or semi-structured (JSON, key-value, column-family, graph)          |
| Schema         | Fixed schema (predefined structure)          | Dynamic schema (flexible, can evolve)                                            |
| Scalability    | Vertical scaling (adding CPU/RAM)            | Horizontal scaling (distributing data across multiple servers)                   |
| Query Language | SQL (Structured Query Language)              | Varies (NoSQL databases use their own query mechanisms)                          |
| Transactions   | Follows ACID properties (strong consistency) | CAP theorem (often favors availability and partition tolerance over consistency) |
| Best For       | Banking, finance, transactional applications | Big Data, real-time applications, IoT, content management                        |
| Performance    | Can slow down with complex joins             | Optimized for fast read/write operations                                         |
| Flexibility    | Requires predefined schema, less adaptable   | Flexible schema, adaptable to changing data                                      |
| Examples       | MySQL, PostgreSQL, SQL Server, Oracle        | MongoDB, Cassandra, Redis, Neo4j                                                 |

#### Social Media Applications Using Both SQL & NoSQL

Many large-scale social media platforms use a hybrid approach, combining SQL and NoSQL databases for different purposes -

##### How Social Media Uses Both SQL and NoSQL

1. SQL for Structured Data & Transactions -

   - User Profiles (e.g., usernames, emails, passwords) → Stored in relational databases like MySQL, PostgreSQL, or SQL Server for consistency and integrity.
   - Financial Transactions (e.g., ads, premium subscriptions) → Require ACID compliance to ensure accurate payments.

2. NoSQL for Scalability & Speed -

   - Posts, Comments, Likes, and Feeds → Stored in NoSQL document databases like MongoDB to handle high-volume, flexible data.
   - Real-Time Chats & Notifications → Stored in Redis (key-value store) for low-latency access.
   - Graph-Based Relationships (e.g., followers, mutual friends) → Managed using Neo4j (Graph database) to quickly retrieve complex connections.

##### Real-World Examples of Social Media Databases

- Instagram -

  - Uses PostgreSQL for relational data such as user profiles.
  - Uses Cassandra for scaling large amounts of unstructured content like posts and stories.

- Twitter -
  - Uses MySQL for user account information.
  - Uses Manhattan (a custom NoSQL database) for distributed storage.
  - Uses Redis for caching frequently accessed data like trending topics.

By combining SQL and NoSQL, social media platforms ensure data consistency, high availability, and fast performance at scale.

## SQL Stored Procedures [\*](https://www.w3schools.com/sql/sql_stored_procedures.asp)

SQL procedures (or Stored Procedures) are precompiled SQL statements stored in a database that can be executed as a single unit. They help improve performance, security, and reusability.

##### Where to Use?

- Automating Repetitive Tasks (e.g., bulk data updates)
- Improving Performance (precompiled execution)
- Enhancing Security (controlled access to database logic)
- Encapsulating Business Logic (reducing redundant code in applications)

##### Advantages

- Faster Execution
- Reduces Network Traffic
- Enhances Security
- Promotes Code Reusability

##### Disadvantages of SQL Procedures

- Database Dependency
- Debugging Challenges
- Complex Maintenance

#### PostgreSQL Stored Procedure Syntax

```sql
CREATE PROCEDURE GetCustomerOrders(IN customer_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT order_id, order_date, total_amount
    FROM orders
    WHERE orders.customer_id = customer_id;
END;
$$;
```

##### Executing the Stored Procedure

```sql
CALL GetCustomerOrders(101);
```

To conclude my day I practiced a few SQL queries from LeetCode - [Check it out.](/LeetCode%20SQL/Practice.sql)

Tomorrow I will be learning more about Postgres and SQL Queries.

##### Dt. 05 Feb, 2025.

Reference material for [PostgreSQL Neon](https://neon.tech/postgresql/tutorial) and [Playlist - Intro to postgres](https://www.youtube.com/playlist?list=PL-osiE80TeTsKOdPrKeSOp4rN3mza8VHN)
I refered this site for a while and practiced on Sample database - [Check it out](/Postgres%20Practice/sampledb/tanishqua.sql)

<a id="2"></a>

## [PostgreSQL](#0)

#### 1. Querying Data

- Select – shows how to query data from a single table.
- Column aliases – assigns temporary names to columns or expressions within a query.
- Order By – guides you on sorting the result set returned by a query.
- Select Distinct – removes duplicate rows from the result set.

#### 2. Filtering Data

- Where – filters rows based on a specified condition.
- AND operator – combines two boolean expressions and returns true if both evaluate to true.
- OR operator – combines two boolean expressions and returns false if either evaluates to false.
- Limit – retrieves a subset of rows generated by a query.
- Fetch – limits the number of rows returned by a query.
- In – selects data that matches any value in a list of values.
- Between – selects data within a range of values.
- Like – filters data based on pattern matching.
- Is Null – checks if a value is null or not.

#### 3. Joining Multiple Tables

- Joins – provides a brief overview of joins in PostgreSQL.
- Table aliases – explains how to use table aliases in a query.
- Inner Join – selects rows from one table that have corresponding rows in another table.
- Left Join – selects rows from one table that may or may not have corresponding rows in another table.
- Self-join – joins a table to itself by comparing it to itself.
- Full Outer Join – finds rows in a table that do not have matching rows in another table.
- Cross Join – produces a Cartesian product of the rows in two or more tables.
- Natural Join – joins two or more tables using implicit join conditions based on common column names.

#### 4. Grouping Data

- Group By – divides rows of a result set into groups and optionally applies an aggregate function to each group.
- Having – applies conditions to groups, allowing filtering of groups.

Later I switched to solve SQL queries on [LeetCode](/LeetCode%20SQL/Practice.sql)
I will watch a video tutorial for advance topics in postgres tomorrow.

##### Dt. 06 Feb, 2025.

I watched a [Postgres One Shot](https://www.youtube.com/watch?v=cnzka7kF5Zk) video and summarized it as follows -

### Usage of Different DBMS

- PostgreSQL: Open-source, ACID-compliant, supports complex queries and JSON.
- MySQL: Widely used for web applications, known for speed and reliability.
- Oracle DB: Enterprise-grade, supports high-volume transactions and analytics.
- SQL Server: Microsoft's relational database, used for enterprise applications.
- MongoDB: NoSQL document-based DBMS, flexible schema for unstructured data.
- SQLite: Lightweight, serverless, and commonly used for local storage.

### Difference in Database, Schema, and Table

- Database: A structured collection of data, storing multiple schemas and tables.
- Schema: A logical grouping of database objects like tables, views, and functions.
- Table: A structured collection of rows and columns storing specific data.

### CRUD in Database

- Create: Insert new records (`INSERT` statement).
- Read: Retrieve data (`SELECT` statement).
- Update: Modify existing records (`UPDATE` statement).
- Delete: Remove records (`DELETE` statement).

### Datatypes in PostgreSQL

- Integer Types: `INTEGER`, `SMALLINT`, `BIGINT`
- Floating Point: `REAL`, `DOUBLE PRECISION`
- String Types: `TEXT`, `VARCHAR`, `CHAR`
- Boolean: `BOOLEAN`
- Date/Time: `DATE`, `TIMESTAMP`, `TIME`
- JSON: `JSON`, `JSONB`
- Array: `ARRAY`

### Constraints in PostgreSQL

- PRIMARY KEY: Uniquely identifies a record.
- FOREIGN KEY: Ensures referential integrity.
- UNIQUE: Prevents duplicate values.
- NOT NULL: Ensures a column cannot have NULL values.
- CHECK: Enforces custom conditions.

### Serial

`SERIAL` is an auto-incrementing integer type used for primary keys. Example:

```sql
CREATE TABLE users (id SERIAL PRIMARY KEY, name TEXT);
```

### Data Refining Clauses

- WHERE: Filters rows.
- GROUP BY: Groups data.
- HAVING: Filters grouped data.
- ORDER BY: Sorts results.
- DISTINCT: Removes duplicates.

### Operators

- Arithmetic: `+`, `-`, `*`, `/`
- Comparison: `=`, `!=`, `>`, `<`, `>=`, `<=`
- Logical: `AND`, `OR`, `NOT`
- String: `||` (concatenation)

### Aggregate Functions

- `COUNT()`: Counts rows.
- `SUM()`: Adds values.
- `AVG()`: Calculates average.
- `MIN()`, `MAX()`: Finds min/max values.
- `ARRAY_AGG()`: Aggregates values into an array.

### String Functions

- `LENGTH()`: Returns string length.
- `LOWER()`, `UPPER()`: Converts case.
- `CONCAT()`: Joins strings.
- `TRIM()`: Removes whitespace.
- `SUBSTRING()`: Extracts part of a string.

### What is a Subquery?

A query nested within another query, used in `SELECT`, `WHERE`, and `HAVING` clauses.
Example:

```sql
SELECT name FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);
```

### ALTER Query

Used to modify database objects.
Examples:

- Add a column: `ALTER TABLE users ADD COLUMN age INT;`
- Modify a column: `ALTER TABLE users ALTER COLUMN age TYPE BIGINT;`
- Drop a column: `ALTER TABLE users DROP COLUMN age;`

### CASE Expression

Used for conditional logic in SQL.
Example:

```sql
SELECT name, salary,
CASE WHEN salary > 50000 THEN 'High' ELSE 'Low' END AS salary_category
FROM employees;
```

### Joins

- INNER JOIN: Returns matching rows.
- LEFT JOIN: Returns all left-table rows, matching right-table rows.
- RIGHT JOIN: Returns all right-table rows, matching left-table rows.
- FULL JOIN: Returns all rows when a match exists.
- CROSS JOIN: Returns Cartesian product.
- SELF JOIN: Joins a table to itself.

### Views

A virtual table based on a query.
Example:

```sql
CREATE VIEW active_users AS SELECT * FROM users WHERE status = 'active';
```

### HAVING Clause and GROUP ROLLUP

- HAVING: Filters grouped results.
- ROLLUP: Creates subtotals and grand totals.
  Example:

```sql
SELECT department, SUM(salary) FROM employees GROUP BY ROLLUP(department);
```

### COALESCE

Returns the first non-NULL value.
Example:

```sql
SELECT COALESCE(NULL, 'Hello', 'World'); -- Returns 'Hello'
```

### Stored Routine

A pre-written SQL block stored in the database. Includes:

- Stored Procedure: Executes without returning a value.
- Stored Function: Executes and returns a value.
  Example:

```sql
CREATE FUNCTION get_salary(emp_id INT) RETURNS INT AS $$
BEGIN RETURN (SELECT salary FROM employees WHERE id = emp_id);
END; $$ LANGUAGE plpgsql;
```

### Window Functions

Perform calculations over a set of rows.
Examples:

- `ROW_NUMBER() OVER (ORDER BY salary DESC)`
- `SUM(salary) OVER (PARTITION BY department)`

### What are CTEs?

Common Table Expressions (CTEs) simplify complex queries.
Example:

```sql
WITH department_salary AS (
    SELECT department, SUM(salary) AS total_salary FROM employees GROUP BY department
)
SELECT * FROM department_salary WHERE total_salary > 100000;
```

### Triggers

A function that executes automatically when an event occurs on a table.
Example:

```sql
CREATE TRIGGER log_changes AFTER UPDATE ON employees FOR EACH ROW EXECUTE FUNCTION log_employee_changes();
```

### Advanced Topics in PostgreSQL -

Some video references for advance topics are -

- [15 SQL Interview Questions](https://www.youtube.com/watch?v=oX5Y26O5dBE)
- Indexing -
  - [Database Indexing Explained (with PostgreSQL)](https://www.youtube.com/watch?v=-qNSXK7s7_w)
  - [How does indexing work in Databases in Hindi](https://www.youtube.com/watch?v=xXtig5uLQS4)
- Triggers -
  - [Postgres Triggers in a Nutshell](https://www.youtube.com/watch?v=l3rgdShkkfE)
  - [Sql Triggers🔫 Real Life Example](https://www.youtube.com/watch?v=qr8QIZRHDaY)
- Views -
  - [SQL Views In 4 Minutes: Super Useful! Wow!](https://www.youtube.com/watch?v=vLLkNI-vkV8)
  - [View in Database | Types of Views](https://www.youtube.com/watch?v=QngqhdLd1SE)
- Materialized Views -
  - [Faster SQL Queries using Materialized Views](https://www.youtube.com/watch?v=WzkBZ0byoYE)
- Sequence -
  - [SEQUENCE in SQL with Syntax](https://www.youtube.com/watch?v=EDZMYBNj7wM)
- [5 Secrets for making PostgreSQL run BLAZING FAST. ](https://www.youtube.com/watch?v=YON9PliOYFk)

### Summary of Imp Points -

- Schema – A logical container for database objects like tables, views, indexes, and functions. Helps organize data and manage access control. Example: `public`, `sales_schema`.

- Constraint – Rules enforced on table columns to ensure data integrity. Examples:

  - `PRIMARY KEY` (ensures unique identifier)
  - `FOREIGN KEY` (ensures referential integrity)
  - `UNIQUE` (prevents duplicate values)
  - `NOT NULL` (ensures a value is always provided)
  - `CHECK` (enforces custom conditions)

- Table – A structured collection of data stored in rows and columns. Each column has a specific datatype, and each row represents a record.

- Sequence – A special database object that generates unique numbers, often used for auto-incrementing IDs. Example:

  ```sql
  CREATE SEQUENCE user_id_seq START WITH 1 INCREMENT BY 1;
  ```

- View – A virtual table based on a `SELECT` query. It doesn’t store data itself but presents data dynamically from underlying tables. Useful for simplifying complex queries.

  ```sql
  CREATE VIEW active_users AS
  SELECT * FROM users WHERE status = 'active';
  ```

- Stored Procedure – A set of SQL statements stored and executed as a unit, often used for automation and business logic. Example:

  ```sql
  CREATE PROCEDURE increase_salary(emp_id INT, amount DECIMAL)
  AS
  BEGIN
      UPDATE employees SET salary = salary + amount WHERE id = emp_id;
  END;
  ```

- Materialized View – A physical copy of a query result stored in the database, used to improve performance. Unlike a regular view, it needs to be refreshed periodically.

  - When query takes a lot of time and the table is modified rarely use materialized view

  ```sql
  CREATE MATERIALIZED VIEW sales_summary AS
  SELECT region, SUM(sales) FROM orders GROUP BY region;
  ```

- Trigger – A function that executes automatically when an event (`INSERT`, `UPDATE`, `DELETE`) occurs on a table. Example:

  ```sql
  CREATE TRIGGER log_changes
  AFTER UPDATE ON employees
  FOR EACH ROW EXECUTE FUNCTION log_employee_changes();
  ```

- Indexing – A performance optimization technique that speeds up queries by creating a quick lookup structure.

  - Use Explain Analyze keyword in Select query to see the difference.
  - Use indexing only when data is read intensive not when write intensive.
  - Example:

  ```sql
  CREATE INDEX idx_users_email ON users(email);
  ```

- Information Schema – A system database that stores metadata about tables, columns, constraints, indexes, and more. Example query to list all tables:
  ```sql
  SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';
  ```

### LMS SQL-DB Task

After understanding the basic concepts of SQL, it is time to put my skills to test.

I am starting the SQL-DB task on LMS. I will be using PostgreSQL. Good luck to me!

Okay, so I have completed the task. You can have a look here - [SQL-DB](https://github.com/Tanishqua-Simform/SQL-DB)

I practiced a query on [LeetCode](/LeetCode%20SQL/Practice.sql) although it was a bit complex so I could only manage to do 1 today. Calling it a day now! I will start MongoDB tomorrow.

##### Dt. 07 Feb, 2025.

<a id="3"></a>

## [MongoDB](#0)

I watched a [MongoDB One Shot](https://www.youtube.com/watch?v=tww-gbNPOcA) video and summarized it as follows -

### What is MongoDB?

MongoDB is a NoSQL database that stores data in flexible JSON-like documents. It provides high scalability, performance, and schema-less design, making it ideal for applications requiring dynamic and hierarchical data storage. It supports features like indexing, aggregation, and replication.

### Basic Queries

MongoDB provides basic queries such as `find()`, `insertOne()`, `updateOne()`, and `deleteOne()`. These queries allow users to retrieve, add, modify, and remove documents from collections efficiently.

### What is MongoDB ATLAS?

MongoDB Atlas is a fully managed cloud database service that allows users to deploy, manage, and scale MongoDB clusters easily. It provides automated backups, security, and performance monitoring.

### Create & Drop Database, Collection

To create/select a database, use `use dbName`. To create a collection, use `db.createCollection(name)`. To remove a collection, use `db.collection.drop()`. MongoDB creates databases and collections dynamically when data is inserted.

### CRUD Operations in MongoDB

#### CREATE

Used to insert new documents.
Example:
`db.collection.insertOne({ name: 'John', age: 30 })`
`db.collection.insertMany([{ name: 'Alice' }, { name: 'Bob' }])`

Other Methods:

- `save()`: Inserts a document, updating if `_id` exists
- `insert()`: Bulk inserts multiple documents (deprecated in newer versions)

#### READ

Used to retrieve documents.
Example:
`db.collection.find({ age: { $gt: 25 } })`
`db.collection.findOne({ name: 'John' })`

Other Methods:

- `.count()`: Counts the number of matching documents
- `.distinct()`: Retrieves unique values for a field
- `.find().pretty()`: Formats query output in a readable way

#### UPDATE

Used to modify existing documents.
Example:
`db.collection.updateOne({ name: 'John' }, { $set: { age: 35 } })`
`db.collection.updateMany({ age: { $lt: 30 } }, { $set: { status: 'young' } })`

Other Methods:

- `$inc`: Increments a field’s value
- `$rename`: Renames a field
- `$unset`: Removes a field
- `$push`: Adds an item to an array
- `$pop`: Removes first or last element from an array

#### DELETE

Used to remove documents.
Example:
`db.collection.deleteOne({ name: 'Alice' })`
`db.collection.deleteMany({ age: { $lt: 20 } })`

Other Methods:

- `remove({})`: Removes documents based on criteria (deprecated in newer versions)
- `drop()`: Deletes an entire collection

### DataTypes in MongoDB

MongoDB supports multiple data types, including:

- `String`: Stores textual data
- `Number`: Stores integer or floating-point values
- `Boolean`: Stores `true` or `false`
- `Array`: Stores multiple values in a single field
- `ObjectId`: Unique identifier for documents
- `Date`: Stores date and time values
- `Embedded Document`: Stores nested objects within a document

### Operators in MongoDB

- Comparison Operators

  - Used to compare values.
  - Examples: `$eq` (equal), `$ne` (not equal), `$gt` (greater than), `$lt` (less than)

- Logical Operators

  - Used to combine multiple conditions.
  - Examples: `$and`, `$or`, `$not`, `$nor`

- Element Operators

  - Used to check for field existence and type.
  - Examples: `$exists`, `$type`

- Array Operators

  - Used to perform operations on array fields.
  - Examples:

    - `$size`: Matches documents where an array has a specified number of elements
    - `$all`: Matches documents where an array contains all specified elements
    - `$elemMatch`: Matches documents where at least one array element satisfies a condition
    - `$push`: Adds an element to an array field
    - `$pull`: Removes elements from an array that match a condition

- Date Operators

  - Used to manipulate date values.
  - Examples:

    - `$currentDate`: Sets the field to the current date
    - `$dateToString`: Converts a date to a string format
    - `$dateFromString`: Converts a string to a date format
    - `$year`, `$month`, `$dayOfMonth`, `$hour`, `$minute`, `$second`: Extract specific parts from a date
    - `$add`: Adds time to a date field
    - `$subtract`: Subtracts time from a date field

### Cursor Method in MongoDB

Cursors allow efficient data retrieval with methods like:

- `.limit(n)`: Limits the number of returned documents
- `.sort({ field: 1 })`: Sorts results in ascending order (-1 for descending)
- `.skip(n)`: Skips the first `n` documents
- `.forEach()`: Iterates over query results

### Aggregate Framework in MongoDB

Aggregation pipelines allow data transformation and computation.
Common stages:

- `$match`: Filters documents
- `$group`: Groups data based on a field
- `$sort`: Sorts the results
- `$project`: Selects specific fields

### Indexes in MongoDB

Indexes improve query performance by allowing faster lookups. Common index types include:

- Single-field indexes: Index on a single field to speed up queries.
- Compound indexes: Index on multiple fields to improve query efficiency.
- Text indexes: Used for full-text search.
- Hashed indexes: Used for sharding and evenly distributing data.
- Unique indexes: Ensure that field values are unique across documents.
- Partial indexes: Apply to a subset of documents for optimization.

Indexes significantly enhance read performance but may slow down write operations due to maintenance overhead.

### Advance Topics -

#### Transactions in MongoDB

Transactions ensure ACID compliance for multi-document operations, ensuring consistency and rollback capabilities.

#### Sharding in MongoDB

Sharding distributes data across multiple servers, improving scalability and performance.

#### Replica in MongoDB

Replication provides data redundancy and high availability by maintaining multiple copies of data across different servers.

##### Difference Between Sharding and Replica

- Sharding is used to distribute large amounts of data across multiple servers to improve performance and scalability.
- Replication is used to maintain copies of the same data on multiple servers to ensure high availability and fault tolerance.
- Sharding splits the data into smaller parts (shards) and distributes them, while replication keeps full copies of the data.
- Sharding is useful for handling massive datasets, whereas replication ensures data availability in case of failure.

### PyMongo

PyMongo is a Python library used to interact with MongoDB. It allows users to connect to MongoDB, perform CRUD operations, and execute queries efficiently.

#### Installation

`pip install pymongo`

#### Connecting to MongoDB

```python
from pymongo import MongoClient
client = MongoClient("mongodb://localhost:27017/")
db = client["mydatabase"]
```

#### CRUD Operations in PyMongo

- Insert: `db.collection.insert_one({"name": "Alice"})`
- Find: `db.collection.find_one({"name": "Alice"})`
- Update: `db.collection.update_one({"name": "Alice"}, {"$set": {"age": 25}})`
- Delete: `db.collection.delete_one({"name": "Alice"})`

PyMongo provides an easy way to manage MongoDB databases using Python.

### Misc Tasks

Watching the whole video got monotonous so I took a quiz on SQL from several platforms to freshen up and to test myself.

- [Testdome](https://app.testdome.com/screening/challenge/12) -> [(Certificate)](https://www.testdome.com/certificates/617c179ee6db4a4abddf0acc1eb8bb7a)
- [w3Schools](https://www.w3schools.com/quiztest/quiztest.asp?qtest=SQL)
- [GFG](https://www.geeksforgeeks.org/sql-quiz/)

I also created a command-line based [To-Do List](/To-Do%20List/) using PyMongo to implement CRUD operations.

I read a few articles on MongoDb as well as skimmed through Documentation links provided on LMS.

- [GFG - MongoDB: An introduction](https://www.geeksforgeeks.org/mongodb-an-introduction/?ref=gcse)
- [GFG - MongoDB CRUD Operations](https://www.geeksforgeeks.org/mongodb-crud-operations/?ref=gcse)
- [MongoDB Aggregate](https://www.mongodb.com/docs/manual/reference/method/db.collection.aggregate/)
- [PyMongo Tutorial](https://pymongo.readthedocs.io/en/stable/tutorial.html)

So that is it for today. Now, I will perform LMS MongoDB task on Monday.

##### Dt. 10 Feb, 2025.

Okay then today I will perform mongoDB task and revise aggregations in MongoDB as well as PyMongo.

### LMS MongoDB Task

It is time to put my NoSQL skills to test. Wish me luck!

Alright! I have successfully completed my MongoDB Task after extensive brainstorming. Here is the link to my [repo.](https://github.com/Tanishqua-Simform/MongoDB)

Later, I revised [MongoDB aggregations](https://www.w3schools.com/mongodb/mongodb_aggregations_intro.php) and [PyMongo.](https://www.w3schools.com/python/python_mongodb_getstarted.asp) (Useful for quick reference.)

##### With this we come to an end for our Database Course (Learning duration - 6 days).
