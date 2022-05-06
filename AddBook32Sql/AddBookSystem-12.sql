
create database AddressBookSystem;

--uc-2 Creating table
create table AddreBook_Sys
(FirstName varchar(100),
LastName varchar(100),
Address varchar(250),
City varchar(100),
State varchar(100),
zip BigInt,
PhoneNumber BigInt,
Email varchar(200)
)

--UC-3 inserting values to the table
Insert into AddreBook_Sys(FirstName,LastName,Address,City,State,zip,PhoneNumber,Email) 
values('Ram','Shayam','Near Deopur Road','Dhule','Maharashtra',591304,9731390823,'76uyyti@gmail.com'),
('Jayesh','Kumar','Main Road','Aahalabad','UP',587311,9980431245,'jayesh88@gmail.com'),
('Hemu','Patel','Dhabha gali pawan House','Surat','Gujarat',587315,9740049061,'patelhemu@gmail.com');

select *from AddreBook_Sys;

--Uc-4 edititng contact using name
Update AddreBook_Sys set Email='Jayeshku77@gmail.com' where FirstName='Jayesh';

Update AddreBook_Sys
set Address='Main Road Rampur'
where FirstName='Hemu' and LastName='Patel';

--uc-5 delete person based on name
delete 
from AddreBook_Sys
where FirstName='Ram' and LastName='Shayam'

select *from AddreBook_Sys;

select * from AddreBook_Sys
where City='Surat' or State='Gujarat'


---uc-7  Retrieve Count of Person belonging to a City or State----
Insert into AddreBook_Sys(FirstName,LastName,Address,City,State,zip,PhoneNumber,Email) 
values('Bhavesh','More','shivaji circle Jamkhandi','GhandhiNagar','Gujarat',590006,9663424395,'sirsuba@gmail.com')
select Count(*),state,City from AddreBook_Sys Group by state,City

----uc-8 ability to sort by person name bycity---
select *from AddreBook_Sys where City='Ghandhinagar' order by FirstName,LastName;

---uc-9 Adding Address Book With Name and Type-----
alter table AddreBook_Sys
add AddressBookName varchar(100),
Type varchar(100)


--update vaalues for craeted book name and type column---
update AddreBook_Sys
set AddressBookName='PuneetFans',Type='Fan_group'
where FirstName='Ram' or FirstName='Shyam'

--update vaalues for craeted book name and type column---
update AddreBook_Sys
set AddressBookName='havinals',Type='Family'
where FirstName='sirsu'

--update vaalues for craeted book name and type column---
update AddreBook_Sys
set AddressBookName='shetes',Type='Dears'
where FirstName='gouri'

select *from AddreBook_Sys;

----uc-10 get get number of contact based on count by type-----
select Count(*) as NumberOfContacts,Type
from AddreBook_Sys
Group by Type

select type,count(*)
from AddreBook_Sys
group by type;


---uc-11 add Prerson NAme both family anf Profession
Insert into AddreBook_Sys(FirstName,LastName,Address,City,State,zip,PhoneNumber,Email) 
values('Appu','Havinal','Near Satti Road','Athani','Karnataka',591304,9731390823,'somusp75@gmail.com'),
('Suresh','Koparde','Main Road','Banahatti','Karnataka',587311,9980431245,'chetu65@gmail.com');

update AddreBook_Sys
set AddressBookName='Mom',Type='Family'
where FirstName='Suresh'

update AddreBook_Sys
set AddressBookName='MD',Type='Profession'
where FirstName='Appu'

----adding Family---
select * from AddreBook_Sys;
insert into AddreBook_Sys
values ('Santosh','poojari','sasalatti','Teradal','UP',591304,9876543210,'SAntosh@gmail','Mom','Family');
--Addding to Profession
select * from AddreBook_Sys;
insert into AddreBook_Sys
values ('Santosh','poojari','sasalatti','Teradal','UP',591304,9876543210,'SAntosh@gmail','MD','Profession');

--uc-12-Creating different entities 
--creating table typeofcontacts
create table TypesOfContacts
(
typeid int primary key ,
typename varchar(50) not null);
--inserting data into type of contacts
insert into Typesofcontacts
values
(1,'Family'),
(2,'Friends'),
(3,'Business');
alter table AddreBook_Sys
add contactid int primary key identity(1,1);

select *from AddreBook_Sys;

create table AddressBookNames
(addressBookId int primary key identity(1,1),
addressBookName varchar(50) not null );
---inserting values to addressbokk table--
insert into AddressBooknames values ('S'),('P'),('H');
select * from AddressBookNames;

---creating table address book names mapper which will contain contact id and address book names id---
create table addressbookMappeing
(contactid int not null, addressbookid int not null);
--inserting data into address book mapper id
insert into addressbookMappeing
values
(1,1),(2,1),(3,2);

select * from AddreBook_Sys;
select a.firstname,a.phoneNumber,a.city,a.state,a.eMail,b.addressbookname,b.addressBookId from AddreBook_Sys a join addressbookMappeing d
on a.contactid= d.contactid
join AddressBookNames b
on b.addressBookId= d.addressbookId
