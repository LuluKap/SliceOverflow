---

# Team Setup Instructions – Slice Overflow System

## UPDATE
To run  sql in your code enter these into MySQL Workbench:

SOURCE /path/to/sql/01-schema.sql;

SOURCE /path/to/sql/02-triggers.sql;

SOURCE /path/to/sql/03-seed.sql;

OR

copy contents of each sql and run it

## 1. Required Software

Everyone must install the same tools and versions.

| Tool                       | Version                               | Notes                                     |
| -------------------------- | ------------------------------------- | ----------------------------------------- |
| JDK                        | 17                                    | Verify with `java -version`               |
| Maven                      | 3.9+                                  | Verify with `mvn -v`                      |
| MySQL Server and Workbench | 8.0+                                  | Install using MySQL Installer for Windows |
| IDE                        | IntelliJ IDEA Community (recommended) | Detects Maven automatically               |

---

## 2. Clone the Repository

```bash
git clone https://github.com/<your-team-name>/SliceOverflowSystem.git
cd SliceOverflowSystem
```

Verify that your structure looks like this:

```
SliceOverflowSystem/
├── pom.xml
├── src/
│   ├── main/
│   │   ├── java/pizza/shop/...
│   │   └── resources/db/pizza_schema.sql
└── README-Setup.md
```

---

## 3. Set Up the Database

1. Open MySQL Workbench.
2. Make sure the **MySQL80** service is running.
3. Open a new SQL tab and execute:

   ```sql
   SOURCE src/main/resources/db/pizza_schema.sql;
   ```

   or copy the contents of that file and run them manually.
4. Verify:

   ```sql
   USE PizzaShop;
   SHOW TABLES;
   SELECT * FROM Customers;
   ```

---

## 4. Configure Database Credentials

Edit `src/main/java/pizza/shop/db/DBConnection.java` and confirm:

```java
private static final String URL =
    "jdbc:mysql://127.0.0.1:3306/PizzaShop?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
private static final String USER = "root";
private static final String PASS = ""; // your MySQL password if set
```

Do not change the database name.
Each teammate uses their own MySQL username and password.

---

## 5. Build the Project

In a terminal from the project root:

```bash
mvn clean compile
```

Expected output:
`[INFO] BUILD SUCCESS`

---

## 6. Run the Application

### IntelliJ IDEA

1. Open the project folder.
2. Wait for Maven dependencies to load.
3. Right-click `App.java` → **Run 'App.main()'**.

### Command Line

```bash
mvn exec:java -Dexec.mainClass="pizza.shop.App"
```

---

## 7. Test the Connection

Run this quick check inside `App.java`:

```java
try (Connection conn = DBConnection.getConnection()) {
    System.out.println("Connected to " + conn.getCatalog());
}
```

Expected output:
`Connected to PizzaShop`

---

## 8. Troubleshooting

| Problem                       | Solution                                                                |
| ----------------------------- | ----------------------------------------------------------------------- |
| Unknown database 'PizzaShop'  | Run `pizza_schema.sql` again.                                           |
| Access denied for user 'root' | Update credentials in `DBConnection.java`.                              |
| Connection refused            | Start the MySQL80 service in Windows Services.                          |
| Unknown column 'is_active'    | Run: `ALTER TABLE Customers ADD COLUMN is_active TINYINT(1) DEFAULT 1;` |
| Maven not recognized          | Install via Chocolatey: `choco install maven -y`.                       |
| JDK mismatch                  | Use JDK 17; verify `java -version`.                                     |

---

## 9. Team Standards

* Keep the database name **PizzaShop**.
* Do not commit personal MySQL passwords.
* Update `pizza_schema.sql` whenever the schema changes.
* Always pull latest changes before coding:

  ```bash
  git pull origin main
  ```

---

## 10. Verification

If setup is correct:

* Running `mvn exec:java` starts the console app.
* You can add and delete customers.
* Data appears in the `PizzaShop.Customers` table in MySQL Workbench.

---

You can copy this file as-is into your repository root and share it with your teammates.
