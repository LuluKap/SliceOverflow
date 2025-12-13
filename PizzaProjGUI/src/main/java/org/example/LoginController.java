package org.example;

import javafx.fxml.FXML;
import javafx.scene.control.TextField;

public class LoginController {

    @FXML
    private TextField emailField;

    public void goHome() {
        ScreenSwitcher.switchTo("homescreen.fxml");
    }

    public void goToSignUp() {
        ScreenSwitcher.switchTo("signup.fxml");
    }

    public void logIn() {
        //fake login name
        Session.login("User");

        ScreenSwitcher.switchTo("homescreen.fxml");
    }
}
