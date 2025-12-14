package org.example;

import javafx.fxml.FXML;
import javafx.scene.control.TextField;

public class SignUpController {

    @FXML
    private TextField nameField;

    public void goHome() {
        ScreenSwitcher.switchTo("homescreen.fxml");
    }

    public void goToLogin() {
        ScreenSwitcher.switchTo("login.fxml");
    }

    public void createAccount() {
        String name = nameField.getText();

        if (name != null && !name.isBlank()) {
            Session.login(name);
        }

        ScreenSwitcher.switchTo("homescreen.fxml");
    }
}
