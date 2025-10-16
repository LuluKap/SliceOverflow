CREATE database PizzaShop;
use PizzaShop;
  ArrayList<String> record = new ArrayList<>();
        Scanner input = new Scanner(System.in);
        String Address;
        String City;
        String State;
        String Zip;
        String Customer;
        while(true){
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
