package org.example;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class Main extends Application {

    @Override
    public void start(Stage primaryStage) throws Exception {
        ScreenSwitcher.setStage(primaryStage);

        FXMLLoader loader = new FXMLLoader(
                getClass().getResource("/example/view/homescreen.fxml")
        );

        Scene scene = new Scene(loader.load());
        primaryStage.setScene(scene);
        primaryStage.setTitle("Ultra Pizza");
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}