package pizza.shop.queue;

import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.LinkedBlockingQueue;

public class InMemoryOrderQueue implements OrderQueue {
    private final LinkedBlockingQueue<UUID> q = new LinkedBlockingQueue<>();
    private final ConcurrentHashMap<UUID, Order> store = new ConcurrentHashMap<>();

    @Override
    public void enqueue(Order o) {
        store.put(o.getId(), o);
        q.offer(o.getId());
    }

    @Override
    public Order peek() {
        UUID head = q.peek();
        return head == null ? null : store.get(head);
    }

    @Override
    public void ack(UUID id) {
        if (id == null) return;
        Order o = store.get(id);
        if (o != null) o.markCompleted();
        q.remove(id);
        store.remove(id);
    }

    @Override
    public void nack(UUID id) {
        if (id == null) return;
        q.remove(id);
        q.offer(id);
        Order o = store.get(id);
        if (o != null) o.markQueued();
    }

    @Override
    public int size() { return q.size(); }
}
