create database EmployeePay_System;


create table Employee_pay(
id int identity(1,1) primary key,
name varchar(200) not null,
salary float,
startDate date,
Gender varchar(20),
)

--uc -3 inserting values to table
Insert into Employee_pay(name,salary,startDate) values
('Ram',22000,'2022-12-12'),
('Sham',25000,'2022-08-18'),
('Sagar',11000,'2021-05-13'),
('Vidhya',35000,'2021-08-19');

--uc-4 retrieving all data
select *from Employee_pay;
---uc-5 retrieving data from cast() anf Getdate()
select salary from Employee_pay where name='Ram';
select salary from Employee_pay where startDate BETWEEN Cast('2021-08-19' as Date) and GetDate();



--uc-6 add column gender and upadate values
Alter table Employee_pay
add Gender char(1);

Update Employee_pay set Gender='M' where name='Ram';
Update Employee_pay set Gender='F' where name ='Sham' or name='Sagar'or name='Vidhya';


--uc-7 Aggregate function anfd Gruop by gender
select Sum(salary) as "TotalSalary",Gender from Employee_pay group by Gender;
select Avg(salary) as "AverageSalary",Gender from Employee_pay group by Gender;
select Min(salary) as "MinimumSalary",Gender from Employee_pay group by Gender;
select Max(salary) as "MaximumSalary",Gender from Employee_pay group by Gender;
select count(salary) as "CountSalary",Gender from Employee_pay group by Gender;


------- UC 8: Add column department,PhoneNumber and Address -------
Alter table Employee_payroll
add EmployeePhoneNumber BigInt,EmployeeDepartment varchar(200) not null default 'Publish',Address varchar(200) default 'Not Provided';

select *from Employee_pay;

Update Employee_pay
set EmployeePhoneNumber='9731390823',EmployeeDepartment='Devloper',Address='Bhid , Maharashtra'
where name='Ram';

Update Employee_pay
set EmployeePhoneNumber='9740049061',Address='kolkata'
where name ='suresh';



Update Employee_pay 
set EmployeePhoneNumber='9731390823',EmployeeDepartment='Co-Devloper',Address='Bangalore,Karnataka'
where name='Sham';


----UC 9:  Salary to Basic Pay and Add Deduction,Taxable pay, Income Tax , Netpay --
Alter table Employee_pay
add Deduction float,TaxablePay float, IncomeTax float,NetPay float;

select *from Employee_pay;

Update Employee_pay set Deduction=1000 where Gender='F';

Update Employee_pay set Deduction=1000 where Gender='M';

Alter table Employee_pay add basicpay float;
Update Employee_pay set basicpay=5000 where Gender='M';
Update Employee_pay set basicpay=8000 where Gender='F';

update Employee_pay set NetPay=(basicPay - Deduction)
update Employee_pay set TaxablePay=0, IncomeTax=0
select * from Employee_pay;

----- UC 10: Adding another Value for Terissa in Sales&Marketing Department -----
Insert into Employee_pay(name,basicPay,StartDate,Address,EmployeePhoneNumber,EmployeeDepartment) values ('Terissa',250000,'2021-02-20','Pune','9845798856','Salaes&Mkt');
select * from Employee_pay;

