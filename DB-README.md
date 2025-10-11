Setup Instructions
1. Clone the repository
git clone https://github.com/LuluKap/SliceOverflow.git
cd SliceOverflow

2. Install MySQL

Make sure you have MySQL Server 8+ and MySQL Workbench installed.

3. Import the database schema

We included a schema file: pizza_schema.sql

In MySQL Workbench:

Open a connection to localhost

Go to File → Open SQL Script

Select pizza_schema.sql

Run the script (⚡ lightning bolt)

4. Configure database connection in Java

Inside the project’s code, update your database credentials:

String url = "jdbc:mysql://localhost:3306/PizzaShop";
String user = "root";      // your MySQL username
String password = "yourpassword"; 

5. Run the project

Open in IntelliJ, build with Maven, and run the program.
