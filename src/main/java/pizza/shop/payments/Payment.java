package pizza.shop.payments;

import java.time.Instant;
import java.util.Objects;
import java.util.UUID;

public final class Payment {
    private Integer paymentId;
    private final UUID orderId;
    private PaymentMethod method;
    private final int amountCents;
    private String cardBrand;
    private String cardLast4;
    private String authCode;
    private PaymentStatus status;
    private final Instant receivedAt;
    private String receivedBy;

    public Payment(UUID orderId, PaymentMethod method, int amountCents){
        this.orderId = Objects.requireNonNull(orderId, "orderId");
        this.method = Objects.requireNonNull(method,"method");
        if (amountCents <= 0) {
            throw new IllegalArgumentException("amountCents must be positive");
        }
        this.amountCents = amountCents;
        this.status = PaymentStatus.PENDING;
        this.receivedAt = Instant.now();
        } 

    public Payment(UUID orderId, PaymentMethod method, int amountCents, String cardBrand, String cardLast4, String authCode){
        this(orderId, method, amountCents);
        this.cardBrand = cardBrand;
        this.cardLast4 = cardLast4;
        this.authCode = authCode;
    }

    public void markSettled() {
        this.status = PaymentStatus.SETTLED;
    }
    public void markVoid(){
        this.status = PaymentStatus.VOID;
    }
    public void setPaymentId(Integer paymentId){
        this.paymentId = paymentId;
    }
    public void setCardBrand(String cardBrand){
        this.cardBrand = cardBrand;
    }
    public void setCardLast4(String cardLast4){
        this.cardLast4 = cardLast4;
    }
    public void setAuthCode(String authCode){
        this.authCode = authCode;
    }
    public void setReceivedBy(String receivedBy){
        this.receivedBy = receivedBy;
    }

    public Integer getPaymentId(){
        return this.paymentId;
    }
    public UUID getOrderId(){
        return this.orderId;
    }
    public PaymentMethod getMethod(){
        return this.method;
    }
    public int getAmountCents(){
        return this.amountCents;
    }
    public String getCardBrand(){
        return this.cardBrand;
    }
    public String getCardLast4(){
        return this.cardLast4;
    }
    public String getAuthCode(){
        return this.authCode;
    }
    public PaymentStatus getStatus(){
        return this.status;
    }
    public Instant getReceivedAt(){
        return this.receivedAt;
    }
    public String getReceivedBy(){
        return this.receivedBy;
    }

    @Override public String toString(){
        return "Payment{ id= " + paymentId + ", orderId=" + orderId + ", method=" + method + ", amountCents=" + amountCents + ", status=" + status + ", receivedAt=" + receivedAt + "}";
    }
}

