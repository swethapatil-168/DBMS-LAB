create database insurance;
use insurance;
create table person(driver_id varchar(5),name varchar(10),address varchar(20),primary key (driver_id));
desc person;
create table car(reg_num varchar(10),model varchar(10),year int,primary key(reg_num));
desc car;
create table accident(report_num int,accident_date date,location varchar(20),primary key(report_num));
desc accident;

create table owns(driver_id varchar(10),reg_num varchar(10),
primary key(driver_id,reg_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num));
desc owns;

create table participated(driver_id varchar(10), reg_num varchar(10),
report_num int, damage_amount int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num));
desc participated;

insert into person values('A01','Richard','Srinivas Nagar');
insert into person values('A02','Pradeep','Rajajinagar');
insert into person values('A03','Smith','Ashoknagar');
insert into person values('A04','Venu','N.R.Colony');
insert into person values('A05','John','Hanumanth Naga');
commit;
select * from person;

insert into car values('KA031181','Lancer',1957);
insert into car values('KA041702','Audi',2005);
insert into car values('KA052250','Indica',1990);
insert into car values('KA053408','Honda',2008);
insert into car values('KA095477','Toyota',1998);
commit;
select * from car;

insert into accident values(11,'2003-01-01','Mysore Road');
insert into accident values(12,'2004-02-02','Southend Circle');
insert into accident values(13,'2003-01-21','Bulltemple Road');
insert into accident values(14,'2008-02-17','Mysore Road');
insert into accident values(15,'2005-03-04','Kanakpura Road');
commit;
select * from accident;

insert into owns values('A01','KA031181');
insert into owns values('A02','KA041702');
insert into owns values('A03','KA052250');
insert into owns values('A04','KA053408');
insert into owns values('A05','KA095477');
commit;
select * from owns;

insert into participated values('A01','KA031181',11,10000);
insert into participated values('A02','KA041702',12,50000);
insert into participated values('A03','KA052250',13,25000);
insert into participated values('A04','KA053408',14,3000);
insert into participated values('A05','KA095477',15,5000);
commit;
select * from participated;

update participated set damage_amount=25000 where report_num=12;
insert into accident values(16,'2009-04-03','Kanakpura Road');
select * from accident;

select count(*) from accident where year(accident_date)=2008;

select count(report_num) CNT from car c,participated p where c.reg_num=p.reg_num and model='Lancer';
                


