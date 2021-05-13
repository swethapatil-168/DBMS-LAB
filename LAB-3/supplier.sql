create database supplier;
use supplier;

create table SUPPLIERS(sid varchar(5) primary key, sname varchar(20), city varchar(20));
desc SUPPLIERS;

create table PARTS(pid varchar(5) primary key, pname varchar(20), color varchar(10));
desc PARTS;

create table CATALOG(sid varchar(5), pid varchar(5),  foreign key(sid) references SUPPLIERS(sid), foreign key(pid) references PARTS(pid), cost float(6), primary key(sid, pid));
desc CATALOG;

insert into suppliers values(10001, 'Acme Widget','Bengaluru');
insert into suppliers values(10002,'Johns','Kolkata');
insert into suppliers values(10003, 'Vimal','Mumbai');
insert into suppliers values(10004, 'Reliance','Delhi');
insert into suppliers values(10005, 'Mahindra','Mumbai');
select * from SUPPLIERS;

insert into PARTS values(20001, 'Book','Red');
insert into PARTS values(20002, 'Pen','Red');
insert into PARTS values(20003, 'Pencil','Green');
insert into PARTS values(20004, 'Mobile','Green');
insert into PARTS values(20005, 'Charger','Black');
select * from PARTS;

insert into CATALOG values(10001, '20001','10');
insert into CATALOG values(10001, '20002','10');
insert into CATALOG values(10001, '20003','30');
insert into CATALOG values(10001, '20004','10');
insert into CATALOG values(10001, '20005','10');
select * from CATALOG;

SELECT DISTINCT P.pname
 FROM Parts P, Catalog C
 WHERE P.pid = C.pid;
