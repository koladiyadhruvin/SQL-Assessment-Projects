create database dataset;
use dataset;

create table city(
id int,
city_name varchar(55),
lati double,
longi double,
country_id int);

insert into city(id,city_name,lati,longi,country_id) values (1,"Berlin",52.520008,13.404954,1);
insert into city(id,city_name,lati,longi,country_id) values (2,"Belgrade",44.787197,20.457273,2);
insert into city(id,city_name,lati,longi,country_id) values (3,"Zagrab",45.815399,15.966568,3);
insert into city(id,city_name,lati,longi,country_id) values (4,"New York",40.730610,-73.935242,4);
insert into city(id,city_name,lati,longi,country_id) values (5,"Los Angeles",34.052235,-118.243683,4);
insert into city(id,city_name,lati,longi,country_id) values (6,"Warsaw",52.237049,21.017532,5);

select * from city;

create table customer(
id int,
customer_name varchar(55),
city_id int,
customer_address varchar(55),
next_call_date date,
ts_inserted datetime);

insert into customer(id,customer_name,city_id,customer_address,next_call_date,ts_inserted) values(1,'Jwelery Store',4,"Long Street 120",'2020-01-21','2020-01-09 14:01:20.000');
insert into customer(id,customer_name,city_id,customer_address,next_call_date,ts_inserted) values(2,'Bakery',1,"Kurfurstendamm 25",'2020-02-21','2020-01-09 17:52:15.000');
insert into customer(id,customer_name,city_id,customer_address,next_call_date,ts_inserted) values(3,'Cafe',1,"TauentzienstraBe 44",'2020-01-21','2020-01-10 08:02:49.000');
insert into customer(id,customer_name,city_id,customer_address,next_call_date,ts_inserted) values(4,'Restaurant',3,"Ulica Lipa 15",'2020-01-21','2020-01-10 09:20:21.000');

select * from customer;

create table country(
id int,
Country_name varchar(55),
Country_name_eng varchar(55),
country_code char(3));

insert into country(id,country_name,country_name_eng,country_code) values(1,"Deutschland","Germany","DEU");
insert into country(id,country_name,country_name_eng,country_code) values(2,"Sirbija","Serbia","SRB");
insert into country(id,country_name,country_name_eng,country_code) values(3,"Hrvatska","Croatia","HRV");
insert into country(id,country_name,country_name_eng,country_code) values(4,"United States Of America","United States Of America","USA");
insert into country(id,country_name,country_name_eng,country_code) values(5,"Polska","Poland","POL");
insert into country(id,country_name,country_name_eng,country_code) values(6,"Espana","Spain","ESP");
insert into country(id,country_name,country_name_eng,country_code) values(7,"Rossiya","Russia","RUS");

select * from country;

--- 01.List all Countries and customers related to these countries.For each country displaying its name in English, the name of the city customer is
--- located in as well as the name of the customer.Return even countries without related cities and customers
Select c.id,c.country_name,c.country_name_eng,c.country_code,s.customer_name,t.city_name
from country c left join customer s on c.id=s.city_id
left join city t on c.id=t.country_id;


--- 02.Return the list of all countries that have pairs(exclude countries which are not referenced by anycity). For such pairs return all customers.
--- Return even pairs of not having a single customer
Select c.id,c.country_name,c.country_name_eng,c.country_code,s.customer_name,t.city_name
from country c inner join customer s on c.id=s.city_id
left join city t on c.id=t.country_id;


