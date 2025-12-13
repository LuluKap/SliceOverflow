package org.example;

import javafx.fxml.FXML;
import javafx.scene.control.*;

import java.util.ArrayList;
import java.util.List;

public class OrderController {

    @FXML private Label totalLabel;
    @FXML private ListView<String> orderList;

    // Pizza options
    @FXML private ComboBox<String> pizzaSizeBox;
    @FXML private ComboBox<String> pizzaCrustBox;

    // Toppings
    @FXML private CheckBox pepperoniTopping;
    @FXML private CheckBox sausageTopping;
    @FXML private CheckBox mushroomTopping;
    @FXML private CheckBox onionTopping;
    @FXML private CheckBox oliveTopping;
    @FXML private CheckBox pepperTopping;

    // Drinks
    @FXML private ComboBox<String> drinkTypeBox;
    @FXML private ComboBox<String> drinkSizeBox;

    @FXML
    public void initialize() {
        pizzaSizeBox.getItems().addAll("Small", "Medium", "Large", "Super");
        pizzaCrustBox.getItems().addAll("Thin", "Regular", "Stuffed");

        drinkTypeBox.getItems().addAll(
                "Pepsi", "Diet Pepsi", "Mountain Dew", "Sweet Tea", "Lemonade"
        );
        drinkSizeBox.getItems().addAll("12 oz", "16 oz", "20 oz");

        refreshView();
    }

    /* ================= PRESET DEAL ================= */

    @FXML
    private void addGrandeBox() {
        addItem("Pizza Grande Box (Combo)", 14.99);
    }

    /* ================= CUSTOM PIZZA ================= */

    @FXML
    private void addCustomPizza() {
        String size = getSelectedSize();
        String crust = getSelectedCrust();
        List<String> toppings = getSelectedToppings();

        if (toppings.size() > 4) {
            showAlert("You can select up to 4 toppings only.");
            return;
        }

        String description = "Custom Pizza (" + size + ", " + crust + ")";
        if (!toppings.isEmpty()) {
            description += " - " + String.join(", ", toppings);
        }

        addItem(description, pizzaPrice(size));
        clearToppings();
    }

    /* ================= PRESET PIZZAS ================= */

    @FXML private void addCheese()     { addPresetPizza("Cheese"); }
    @FXML private void addPepperoni()  { addPresetPizza("Pepperoni"); }
    @FXML private void addMargherita() { addPresetPizza("Margherita"); }
    @FXML private void addMeatLovers() { addPresetPizza("Meat Lover's"); }
    @FXML private void addMushroom()   { addPresetPizza("Mushroom"); }

    private void addPresetPizza(String name) {
        String size = getSelectedSize();
        String crust = getSelectedCrust();

        addItem(
                name + " Pizza (" + size + ", " + crust + ")",
                pizzaPrice(size)
        );
    }

    /* ================= SIDES ================= */

    @FXML private void addBreadsticks() { addSide("Breadsticks", 5.99); }
    @FXML private void addMozzarella()  { addSide("Mozzarella Sticks", 5.99); }
    @FXML private void addOnionRings()  { addSide("Onion Rings", 4.99); }
    @FXML private void addPretzels()    { addSide("Pretzel Bites", 5.99); }

    private void addSide(String name, double price) {
        addItem(name, price);
    }

    /* ================= DRINKS ================= */

    @FXML
    private void addDrink() {
        if (drinkTypeBox.getValue() == null || drinkSizeBox.getValue() == null) {
            showAlert("Please select a drink and size.");
            return;
        }

        String description = drinkTypeBox.getValue() +
                " (" + drinkSizeBox.getValue() + ")";

        addItem(description, drinkPrice(drinkSizeBox.getValue()));
    }

    /* ================= CHECKOUT ================= */

    @FXML
    private void goToCheckout() {
        ScreenSwitcher.switchTo("payment.fxml");
    }

    /* ================= CORE ORDER LOGIC ================= */

    private void addItem(String description, double price) {
        Order.addItem(new OrderItem(description, price));
        refreshView();
    }

    private void refreshView() {
        orderList.getItems().clear();

        for (OrderItem item : Order.getItems()) {
            orderList.getItems().add(item.toString());
        }

        totalLabel.setText(
                String.format("$%.2f", Order.getTotal())
        );
    }

    /* ================= HELPERS ================= */

    private String getSelectedSize() {
        return pizzaSizeBox.getValue() != null ? pizzaSizeBox.getValue() : "Medium";
    }

    private String getSelectedCrust() {
        return pizzaCrustBox.getValue() != null ? pizzaCrustBox.getValue() : "Regular";
    }

    private List<String> getSelectedToppings() {
        List<String> toppings = new ArrayList<>();
        if (pepperoniTopping.isSelected()) toppings.add("Pepperoni");
        if (sausageTopping.isSelected()) toppings.add("Sausage");
        if (mushroomTopping.isSelected()) toppings.add("Mushrooms");
        if (onionTopping.isSelected()) toppings.add("Onions");
        if (oliveTopping.isSelected()) toppings.add("Olives");
        if (pepperTopping.isSelected()) toppings.add("Green Peppers");
        return toppings;
    }

    private void clearToppings() {
        pepperoniTopping.setSelected(false);
        sausageTopping.setSelected(false);
        mushroomTopping.setSelected(false);
        onionTopping.setSelected(false);
        oliveTopping.setSelected(false);
        pepperTopping.setSelected(false);
    }

    private double pizzaPrice(String size) {
        return switch (size) {
            case "Small" -> 9.99;
            case "Large" -> 13.99;
            case "Super" -> 15.99;
            default -> 11.99;
        };
    }

    private double drinkPrice(String size) {
        return switch (size) {
            case "16 oz" -> 2.49;
            case "20 oz" -> 2.99;
            default -> 1.99;
        };
    }

    private void showAlert(String message) {
        Alert alert = new Alert(Alert.AlertType.WARNING);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }
}