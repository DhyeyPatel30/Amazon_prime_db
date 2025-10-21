
# Amazon Prime Videos Database Prototype

📄 **Project Description**

This project is a data modeling and SQL demonstration of how a streaming platform like Amazon Prime Video might design and manage its backend database.

It replicates core entities such as Users, Subscriptions, Movies, Genres, and Watch History, providing a realistic environment to perform SQL queries and analytics.

The schema was built using MySQL with proper normalization, foreign key relationships, and data integrity constraints.
Database is populated using Python and Faker library, allowing meaningful analysis and testing.


## 🧩 Features

- Relational Database Design: 7 interlinked tables designed using an ER model.

- Schema Creation with Safety: Uses CREATE DATABASE IF NOT EXISTS and CREATE TABLE IF NOT EXISTS syntax.

- Data Population: Python + Faker scripts to generate realistic user, movie, and subscription data.

- Complex SQL Queries: Includes analytical queries such as:

- Foreign Key Integrity: Ensures referential consistency across all entities.

## 🛠️ Tech Stack

- Database: MySQL

- Data Generation: Python (Faker library)

- Visualization / Analysis: MySQL Workbench or any SQL IDE


## 📁 Folder Structure

``` 
AmazonPrimeDB/
│
├── schema_description.sql       # Schema creation script with IF NOT EXISTS
├── database_populater.ipynb     # Python Faker script for populating data
├── database_quering.sql         # Collection of analytical SQL queries
├── ER_diagram.png               # Entity Relationship Diagram
└── README.md                    # Project documentation
```

## 🚀 Installation and Running

**Prerequisites**

- Python 3.8+ (if your project uses Python)

- MySQL / PostgreSQL / MongoDB (whichever database you are using)

- Git (for cloning the repository)

- pip (for Python package installation)



#### 💾 **Installation**

1. Clone the repository
```
git clone https://github.com/your-username/amazon-database-project.git
cd amazon-database-project
```

2. Install required packages
```
pip install mysql.connector faker
```

3. Set up  database schema
```
Run schema_description.sql
```

4. Populate Database: run python script
```
python database_populator
```
Note: Configure environment variables in this script according to your MySQL server.

5. Query database
``` 
Run database_quering.sql
```

## 🧠 Learning Objectives

- Understanding database schema design for real-world applications.

- Practicing SQL joins, aggregations, and subqueries.

- Applying data relationships and constraints effectively.

- Demonstrating data analysis proficiency using SQL in a business context.


## 👨‍💻 Author

Name: Dhyey Patel

Personal Email: dhyeyptl3074@gmail.com

LinkedIn: [DhyeyPatel30](https://www.linkedin.com/in/DhyeyPatel30/)

GitHub: [DhyeyPatel30](https://github.com/DhyeyPatel30)
