package pizza.shop.db;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.*;

public class DBConnection {

    private static final String URL = "jdbc:mysql://127.0.0.1:3306/?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String USER = "root";   // change if needed
    private static final String PASS = "";       // add your MySQL password if you have one
    private static final String DB_NAME = "PizzaShop";

    /**
     * Returns a connection to the PizzaShop database.
     * If it doesn't exist, automatically creates it using pizza_schema.sql.
     */
    public static Connection getConnection() {
        try {
            Connection conn = DriverManager.getConnection(URL, USER, PASS);
            ensureDatabase(conn);
            return DriverManager.getConnection(URL.replace("3306/?", "3306/" + DB_NAME + "?"), USER, PASS);
        } catch (Exception e) {
            throw new RuntimeException("Database connection failed: " + e.getMessage(), e);
        }
    }

    /** Ensures the PizzaShop database and tables exist */
    private static void ensureDatabase(Connection conn) throws Exception {
        try (Statement stmt = conn.createStatement()) {
            stmt.executeUpdate("CREATE DATABASE IF NOT EXISTS " + DB_NAME);
            stmt.executeUpdate("USE " + DB_NAME);
        }

        // Run schema SQL file from resources if tables missing
        try (Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery("SHOW TABLES LIKE 'Customers'");
            if (!rs.next()) {
                System.out.println("Initializing PizzaShop database from schema...");
                runSQLScript(conn, "/db/pizza_schema.sql");
            }
        }
    }

    /** Reads and executes SQL statements from a file in resources/db */
    private static void runSQLScript(Connection conn, String resourcePath) throws Exception {
        try (InputStream in = DBConnection.class.getResourceAsStream(resourcePath)) {
            if (in == null) {
                throw new RuntimeException("SQL file not found in resources: " + resourcePath);
            }
            BufferedReader reader = new BufferedReader(new InputStreamReader(in));
            StringBuilder sql = new StringBuilder();
            String line;

            while ((line = reader.readLine()) != null) {
                line = line.trim();
                if (line.isEmpty() || line.startsWith("--")) continue; // skip comments
                sql.append(line).append("\n");
                if (line.endsWith(";")) {  // end of statement
                    try (Statement stmt = conn.createStatement()) {
                        stmt.execute(sql.toString());
                    }
                    sql.setLength(0);
                }
            }
            System.out.println("✅ PizzaShop database initialized successfully!");
        }
    }
}
