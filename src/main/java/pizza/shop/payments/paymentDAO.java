package pizza.shop.payments;

import java.util.List;
import java.util.Optional;

public interface paymentDAO{
    int insert(Payment p);
    Optional<Payment> findbyId(int paymentId);
    List<Payment> findbyorderid(String orderId);
    double sumPaidForOrder(String orderIdl);
    int markSetteled(int paymentId);
    int markVoided(int paymentId);
}