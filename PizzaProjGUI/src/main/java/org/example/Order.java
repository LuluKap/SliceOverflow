package org.example;

import java.util.ArrayList;
import java.util.List;

public class Order {
    private static final List<OrderItem> items = new ArrayList<>();

    public static void addItem(OrderItem item) {
        items.add(item);
    }

    public static List<OrderItem> getItems() {
        return items;
    }

    public static double getTotal() {
        return items.stream().mapToDouble(OrderItem::getPrice).sum();
    }

    public static void clear() {
        items.clear();
    }
}
