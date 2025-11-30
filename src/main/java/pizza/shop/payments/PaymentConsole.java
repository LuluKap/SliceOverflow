package pizza.shop.payments;

import java.util.UUID;

public class PaymentConsole {
  public static void main(String[] args) {
    Payment p = new Payment(UUID.randomUUID(), PaymentMethod.CASH, 1299);
    System.out.println(p);
    p.markSettled();
    System.out.println("After settle: " + p.getStatus());
  }
}
