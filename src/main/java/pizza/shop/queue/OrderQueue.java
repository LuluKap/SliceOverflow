package pizza.shop.queue;

import java.util.UUID;

public interface OrderQueue {
    void enqueue(Order o);
    Order peek();
    void ack(UUID id);
    void nack(UUID id);
    int size();
}
