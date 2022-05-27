/*

Consider the following schema:
1.	Customer (cust_id, cust_name).
2.	Product (prod_code ,prod_name, unit_price)
3.	Customer_Order (order_code, order_date, cust_id)
4.	Order_Item (order_code, prod_code, num_of_units)

I.	Develop DDL of in SQL
II.	Add Column contact in Customer Table
III.	Add Column company_name in Product Table


*/
CREATE DATABASE Lab_1;
USE Lab_1;
/*I.	Develop DDL of in SQL*/
CREATE TABLE Customer
(
cust_id INT PRIMARY KEY, 
cust_name VARCHAR(30)
);
CREATE TABLE Product
(
prod_code INT PRIMARY KEY ,
prod_name VARCHAR(30),
 unit_price DECIMAL (18,2)
);
CREATE TABLE Customer_Order
(
order_code INT PRIMARY KEY,
 order_date DATE,
 cust_id INT,
 FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);
CREATE TABLE Order_Items
(
order_code INT,
 prod_code INT,
 num_of_units INT ,
  FOREIGN KEY (order_code) REFERENCES Customer_Order(order_code),
   FOREIGN KEY ( prod_code) REFERENCES Product( prod_code)
);
/*II.	Add Column contact in Customer Table*/
ALTER TABLE Customer ADD COLUMN contact INT;
/*III.	Add Column company_name in Product Table*/
ALTER TABLE Product ADD COLUMN company_name VARCHAR(30);

