create database bank;
use bank;
create table branch(branchname varchar(30),branchcity varchar(30),assets real,primary key(branchname));
desc branch;

create table BankAccount(Accno int,branchname varchar(30),balance real,primary key(Accno),
foreign key(branchname) references branch(branchname));
desc BankAccount;

create table BankCustomer(CustomerName varchar(30),CustomerStreet varchar(30),Customercity varchar(30),
primary key (CustomerName));
desc BankCustomer;

create table Depositer(CustomerName varchar(30),Accno integer,primary key(CustomerName,Accno),
foreign key(CustomerName) references BankCustomer(CustomerName),
foreign key(Accno) references BankAccount(Accno));
desc Depositer;


create table Loan(loannumber int,branchname varchar(30),Amount real,primary key(loannumber),
foreign key(BranchName) references branch(branchname));
desc Loan;

insert into branch values('SBI_Chamrajpet','Bengaluru',50000);
insert into branch values('SBI_ResidencyRoad','Bengaluru',10000);
insert into branch values('SBI_ShivajiRoad','Bombay',20000);
insert into branch values('SBI_ParlimentRoad','Delhi',10000);
insert into branch values('SBI_Jantarmantar','Delhi',20000);
select *from branch;

insert into Loan values(1,'SBI_Chamrajpet',10000);
insert into Loan values(2,'SBI_ResidencyRoad',20000);
insert into Loan values(3,'SBI_ShivajiRoad',30000);
insert into Loan values(4,'SBI_ParlimentRoad',40000);
insert into Loan values(5,'SBI_Jantarmantar',30000);
select *from Loan;

insert into BankAccount values(1,'SBI_Chamrajpet',2000);
insert into BankAccount values(2,'SBI_ResidencyRoad',5000);
insert into BankAccount values(3,'SBI_ShivajiRoad',6000);
insert into BankAccount values(4,'SBI_ParlimentRoad',9000);
insert into BankAccount values(5,'SBI_Jantarmantar',8000);
insert into BankAccount values(6,'SBI_ShivajiRoad',4000);
insert into BankAccount values(8,'SBI_ResidencyRoad',4000);
insert into BankAccount values(9,'SBI_ParlimentRoad',3000);
insert into BankAccount values(10,'SBI_ResidencyRoad',5000);
insert into BankAccount values(11,'SBI_Jantarmantar',2000);
commit;
select * from BankAccount;

insert into BankCustomer values('Avinash','Bull_temple_Road','Bengaluru');
insert into BankCustomer values('Dinesh','Bannergatta_Road','Bengaluru');
insert into BankCustomer values('Mohan','NationalCollege_Road','Bengaluru');
insert into BankCustomer values('Nikil','Akbar_Road','Delhi');
insert into BankCustomer values('Ravi','Prithviraj_Road','Delhi');
select * from BankCustomer;

insert into Depositer values('Avinash',1);
insert into Depositer values('Dinesh',2);
insert into Depositer values('Nikil',4);
insert into Depositer values('Ravi',5);
insert into Depositer values('Avinash',8);
insert into Depositer values('Nikil',9);
insert into Depositer values('Dinesh',10);
insert into Depositer values('Nikil',11);
commit;
select * from Depositer;

SELECT c.CustomerName FROM BankCustomer c WHERE EXISTS(SELECT
d.CustomerName,COUNT(d.CustomerName) FROM Depositer d, BankAccount ba WHERE
d.accno=ba.accno AND c.CustomerName=d.CustomerName AND ba.branchname='SBI_ResidencyRoad' GROUP BY d.CustomerName HAVING COUNT(d.CustomerName)>=2);

/*Query 4*/
select distinct d.CustomerName from Depositer d where exists( select * from BankAccount ba where ba.Accno=d.Accno 
and exists (select * from branch b where b.branchname = ba.branchname and b.branchcity='Delhi'));
/*select d.CustomerName from depositer d,branch b, bankaccount a 
where b.branchname=a.branchname
AND a.accno=d.accno
and branchcity='Delhi'
group by d.CustomerName 
 HAVING COUNT(distinct b.branchname)=(
                SELECT COUNT(branchname)
                FROM branch
                WHERE branchcity='Delhi');*/
    
    /*Query 5*/
    delete from BankAccount
    where branchname IN(
    select branchname
	from Branch
    where branchcity='Bombay'
    );
