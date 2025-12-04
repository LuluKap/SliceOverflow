use pizzashop;

create table if not exists customers(
customer_id int auto_increment primary key,
name varchar(80) Not null,
phone varchar(20),
address varchar(120),
card_on_file varchar(40));

create table if not exists orders(
order_id char(36) primary key,
customer_id int NOT null,
status enum('queued','processing','completed','failed') NOT null,
total_cents int NOT null,
created_at timestamp NOT null default current_timestamp,
constraint fk_orders_customer
foreign key (customer_id) references customers(customer_id)
on delete cascade);

create table if NOT exists payments(
payment_id int auto_increment primary key,
order_id char(36) NOT null,
method enum('cash','card','check') NOT null,
amount_cents int NOT null,
card_brand varchar(20) null,
card_last4 char(4) null,
auth_code varchar(32) null,
status enum('pending','settled','void') NOT null default 'settled',
recieved_at timestamp NOT null default current_timestamp,
recieved_by varchar(40) null,
constraint fk_payments_order
foreign key (order_id) references orders(order_id)
on delete cascade);