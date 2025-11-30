package pizza.shop.queue;

import java.util.UUID;
import java.time.Instant;

public class Order{
    private final UUID id = UUID.randomUUID();
    private Status status = Status.QUEUED;
    private final Instant createdAt = Instant.now();
    private int customerId;

    public Order(){}

    public Order(int customerId){
        this.customerId = customerId;
    }

    public UUID getId(){
        return id;
    }

    public Status getStatus(){
        return status;
    }

    public Instant getCreatedAt(){
        return createdAt;
    }

    public int getCustomerId(){
        return customerId;
    }

    public void setCustomerId(int customerId){
        this.customerId = customerId;
    }

    public void markQueued(){
        this.status = Status.QUEUED;
    }

    public void markProcessing(){
        this.status = Status.PROCESSING;
    }

    public void markCompleted(){
        this.status = Status.COMPLETED;
    }

    public void markFailed(){
        this.status = Status.FAILED;
    }
}