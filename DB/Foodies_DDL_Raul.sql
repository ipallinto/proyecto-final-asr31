CREATE DATABASE foodies_group17;
go
USE foodies_group17;
go

CREATE TABLE employees (
empno int,
name varchar(40),
age int,
contract date,
boss int,
type varchar(40),
CONSTRAINT employees_pk
PRIMARY KEY (empno)
);

CREATE TABLE payrolls (
payno int,
start_date date,
end_date date,
amount float,
empno int,
CONSTRAINT payrolls_pk
PRIMARY KEY (payno)
);

CREATE TABLE offices (
officeid int,
city varchar(40),
region varchar(40),
sales int,
office_boss int,
CONSTRAINT offices_pk
PRIMARY KEY (officeid)
);

-- SubCategories

CREATE TABLE salesmen (
empno int,
quota int,
officeid int,
CONSTRAINT salesmen_pk
PRIMARY KEY (empno)
);


CREATE TABLE waiters (
empno int,
CONSTRAINT waiters_pk
PRIMARY KEY (empno)
);

CREATE TABLE chefs (
empno int,
CONSTRAINT chefs_pk
PRIMARY KEY (empno)
);

CREATE TABLE deliverers (
empno int,
CONSTRAINT deliverers_pk
PRIMARY KEY (empno)
);

CREATE TABLE it (
empno int,
officeid int,
CONSTRAINT it_pk
PRIMARY KEY (empno)
);


CREATE TABLE clients (
clientno int,
name varchar(40),
CONSTRAINT clientno_pk
PRIMARY KEY (clientno)
);

-- Object Related

CREATE TABLE orders (
orderid int DEFAULT NULL,
orderdate date DEFAULT NULL,
price int DEFAULT NULL,
clientno int DEFAULT NULL,
empno int DEFAULT NULL,
sent bit DEFAULT NULL,
deliverid int DEFAULT NULL,
CONSTRAINT orders_pk
PRIMARY KEY (orderid)
);

CREATE TABLE menus (
menuid int DEFAULT NULL,
price int DEFAULT NULL,
empno int DEFAULT NULL,
orderid int DEFAULT NULL,
CONSTRAINT menus_pk
PRIMARY KEY (menuid, orderid)
);

CREATE TABLE repairs (
repairid int DEFAULT NULL,
repair_date date DEFAULT NULL,
description varchar(50) DEFAULT NULL,
empno int,
done bit,
CONSTRAINT repairs_pk
PRIMARY KEY (repairid)
);


CREATE TABLE delivers (
deliverid int DEFAULT NULL,
deliver_date date DEFAULT NULL,
orderid int DEFAULT NULL,
empno int DEFAULT NULL,
done bit DEFAULT NULL,
CONSTRAINT delivers_pk
PRIMARY KEY (deliverid)
);

-- m:n section
CREATE TABLE serves (
empno int,
orderid int DEFAULT NULL,
serv_date date,
CONSTRAINT serve_pk
PRIMARY KEY (orderid, empno)
);

CREATE TABLE cooks (
empno int,
menuid int DEFAULT NULL,
orderid int DEFAULT NULL,
cook_date date,
CONSTRAINT cooks_pk
PRIMARY KEY (menuid, orderid, empno)
);

ALTER TABLE employees
ADD FOREIGN KEY (boss) REFERENCES employees(empno) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE payrolls
ADD FOREIGN KEY (empno) REFERENCES employees(empno) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE salesmen
ADD FOREIGN KEY (officeid) REFERENCES offices(officeid) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE it
ADD FOREIGN KEY (officeid) REFERENCES offices(officeid) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE orders
ADD FOREIGN KEY (empno) REFERENCES salesmen(empno) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE orders
ADD FOREIGN KEY (clientno) REFERENCES clients(clientno) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE delivers
ADD FOREIGN KEY (empno) REFERENCES deliverers(empno) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE delivers
ADD FOREIGN KEY (orderid) REFERENCES orders(orderid) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE repairs
ADD FOREIGN KEY (empno) REFERENCES it(empno) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE menus
ADD FOREIGN KEY (orderid) REFERENCES orders(orderid) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE serves
ADD FOREIGN KEY (empno) REFERENCES waiters(empno) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE serves
ADD FOREIGN KEY (orderid) REFERENCES orders(orderid) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE cooks
ADD FOREIGN KEY (empno) REFERENCES chefs(empno) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE cooks
ADD FOREIGN KEY (menuid, orderid) REFERENCES menus(menuid, orderid) ON DELETE NO ACTION ON UPDATE CASCADE;
