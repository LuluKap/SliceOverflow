package pizza.shop;

import pizza.shop.db.DBConnection;
import java.sql.Connection;

public class App {
    public static void main(String[] args) {
        System.out.println("Connecting to PizzaShop DB...");
        try (Connection conn = DBConnection.getConnection()) {
            System.out.println("✅ Connected successfully to " + conn.getCatalog());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
