CREATE DATABASE DENAGOXO;
go
USE DENAGOXO;
go

CREATE TABLE employees (
empno int,
name varchar(50),
age int,
contract date,
boss int,
type varchar(50),
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
city varchar(50),
region varchar(50),
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

CREATE TABLE human_resources (
empno int,
officeid int,
CONSTRAINT human_resources_pk
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

CREATE TABLE administration (
empno int,
officeid int,
class varchar(50),
CONSTRAINT administration_pk
PRIMARY KEY (empno)
);

CREATE TABLE clients (
clientno int,
name varchar(50),
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

CREATE TABLE meals (
mealid int DEFAULT NULL,
price int DEFAULT NULL,
name varchar(50) DEFAULT NULL,
CONSTRAINT meals_pk
PRIMARY KEY (mealid)
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

CREATE TABLE ingredients (
ingrid int DEFAULT NULL,
description varchar(50) DEFAULT NULL,
stock int DEFAULT NULL,
CONSTRAINT ingredients_pk
PRIMARY KEY (ingrid)
);

CREATE TABLE events (
eventid int DEFAULT NULL,
name varchar(50) DEFAULT NULL,
event_date date,
place varchar(50) DEFAULT NULL,
clientno int DEFAULT NULL
CONSTRAINT events_pk
PRIMARY KEY (eventid)
);

CREATE TABLE delivers (
deliverid int DEFAULT NULL,
deliver_date date DEFAULT NULL,
eventid int DEFAULT NULL,
empno int DEFAULT NULL,
done bit DEFAULT NULL,
CONSTRAINT delivers_pk
PRIMARY KEY (deliverid)
);

CREATE TABLE vehicles (
vehicleid int DEFAULT NULL,
name varchar(50) DEFAULT NULL,
plate varchar(50) UNIQUE,
CONSTRAINT vehicles_pk
PRIMARY KEY (vehicleid)
);

-- m:n section
CREATE TABLE form (
menuid int,
mealid int,
CONSTRAINT form_pk
PRIMARY KEY (menuid, mealid)
);

CREATE TABLE make (
ingrid int,
mealid int,
CONSTRAINT make_pk
PRIMARY KEY (ingrid, mealid)
);

CREATE TABLE serves (
empno int,
eventid int DEFAULT NULL,
serv_date date,
CONSTRAINT serve_pk
PRIMARY KEY (eventid, empno)
);

CREATE TABLE drive (
empno int,
vehicleid int DEFAULT NULL,
drive_date date
CONSTRAINT drive_pk
PRIMARY KEY (vehicleid, empno)
);

CREATE TABLE cooks (
empno int,
menuid int DEFAULT NULL,
menu_date date
CONSTRAINT cooks_pk
PRIMARY KEY (menuid, empno)
);

ALTER TABLE employees
ADD FOREIGN KEY (boss) REFERENCES employees(empno) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE payrolls
ADD FOREIGN KEY (empno) REFERENCES employees(empno) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE salesmen
ADD FOREIGN KEY (officeid) REFERENCES offices(officeid) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE it
ADD FOREIGN KEY (officeid) REFERENCES offices(officeid) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE human_resources
ADD FOREIGN KEY (officeid) REFERENCES offices(officeid) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE administration
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
