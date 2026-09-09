/* Question 1*/
create database inventoryDB;
use inventoryDB;

/* Question 2*/
create table items (
itemID int primary key,
itemName varchar(15),
category varchar(20),
price int,
stockQuantity int 
); 


/* Question 3*/
insert into items values 
(001, 'Desk', 'Furniture', 300.00, 20),
(002, 'Chair', 'Furniture', 150.00, 50), 
(003, 'Notebook', 'Stationery', 10.00, 100),
(004, 'Pen', 'Stationery', 2.00, 200),
(005, 'Monitor', 'Electronics', 250.00, 30);

/* Question 4 */
create table customers(
customerID int primary key,
firstName varchar(15),
lastName varchar(15),
email varchar(25),
phone varchar(15)
);

/* Question 5 */
insert into customers values
(101, 'Mandla', 'Xaba', 'mandla.xaba@gmail.com ', '081-456-7890'),
(102, 'Mlondi', 'Nzama', 'mlondi.nzama@gmail.com', '073-567-8901'),
(103, 'Noluthando', 'Ncube', 'nolu.ncube@gmail.com', '068-678-9012');

/* Question 6*/
create table orders (
orderID int primary key,
customerID int foreign key references customers(customerID),
orderDate varchar(10),
totalAmount int 
);

/* Question 7 */
insert into orders values 
(001, 101, '2024-07-01', 600.00),
(002, 102, '2024-07-02', 300.00),
(003, 103, '2024-07-03', 150.00);

/* Question 8 */
create table orderItems (
orderitemID int primary key,
orderID int foreign key references orders(orderID),
itemID int foreign key references items(itemID),
quantity int,
lineTotal int 
);

/* Question 9*/
insert into orderItems values
(001, 001, 001, 2, 600.00),
(002, 001, 003, 5, 50.00),
(003, 002, 002, 2, 300.00),
(004, 003, 004, 10, 20.00);

select * from items;
select * from customers;
select * from orders;
select * from orderItems;


/* Question 10*/
select * from orders;

/* Question 11 */
update items 
set price = price * 1.10 
where category in ( select category from items 
                    where category = 'furniture');

/* Question 12 */
select sum(stockQuantity) as totalquantity ,
       sum(price * stockQuantity) as totalrevenue
from items
group by itemID; 

/* Question 13 */
create procedure totalsalesamount 
as
begin
select sum(price * stockquantity) as totalsalesamount,
       itemName
from   items
group by itemName
end; 

exec totalsalesamount; 

/* Question 14 */
create procedure totalamoutnspent
as
begin
select 
       customerID
       sum(totalAmount) as 
       totalamountspent,
from   orders
group by customerID
end; 

exec totalamoutnspent;

/* Question 15 */
select 
       c.customerID, 
       oi.orderID,
       o.totalAmount
from   customers c
join orders o 
    on oi.customerID = c.customerID
join orderItems oi
    on oi.orderID = o.orderID; 





















