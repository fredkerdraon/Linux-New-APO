drop table Tasks;
create table Tasks(
	ID int,
	Task varchar(25),
	Weight real,
	Complexity real,
	Duration real,
	Status varchar(25),
	Project varchar(25),
	StartDate datetime,
	EndDate datetime,
	TheoStart datetime,
	TheoEnd datetime,
	Deliverable varchar(25),
	Dependency int,
	Resource int
);

drop table Tools;
create table Tools(
	ID int,
	Tool varchar(25),
	Rating real,
	Experience real,
	Link varchar(50)
);

drop table Contacts;
create table Contacts(
	ID int,
	Name varchar(25),
	Rating real,
	Birthday datetime,
	Telephone varchar(25),
	Telephone2 varchar(25),
	Email varchar(50),
	Telecopy varchar(25),
	PostalBox varchar(25),
	Town varchar(25)
);

drop table Assets;
create table Assets(
	ID int,
	Name varchar(25),
	Value real,
	AType varchar(25),
	ROI real,
	InitPrice real,
	MCost real,
	Maturity datetime,
	ALFlag varchar(25)
);

drop table Skills;
create table Skills(
	ID int,
	Contact varchar(25),
	Name varchar(25),
	Rating real,
	Experience real,
	Reference varchar(25)
);

drop table Checks;
create table Checks(
	ID int,
	Name varchar(25),
	Checklist varchar(25)
);

drop table Events;
create table Events(
	ID int,
	MyDate datetime,
	Type varchar(35),
	Name varchar(50),
	Task int,
	Template varchar(25)
);

drop table Cashflows;
create table Cashflows(
	MyDate datetime,
	GroupLib varchar(50),
	Libelle varchar(50),
	Debit double,
	Credit double,
	Category varchar(25)
);

drop table Balance;
create table Balance(
	MinDate datetime,
	MaxDate datetime,
	Charges double,
	Income double,
	Drift double,
	NumDays int
);

drop table Stocks;
create table Stocks(
	Date datetime,
	Open double,
	High double,
	Low double,
	Close double,
	Volume double,
	AdjClose double
);
select GroupLib, sum(Debit), sum(Credit) from Cashflows group by GroupLib;

delete from Balance where NumDays = 365;
