package org.example;


import java.util.Map;


public class MenuPrices {


    // Pizza base prices
    public static final Map<String, Double> PIZZA_SIZE_PRICE = Map.of(
            "small", 7.99,
            "medium", 9.99,
            "large", 11.99,
            "super", 13.99
    );

    // Toppings
    public static final double TOPPING_PRICE = 0.75;


    // Wings
    public static final double WINGS_6 = 11.99;
    public static final double WINGS_8 = 13.99;


    // Sides
    public static final Map<String, Double> SIDES = Map.of(
            "Breadsticks", 5.99,
            "Mozzarella Sticks", 5.99,
            "Pretzel Bites", 5.99,
            "Onion Rings", 4.99
    );


    // Drinks
    public static final Map<String, Double> DRINK_SIZE = Map.of(
            "12 oz", 1.99,
            "16 oz", 2.49,
            "20 oz", 2.99
    );
}
