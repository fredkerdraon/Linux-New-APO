create table tools(
	ID int,
	Tool varchar(25),
	Rating real,
	Experience real,
	Link varchar(50)
);

create table contacts(
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

create table assets(
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

create table skills(
	ID int,
	Contact varchar(25),
	Name varchar(25),
	Rating real,
	Experience real,
	Reference varchar(25)
);

create table checks(
	ID int,
	Name varchar(25),
	Checklist varchar(25)
);

create table events(
	ID int,
	MyDate datetime,
	Type varchar(35),
	Name varchar(50),
	Task int,
	Template varchar(25)
);

create table cashflows(
	MyDate datetime,
	GroupLib varchar(50),
	Libelle varchar(50),
	Debit double,
	Credit double,
	Category varchar(25),
	Weekly bool,
	Monthly bool, 
	Yearly bool 
);

ALTER IGNORE TABLE cashflows 
ADD UNIQUE INDEX idx_cashflows (MyDate, Libelle, Debit);

create table balance(
	MinDate datetime,
	MaxDate datetime,
	Charges double,
	Income double,
	Drift double,
	NumDays int
);

#ALTER IGNORE TABLE balance 
#ADD UNIQUE INDEX idx_balance (MinDate, MaxDate);

create table stocks(
	Date datetime,
	Open double,
	High double,
	Low double,
	Close double,
	Volume double,
	AdjClose double
);

create table stats(
	Date datetime,
	Cigies int,
	Beers int,
	Coffees int,
	Coke int,
	Joints int,
	Sex int,
	Coco int,
	Homeworking int,
	Present int,
	Calls int
;

#select GroupLib, sum(Debit), sum(Credit) from cashflows group by GroupLib;

delete from balance where NumDays = 365;
