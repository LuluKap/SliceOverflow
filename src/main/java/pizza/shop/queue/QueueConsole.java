package pizza.shop.queue;

import java.util.Scanner;
import java.util.UUID;

public class QueueConsole {
    private final OrderQueue q = new InMemoryOrderQueue();
    private final Scanner in = new Scanner(System.in);

    public static void main(String[] args){
        try {
            new QueueConsole().run();
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }
    private void run(){
        while(true){
                System.out.println("\n--- Order Queue Menu ---");
                System.out.println("1. Enqueue Order");
                System.out.println("2. Peek Order");
                System.out.println("3. Ack head (clear)");
                System.out.println("4. Nack head (requeue)");
                System.out.println("5. Size");
                System.out.println("6. Exit");
                System.out.println("Choose an option: ");
            String s = in.nextLine().trim();

            switch (s) {
                case "1":
                    Order o = new Order(123);
                    q.enqueue(o);
                    System.out.println("Enqueued " + o.getId() + " (status=" + o.getStatus() + ")");
                    break;

                case "2": 
                    Order head = q.peek();
                    System.out.println(head == null ? "Queue is empty." : "Head: " + head.getId() + " status=" + head.getStatus());
                    break;
                
                case "3":
                    Order h = q.peek();
                    if (h == null){
                        System.out.println("Queue is empty.");
                        break;
                    }
                    q.ack(h.getId());
                    System.out.println("ACKed " + h.getId());
                    break;

                case "4": 
                    Order hd = q.peek();
                    if (hd == null){
                        System.out.println("Queue empty.");
                        break;
                    }
                    q.nack(hd.getId());
                    System.out.println("NACKed (requeued) " + hd.getId());
                    break;

                case "5":
                    System.out.println("Queue size: = " + q.size());
                    break;

                case "6":
                    return;
        
                default:
                    System.out.println("Invalid.");
            }
        }
    }
}