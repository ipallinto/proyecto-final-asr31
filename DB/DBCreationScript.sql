CREATE TABLE employees (
empno int,
name varchar,
age int,
contract date,
office int,
boss int,
type varchar,
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
city varchar,
region varchar,
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
class varchar,
CONSTRAINT administration_pk
PRIMARY KEY (empno)
);

CREATE TABLE clients (
clientno int,
name varchar,
CONSTRAINT clientno_pk
PRIMARY KEY (clientno)
);

-- Object Related

CREATE TABLE orders (
orderno int DEFAULT NULL,
orderdate date DEFAULT NULL,
price int DEFAULT NULL,
clientno int DEFAULT NULL,
empno int DEFAULT NULL,
sent bit DEFAULT NULL,
deliverid int DEFAULT NULL,
CONSTRAINT orders_pk
PRIMARY KEY (orderno)
);

CREATE TABLE menus (
menuid int DEFAULT NULL,
price int DEFAULT NULL,
empno int DEFAULT NULL,
orderid int DEFAULT NULL,
CONSTRAINT orders_pk
PRIMARY KEY (menuid, orderid)
);

CREATE TABLE meals (
mealid int DEFAULT NULL,
price int DEFAULT NULL,
name varchar DEFAULT NULL,
CONSTRAINT meals_pk
PRIMARY KEY (mealid)
);

CREATE TABLE repairs (
repairid int DEFAULT NULL,
repair_date date DEFAULT NULL,
description varchar DEFAULT NULL,
empno int,
done bit,
CONSTRAINT repairs_pk
PRIMARY KEY (repairid)
);

CREATE TABLE ingredients (
ingrid int DEFAULT NULL,
description varchar DEFAULT NULL,
stock int DEFAULT NULL,
CONSTRAINT ingredients_pk
PRIMARY KEY (ingrid)
);

CREATE TABLE events (
eventid int DEFAULT NULL,
name varchar DEFAULT NULL,
event_date date,
place varchar DEFAULT NULL,
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
name varchar DEFAULT NULL,
plate varchar UNIQUE,
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
services varchar,
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
