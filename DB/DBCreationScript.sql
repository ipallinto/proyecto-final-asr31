CREATE TABLE employees (
empno number,
name varchar2(50),
age number,
contract date,
office number,
boss number,
type varchar2(20),
CONSTRAINT employees_pk
PRIMARY KEY (empno)
);

CREATE TABLE payrolls (
payno number,
start_date date,
end_date date,
amount float,
empno number,
CONSTRAINT payrolls_pk
PRIMARY KEY (payno)
);

CREATE TABLE offices (
officeid number,
city varchar2(50),
region varchar2(50),
sales number,
office_boss number,
CONSTRAINT offices_pk
PRIMARY KEY (officeid)
);

-- SubCategories

CREATE TABLE salesmen (
empno number,
quota number,
dep_boss number,
officeid number,
CONSTRAINT salesmen_pk
PRIMARY KEY (empno)
);

CREATE TABLE human_resources (
empno number,
dep_boss number,
officeid number,
CONSTRAINT human_resources_pk
PRIMARY KEY (empno)
);

CREATE TABLE waiters (
empno number,
dep_boss number,
CONSTRAINT waiters_pk
PRIMARY KEY (empno)
);

CREATE TABLE chefs (
empno number,
dep_boss number,
CONSTRAINT chefs_pk
PRIMARY KEY (empno)
);

CREATE TABLE deliverers (
empno number,
dep_boss number,
CONSTRAINT deliverers_pk
PRIMARY KEY (empno)
);

CREATE TABLE it (
empno number,
dep_boss number,
officeid number,
CONSTRAINT it_pk
PRIMARY KEY (empno)
);

CREATE TABLE administration (
empno number,
dep_boss number,
officeid number,
class varchar2(20),
CONSTRAINT administration_pk
PRIMARY KEY (empno)
);

CREATE TABLE clients (
clientno number,
name varchar2(50),
CONSTRAINT clientno_pk
PRIMARY KEY (clientno)
);

-- Object Related

CREATE TABLE orders (
orderno number DEFAULT NULL,
orderdate date DEFAULT NULL,
price number DEFAULT NULL,
clientno number DEFAULT NULL,
empno number DEFAULT NULL,
sent boolean DEFAULT NULL,
deliverid number DEFAULT NULL,
CONSTRAINT orders_pk
PRIMARY KEY (orderno)
);

CREATE TABLE menus (
menuid number DEFAULT NULL,
price number DEFAULT NULL,
clientno number DEFAULT NULL,
empno number DEFAULT NULL,
CONSTRAINT orders_pk
PRIMARY KEY (menuid)
);

CREATE TABLE meals (
mealid number DEFAULT NULL,
price number DEFAULT NULL,
name varchar2(50) DEFAULT NULL,
quantity number DEFAULT NULL,
CONSTRAINT meals_pk
PRIMARY KEY (mealid)
);

CREATE TABLE ingredients (
ingrid number DEFAULT NULL,
description varchar2(50) DEFAULT NULL,
stock number DEFAULT NULL,
CONSTRAINT ingredients_pk
PRIMARY KEY (ingrid)
);

CREATE TABLE events (
eventid number DEFAULT NULL,
name varchar2(50) DEFAULT NULL,
event_date date,
place varchar2(50) DEFAULT NULL,
clientno number DEFAULT NULL
CONSTRAINT events_pk
PRIMARY KEY (eventid)
);

CREATE TABLE delivers (
deliverid number DEFAULT NULL,
deliverdate date DEFAULT NULL,
eventid number DEFAULT NULL,
empno number DEFAULT NULL,
done boolean DEFAULT NULL,
CONSTRAINT delivers_pk
PRIMARY KEY (deliverid)
);

CREATE TABLE vehicles (
vehicleid number DEFAULT NULL,
name varchar2(50) DEFAULT NULL,
plate varchar2(50) DEFAULT NULL,
CONSTRAINT vehicles_pk
PRIMARY KEY (vehicleid)
);

-- m:n section

CREATE TABLE type (); -- There can't be employees with more than one type 

CREATE TABLE class (); -- Employees can't be 

CREATE TABLE serves (
empno number,
eventid number DEFAULT NULL,
services VARCHAR2(255)
);

CREATE TABLE drive (
empno number,
vehicleid number DEFAULT NULL,
drive_date date
);

CREATE TABLE cooks (
empno number,
menuid number DEFAULT NULL,
menu_date date
);
