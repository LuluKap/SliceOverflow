package pizza.shop;

import java.sql.*;
import java.util.Scanner;

public class CustomerEntry {
    // USE YOUR SQL PASSWORD
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/PizzaShop?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String USER = "pizza";
    private static final String PASS = "StrongPass123!";

    public static void main(String[] args) {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASS);
             Scanner input = new Scanner(System.in)) {

            while (true) {
                System.out.println("1. Add/Update Customer");
                System.out.println("2. Delete My Account (Customer)");
                System.out.println("3. Delete Customer (Employee Only)");
                System.out.println("4. List Active Customers");
                System.out.println("5. Edit Customer");
                System.out.println("6. Exit");
                System.out.print("Choose an option: ");

                int choice = Integer.parseInt(input.nextLine().trim());

                switch (choice) {
                    case 1:
                        addOrUpdateCustomer(conn, input);
                        break;
                    case 2:
                        deleteSelf(conn, input);
                        break;
                    case 3:
                        deleteAsEmployee(conn, input);
                        break;
                    case 4:
                        listActiveCustomers(conn);
                        break;
                    case 5:
                        editCustomer(conn, input);
                        break;
                    case 6:
                        System.out.println("Exiting...");
                    return;
                    default:
                        System.out.println("Invalid choice. Try again.");
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Add or update a customer
    private static void addOrUpdateCustomer(Connection conn, Scanner in) throws SQLException {
        System.out.print("Customer name: ");
        String name = in.nextLine().trim();
        System.out.print("Phone: ");
        String phone = in.nextLine().trim();
        System.out.print("Address (street, city, state zip): ");
        String address = in.nextLine().trim();
        System.out.print("Card brand + last4 (e.g., Visa 1234): ");
        String card = in.nextLine().trim();

        String sql =
                "INSERT INTO Customers (name, phone, address, card_info) VALUES (?,?,?,?) "
                        + "ON DUPLICATE KEY UPDATE address = VALUES(address), card_info = VALUES(card_info)";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, address);
            ps.setString(4, card);
            ps.executeUpdate();
            System.out.println("Customer added or updated successfully!");
        }
    }

    // Customer deletes their own account
    private static void deleteSelf(Connection conn, Scanner in) throws SQLException {
        System.out.print("Enter your phone number: ");
        String phone = in.nextLine().trim();

        String sql = "UPDATE Customers SET is_active = 0 WHERE phone = ? AND role = 'customer' AND is_active = 1";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, phone);
            int rows = ps.executeUpdate();
            if (rows > 0) {
                System.out.println("Your account has been deleted successfully.");
            } else {
                System.out.println("No active customer account found for that phone number.");
            }
        }
    }

    // Employee deletes any customer account
    private static void deleteAsEmployee(Connection conn, Scanner in) throws SQLException {
        System.out.print("Enter your employee phone number: ");
        String empPhone = in.nextLine().trim();

        // Verify employee identity
        String verify = "SELECT role FROM Customers WHERE phone = ? AND role = 'employee' AND is_active = 1";
        try (PreparedStatement check = conn.prepareStatement(verify)) {
            check.setString(1, empPhone);
            ResultSet rs = check.executeQuery();
            if (!rs.next()) {
                System.out.println("Access denied. Only employees can delete other accounts.");
                return;
            }
        }

        System.out.print("Enter the phone number of the customer to delete: ");
        String targetPhone = in.nextLine().trim();

        String delete = "UPDATE Customers SET is_active = 0 WHERE phone = ? AND role = 'customer' AND is_active = 1";
        try (PreparedStatement ps = conn.prepareStatement(delete)) {
            ps.setString(1, targetPhone);
            int rows = ps.executeUpdate();
            if (rows > 0) {
                System.out.println("Customer account deleted successfully by employee.");
            } else {
                System.out.println("No active customer account found or target is not a customer.");
            }
        }
    }

        // Lists all active customers in the database
    private static void listActiveCustomers(Connection conn) throws SQLException {
        String sql = "SELECT customer_id, name, phone, address FROM Customers WHERE is_active = 1 ORDER BY name";
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            System.out.println("\nActive customers:");
            boolean found = false;
            while (rs.next()) {
                found = true;
                System.out.printf("(%d) %s  [%s]  %s%n",
                        rs.getInt("customer_id"),
                        rs.getString("name"),
                        rs.getString("phone"),
                        rs.getString("address"));
            }
            if (!found) {
                System.out.println("No active customers found.");
            }
        } // ← closes try-with-resources
    }     // ← closes listActiveCustomers

    // Edit a customer's address/card by phone (employee or owner)
    private static void editCustomer(Connection conn, Scanner in) throws SQLException {
        System.out.print("Enter customer phone number to edit: ");
        String phone = in.nextLine().trim();

        String check = "SELECT * FROM Customers WHERE phone = ? AND is_active = 1";
        try (PreparedStatement verify = conn.prepareStatement(check)) {
            verify.setString(1, phone);
            try (ResultSet rs = verify.executeQuery()) {
                if (!rs.next()) {
                    System.out.println("No active customer found with that phone number.");
                    return;
                }
            }
        }

        System.out.print("Enter new address: ");
        String address = in.nextLine().trim();
        System.out.print("Enter new card info: ");
        String card = in.nextLine().trim();

        String update = "UPDATE Customers SET address = ?, card_info = ? WHERE phone = ? AND is_active = 1";
        try (PreparedStatement ps = conn.prepareStatement(update)) {
            ps.setString(1, address);
            ps.setString(2, card);
            ps.setString(3, phone);
            int rows = ps.executeUpdate();
            if (rows > 0) {
                System.out.println("Customer information updated successfully!");
            } else {
                System.out.println("No changes made.");
            }
        }
    }
} // ← final brace for class
