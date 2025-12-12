CREATE database PizzaShop;
use PizzaShop;
   
 import java.util.Scanner;
import java.util.ArrayList;
public class Order {
    public static void main(String[] args) {
        ArrayList<String> record = new ArrayList<>();
        Scanner input = new Scanner(System.in);
        String Address;
        String City;
        String State;
        String Zip;
        String Customer;
        int size = 0;
        double cost = 0.00;
        int topping = 0;
        int side = 0;
        int drink = 0;
        double sum;
        String username = null;
        String password = null;
        Login login = new Login(username, password);
        while (true) {
            System.out.println("press enter to login. Press I to create account.");
            String press = input.nextLine();
            if (press.isEmpty()) {
                login.login(username, password);
            } else if (press.equalsIgnoreCase("I")) {
                CreateAccount create = new CreateAccount(username, password);
                create.login(username, password);
            }

            System.out.println("Welcome!");
            System.out.println("Let's start with your delivery order.");
            System.out.println(" ");
            System.out.println("Add customer name to the system.");
            Customer = input.nextLine();
            System.out.println("Adding " + Customer + " to list");
            System.out.println("What is your address?");
            Address = input.nextLine();
            System.out.println("Adding " + Address + " to list");
            System.out.println("What is your city?");
            City = input.nextLine();
            System.out.println("Adding " + City + " to list");
            System.out.println("What is your State code?");
            State = input.nextLine();
            System.out.println("Adding " + State + " to list");
            System.out.println("What is your Zipcode?");
            Zip = input.nextLine();

            System.out.println("Adding " + Zip + " to list");
            record.add(Customer + "\n" + Address + "," + City + "," + State + "," + Zip);
            System.out.println(record);
            break;
        }
        ArrayList<String> pizza = new ArrayList<>();
        double checkout = 0.00;
        int choice;
        while (true) {
            System.out.println("Choose from menu");
            System.out.println("1: Large pepperoni pizza - $15.98");
            System.out.println("2: Large meat-Lovers pizza - $19.99");
            System.out.println("3: Large veggie pizza - $19.99");
            System.out.println("4: Large buffalo chicken pizza - $19.99");
            System.out.println("5: Large cheese pizza - $13.79");
            System.out.println("6: Large Hawaiian chicken pizza - $19.99");
            System.out.println("7: Large Pesto Margherita pizza - $19.99");
            System.out.println("8: Large gluten free cheese pizza - $12.99");
            System.out.println("9: Customize your pizza!");
            System.out.println("10: Add some sides");
            System.out.println("11: Add drinks");
            System.out.println("12: Done with order, go to cart");
            choice = input.nextInt();
            input.nextLine();
            switch (choice) {
                case 1:
                    System.out.println("Large pepperoni pizza added to cart");
                    pizza.add("Large pepperoni");
                    checkout = checkout + 15.98;
                    break;
                case 2:
                    System.out.println("Large meat-Lovers pizza added to cart");
                    pizza.add("Large meat-Lovers");
                    checkout = checkout + 19.99;
                    break;
                case 3:
                    System.out.println("Large veggie pizza added to cart");
                    pizza.add("Large veggie");
                    checkout = checkout + 19.99;
                    break;
                case 4:
                    System.out.println("Large buffalo chicken pizza added to cart");
                    pizza.add("Large buffalo chicken");
                    checkout = checkout + 19.99;
                    break;
                case 5:
                    System.out.println("Large cheese pizza added to cart");
                    pizza.add("Large cheese");
                    checkout = checkout + 13.79;
                    break;

                case 6:
                    System.out.println("Large Hawaiian chicken pizza added to cart");
                    pizza.add("Large Hawaiian chicken");
                    checkout = checkout + 19.99;
                    break;
                case 7:
                    System.out.println("Large Pesto Margherita pizza added to cart");
                    pizza.add("Large Pesto Margherita");
                    checkout = checkout + 19.99;
                    break;
                case 8:
                    System.out.println("Large gluten free cheese pizza added to cart");
                    pizza.add("Large gluten free cheese");
                    checkout = checkout + 12.99;
                    break;
                case 9:
                    Custom custom = new Custom(0, 0, topping,cost);
                    custom.GetSize(size, cost);
                    custom.GetCrust(size, cost);
                    custom.toppings(topping, cost);
                    System.out.println(custom.Getcsst());
                    break;
                case 10:
                    Sides sides = new Sides(0, cost);
                    sides.side(side,cost);
                    System.out.println(sides.Getcost());
                    break;
                case 11:
                drinks drin = new drinks(drink,cost);
                drin.drink(drink,cost);
            }
            if (choice == 12) {
                System.out.println("Checkout: ");
                break;
            }
        }
    }
}
import java.util.ArrayList;
import java.util.Scanner;
public class Login {
    Scanner input = new Scanner(System.in);
    static ArrayList<String> Username = new ArrayList<>();
    static ArrayList<String> Password = new ArrayList<>();
    private String username;
    private String password;


    public Login(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public void login(String username,String password) {
        System.out.println("Enter username");
        username = input.next();
        System.out.println("Enter password");
        password = input.next();
        if (Username.isEmpty() || Password.isEmpty()) {
            Denie(username,password);
        } else if (username.equalsIgnoreCase("I")) {
            CreateAccount log = new CreateAccount(username,password);
            log.login(username,password);
        } else {
            String correctu = Username.get(Username.size() - 1);
            String correctp = Password.get(Password.size() - 1);
            if (!username.equalsIgnoreCase(correctu) || !password.equalsIgnoreCase(correctp) ) {
                Denie(username,password);
        }

        }
    }








    public void Denie(String username, String password) {
        System.out.println("Invalid username or password, press 'Q' to try again or press 'I' to create account");
        String hit = input.next();
        if(hit.equalsIgnoreCase("I")){
            CreateAccount account = new CreateAccount(username,password);
           account.login(username,password);
        } if(hit.equalsIgnoreCase("Q")){
            login(username,password);
        }

    }
           import java.util.Scanner;
public class drinks {
    Scanner input = new Scanner(System.in);
    private int drink;
    private double cost;
    public drinks(int drink, double cost){
        this.drink = drink;
        this.cost = cost;
    }
    void Setcost(double cost) {
        this.cost += cost;
    }

    double Getcsst() {
        return this.cost;
    }
    public void drink(int drinks, double cost) {
        while (true) {
            System.out.println("What drink would you like with your pizza?");
            System.out.println("1: Water - $1.00");
            System.out.println("2: Coca-cola - $1.38");
            System.out.println("3: Sprite - $1.38");
            System.out.println("4: Fanta - $1.38");
            System.out.println("5: Dr pepper - $1.38");
            System.out.println("6: Done");
            drinks = input.nextInt();
            if (drinks == 1) {
                cost = 1.00;
            } else {
                cost = 1.38;

            }
            if(drinks == 6){
                break;
            }
            Setcost(cost);
            Getcsst();


            System.out.println("Pick a size for your cup");
            System.out.println("1: small - $0.10");
            System.out.println("2: Medium - $0.48");
            System.out.println("3: Large - $1.00");
            int size = input.nextInt();
            if (size == 1) {
                cost = 0.10;
            } else if (size == 2) {
                cost = 0.48;
            }else {
                cost = 1.00;
            }
            Setcost(cost);
            Getcsst();
        }

        }
    }
import java.util.Scanner;

public class Custom {
    Scanner input = new Scanner(System.in);
    private int size;
    private int crust;
    private int toppings;


    private double cost;

    public Custom(int size, int crust, int toppings, double cost) {
        this.size = size;
        this.crust = crust;
        this.toppings = toppings;
        this.cost = cost;
    }

    void Setcost(double cost) {
        this.cost += cost;
    }

    double Getcsst() {
        return this.cost;
    }

    public void GetSize(int size, double cost) {
        System.out.println("What size pizza would you like?");
        System.out.println("1: Extra large - $9.99");
        System.out.println("2:Large - $6.99");
        System.out.println("3: Medium - $5.50");
        System.out.println("4:Personal pan - $5.30");
        size = input.nextInt();
        if (size == 1) {

            cost = 9.99;

        } else if (size == 2) {
            cost = 6.99;
        } else if (size == 3){
            cost = 5.50;
        } else if (size == 4){
            cost = 5.30;

        }
        Setcost(cost);
        Getcsst();


    }




    public void GetCrust(int crust, double cost) {
        System.out.println("What kind of crust do you want?");
        System.out.println("1: Thim and crispy - $2.50");
        System.out.println("2: Hand tossed  -  $3.00");
        System.out.println("3: Original pan  -  $3.75");
        System.out.println("4: Double stuffed  -  $4.50");

        crust = input.nextInt();
        if (crust == 1) {
            cost = 2.50;
        } else if (crust == 2) {
            cost = 3.00;
        } else if (crust == 3) {
            cost = 3.75;
        } else if (crust == 4) {
            cost = 4.50;
        }
        Setcost(cost);
        Getcsst();


    }

    public void toppings(int toppings, double cost) {
        while (true) {
            System.out.println("Choose toppings");
            System.out.println("1:   Extra cheese - $1.00");
            System.out.println("2:   Peperoni - $0.50");
            System.out.println("3:   Chicken - $1.50");
            System.out.println("4:   Onions - $0.25");
            System.out.println("5:   Olives - $0.50");
            System.out.println("6:   Pineapple - $3.50");
            System.out.println("7:   Mushrooms - $0.40");
            System.out.println("8:   Sausage - $0.75 ");
            System.out.println("10:   Done ");
            toppings = input.nextInt();
            if (toppings == 1) {
                cost = 1.00;
            } else if (toppings == 2) {
                cost = 0.50;
            } else if (toppings== 3) {
                cost = 1.50;
            } else if (toppings == 4) {
                cost = 0.25;
            }else if (toppings == 5) {
                cost = 0.50;
            } else if (toppings == 6) {
                cost = 3.50;
            } else if (toppings== 7) {
                cost = 0.40;
            } else if (toppings == 8) {
                    cost = 0.75;
            }
            else if (toppings == 10) {
                break;

        }
            Setcost(cost);
            Getcsst();
    }

}
}
import java.util.Scanner;
public class CreateAccount extends Login {

    public CreateAccount(String username, String password) {
        super(username, password);
    }

    @Override
    public void login(String username,String password) {
        System.out.println("Create username");
        username = input.nextLine();
        Username.add(username);
        System.out.println("Create password");
        password = input.nextLine();
        Password.add(password);
        Login log = new Login(username,password);
        log.login(username,password);
    }
}
   import java.util.Scanner;
public class Sides {
    Scanner input = new Scanner(System.in);
    private String sticks = "Cheese sticks";
    private String sixwings = "6 piece wings";
    private String tenwings = "10 piece wings";
    private int sides;
    private double cost;

    public Sides(int sides, double cost) {
        this.sides = sides;
        this.cost = cost;
    }

    void Setcost(double cost) {
        this.cost += cost;
    }

    double Getcost() {
        return this.cost;
    }

    public void side(int side, double cost) {
        while (true) {
            System.out.println("What sides would you like with your pizza?");
            System.out.println("1: 3 piece" + sticks + " - $2.99");
            System.out.println("2: 6 piece wings - $4.00");
            System.out.println("3: 10 piece wings- $6.30");
            side = input.nextInt();
            if (side == 1) {
                cost = 2.99;

            } else if (side == 2) {
                cost = 4.00;
            } else {
                cost = 6.30;

            }
            Setcost(cost);
            Getcost();
        }
    }
}

           


create table Customers (
customer_id int auto_increment primary key,
name varchar(100), 
phone varchar(15) UNIQUE,
address varchar(200),
card_info varchar(50)
);

insert into customers(name, phone, address, card_info)
values ('John Doe', '555-1234', '123 Main St', 'Visa 1234'),
('Jane Doe', '555-5678','456 Oak Ave', 'MasterCard 5678'),
('Alice Johnson', '555-1111', '789 Pine St', 'Visa 4321'),
('Bob Williams', '555-2222', '321 Maple Ave', 'MasterCard 8765'),
('Charlie Brown', '555-3333', '987 Cedar Rd', 'Amex 2468'),
('Diana Prince', '555-4444', '654 Birch Blvd', 'Discover 1357'),

('Ethan Hunt', '555-5555', '159 Spruce Ln', 'Visa 9876');




