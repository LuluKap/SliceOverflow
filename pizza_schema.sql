CREATE database PizzaShop;
use PizzaShop;
   ArrayList<String> record = new ArrayList<>();
        Scanner input = new Scanner(System.in);
        String Address;
        String City;
        String State;
        String Zip;
        String Customer;
        while (true) {
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
                System.out.println("9: Done with order, go to cart");
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
                        System.out.println("Totaal balane $" + checkout);
                        break;
                }
                if( choice == 9){
                    break;
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


