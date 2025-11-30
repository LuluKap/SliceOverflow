CREATE database PizzaShop;
use PizzaShop;
   
            ArrayList<String> record = new ArrayList<>();
            Scanner input = new Scanner(System.in);
            String Address;
            String City;
            String State;
            String Zip;
            String Customer;
            int size = 0;
            int cost = 0;
            int topping = 0;
            String username = null;
            String password = null;
            while (true) {
                System.out.println("press enter to login. Press space to create account.");
                String press = input.nextLine();
                if(press.equals(" ")) {
                    System.out.println("welcomr");
                }
                else if(press.isEmpty()) {
                    Login login = new Login(username, password);
                    login.username(username);
                    login.password(password);
                }
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
                    System.out.println("10: Done with order, go to cart");
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
                        Custom custom = new Custom(0,0,topping,cost);
                        custom.GetSize(size,cost);
                        custom.GetCrust(size,cost);
                        custom.toppings(topping, cost);
                        System.out.println(custom.Getcsst());



                            break;

                        case 10:
                            System.out.println("Totaal balane $" + checkout);
                            break;
                    }
                    if (choice == 11) {
                        break;
                    }
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
        System.out.println("1:Large - $6.99");
        System.out.println("2: Medium - $5.50");
        System.out.println("3:Personal pan - $5.30");
        size = input.nextInt();
        if (size == 1) {
            cost = 6.99;

        } else if (size == 2) {
            cost = 5.50;
        } else {
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
            System.out.println("8:   Done");
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
                break;
            }
            Setcost(cost);
            Getcsst();
            }

            }

        }


import java.util.Scanner;
public class Login {
    Scanner input = new Scanner(System.in);
    private String username;
    private String password;


    public Login(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public void username(String username) {
        System.out.println("Enter username");
        username = input.next();

    }

    public void password(String password) {
        System.out.println("Enter password");
        password = input.next();
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



