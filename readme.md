# Database

We have developed good Front-end skills by now. It is time to get started with the Back-end!

##### Dt. 03 Feb, 2025.

## Basic Concepts

A Database Management System (DBMS) is software that manages data storage, retrieval, and manipulation efficiently. It consists of -

- Users - End-users, database administrators, and developers.
- Applications - Interfaces that allow users to interact with data.
- DBMS Software - The core system handling data operations.
- Database - Collection of structured data.

##### Database Architecture? [\*](https://www.guru99.com/dbms-architecture.html)

- **One-Tier Architecture**
  - The Client, Server, and Database all reside on the same machine
  - Direct database access, mainly for local applications.
  - Example - A personal finance management application that stores user expenses in a local SQLite database on a mobile device.
- **Two-Tier Architecture**
  - Presentation layer runs on a client and data is stored on a server
  - Client-server model with direct queries.
  - Example - A university management system where students use a web portal to query student records stored in a centralized database server.
- **Three-Tier Architecture**
  - Presentation layer (PC, Tablet, Mobile, etc.), Application layer (server) and Database Server
  - Involves a middle-tier for better abstraction and security.
  - Example - An online banking system uses a DBMS to store customer details, account balances, and transaction history. The customer interacts with the banking app (application layer), which communicates with the database via queries handled by the DBMS.

## ER Models [\*](https://www.geeksforgeeks.org/introduction-of-er-model/)

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

## ER to Relational Model [\*](https://www.studytonight.com/dbms/er-to-relational-model.php)

##### Conversion Process

- Entities become tables.
- Attributes become columns.
- Primary Keys serve as unique identifiers.
- Relationships are implemented using foreign keys.
- Weak Entities require separate tables with foreign key dependencies.

## Relational Algebra [\*](https://www.studytonight.com/dbms/relational-algebra.php)

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

## Database Normalization [\*](https://www.studytonight.com/dbms/database-normalization.php)

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
