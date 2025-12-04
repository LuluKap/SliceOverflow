use pizzashop;

-- employees --
insert into employees (username, first_name, last_name, email, phone, role, hire_date) values
('jcarter',  'Jordan', 'Carter',  'jcarter@shop.local',  '555-7001', 'manager', '2023-02-14'),
('mrojas',   'Maya',   'Rojas',   'mrojas@shop.local',   '555-7002', 'cashier', '2023-06-01'),
('tnguyen',  'Tracy',  'Nguyen',  'tnguyen@shop.local',  '555-7003', 'cashier', '2024-01-10'),
('lperez',   'Luis',   'Perez',   'lperez@shop.local',   '555-7004', 'cook',    '2022-11-05'),
('asanders', 'Ava',    'Sanders', 'asanders@shop.local', '555-7005', 'cook',    '2024-03-22'),
('kpatel',   'Kiran',  'Patel',   'kpatel@shop.local',   '555-7006', 'driver',  '2024-05-18'),
('bjackson', 'Bri',    'Jackson', 'bjackson@shop.local', '555-7007', 'driver',  '2024-08-09'),
('rmiles',   'Rae',    'Miles',   'rmiles@shop.local',   '555-7008', 'cashier', '2025-01-03')
on duplicate key update employee_id = employee_id;

-- customers --
insert into customers(name, phone, address, card_info) values
('John Doe',        '555-1234', '123 Main St',       'Visa 1234'),
('Jane Doe',        '555-5678', '456 Oak Ave',       'MC 5678'),
('Alice Johnson',   '555-1111', '789 Pine St',       'Visa 4321'),
('Bob Williams',    '555-2222', '321 Maple Ave',     'MC 8765'),
('Charlie Brown',   '555-3333', '987 Cedar Rd',      'Amex 2468'),
('Diana Prince',    '555-4444', '654 Birch Blvd',    'Disc 1357'),
('Ethan Hunt',      '555-5555', '159 Spruce Ln',     'Visa 9876'),
('Jordan Carter',   '555-6666', '901 Willow Way',    'Visa 1111'),
('Maya Rojas',      '555-7777', '202 Poplar Pl',     'MC 2222'),
('Tracy Nguyen',    '555-8888', '303 Hickory Ct',    'Visa 3333')
on duplicate key update customer_id = customer_id;

insert into orders (order_id, order_code, customer_id, status, total_amount) values
('', 1001, (SELECT customer_id FROM customers WHERE phone='555-1234'), 'queued',     25.99),
('', 1002, (SELECT customer_id FROM customers WHERE phone='555-5678'), 'processing', 38.99),
('', 1003, (SELECT customer_id FROM customers WHERE phone='555-1111'), 'completed',  19.99),
('', 1004, (SELECT customer_id FROM customers WHERE phone='555-2222'), 'completed',  45.99),
('', 1005, (SELECT customer_id FROM customers WHERE phone='555-3333'), 'queued',     12.99),
('', 1006, (SELECT customer_id FROM customers WHERE phone='555-4444'), 'processing', 28.99)
  on duplicate key update total_cents = values(total_cents), status = values(status);
  
insert into payments(
order_id, method, amount_cents, card_brand, card_last4, auth_code,status,received_by, employee_id) values
( (SELECT order_id FROM orders WHERE order_code=1002), 'card', 3899, 'Visa', '1111', 'AUTH1002', 'settled',  'Maya R',   (SELECT employee_id FROM employees WHERE username='mrojas') ),
  ( (SELECT order_id FROM orders WHERE order_code=1003), 'cash', 1999, NULL,   NULL,   NULL,       'settled',  'Tracy N',  (SELECT employee_id FROM employees WHERE username='tnguyen') ),
  ( (SELECT order_id FROM orders WHERE order_code=1004), 'card', 4599, 'MC',   '2222', 'AUTH1004', 'settled',  'Jordan C', (SELECT employee_id FROM employees WHERE username='jcarter') ),
  ( (SELECT order_id FROM orders WHERE order_code=1001), 'check',2599, NULL,   NULL,   NULL,       'pending',  'Rae M',    (SELECT employee_id FROM employees WHERE username='rmiles') ),
  ( (SELECT order_id FROM orders WHERE order_code=1005), 'card', 1299, 'Disc', '1357', 'AUTH1005', 'void',     'Maya R',   (SELECT employee_id FROM employees WHERE username='mrojas') ),
  ( (SELECT order_id FROM orders WHERE order_code=1006), 'card', 2899, 'Visa', '3333', 'AUTH1006', 'settled',  'Tracy N',  (SELECT employee_id FROM employees WHERE username='tnguyen') )
  on duplicate key update amount_cents = values(amount_cents), status = values(status);