package org.example;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;

 //Controller for the home screen

public class HomeController {

    // ================= FXML-INJECTED CONTROLS =================

    @FXML
    private Button logInButton;

    @FXML
    private Label orderTotalLabel;

    @FXML
    private Button orderNowButton;

    @FXML
    private Button menuButton;

    // ================= STATE =================

    private double currentOrderTotal = 0.00;

    // ================= INITIALIZATION =================

     // Called automatically by JavaFX after the FXML is loaded.

    @FXML
    private void initialize() {
        updateOrderTotalLabel();
        updateSignInState();
    }

    private void updateSignInState() {
        if (Session.isLoggedIn()) {
            logInButton.setText(Session.getName());
            logInButton.setDisable(true);
        }
        else {
            logInButton.setText("Sign In");
            logInButton.setDisable(false);
        }
    }


    // ================= UI UPDATE METHODS =================

    //Updates the order total label in the top navigation bar
    private void updateOrderTotalLabel() {
        orderTotalLabel.setText(String.format("$%.2f", currentOrderTotal));
    }

    //Allows other screens/controllers to update the order total

    public void setCurrentOrderTotal(double total) {
        this.currentOrderTotal = total;
        updateOrderTotalLabel();
    }

    // ================= EVENT HANDLERS =================

    private void handleOrderNow() {
        System.out.println("Order Now clicked");
    }

    public void goToMenu() {
        ScreenSwitcher.switchTo("menu.fxml");
    }

    public void goToLogIn() {
        ScreenSwitcher.switchTo("login.fxml");
    }

    public void goToOrder() {
        ScreenSwitcher.switchTo("order.fxml");
    }
}

