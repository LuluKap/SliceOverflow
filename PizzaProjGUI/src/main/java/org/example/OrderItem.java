package org.example;

public class OrderItem {
    private final String description;
    private final double price;


    public OrderItem(String description, double price) {
        this.description = description;
        this.price = price;
    }


    public double getPrice() {
        return price;
    }


    @Override
    public String toString() {
        return description + String.format(" $%.2f", price);
    }
}