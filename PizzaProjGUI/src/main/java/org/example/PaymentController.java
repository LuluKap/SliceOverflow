package org.example;

import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;

public class PaymentController {

    @FXML
    private ListView<String> orderList;

    @FXML
    private Label totalLabel;

    @FXML
    public void initialize() {
        for (OrderItem item : Order.getItems()) {
            orderList.getItems().add(item.toString());
        }

        totalLabel.setText(
                String.format("Total: $%.2f", Order.getTotal())
        );
    }

    @FXML
    private void goHome() {
        Order.clear();
        ScreenSwitcher.switchTo("homescreen.fxml");
    }
}