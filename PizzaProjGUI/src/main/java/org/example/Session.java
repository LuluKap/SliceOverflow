package org.example;

public class Session {
    private static boolean loggedIn = false;
    private static String name;

    public static void login(String n) {
        loggedIn = true;
        name = n;
    }

    public static void logout() {
        loggedIn = false;
        name = null;
    }

    public static boolean isLoggedIn() {
        return loggedIn;
    }

    public static String getName() {
        return name;
    }
}
