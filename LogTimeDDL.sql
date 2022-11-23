DROP TABLE TimeLogged;
CREATE TABLE TimeLogged 
(
	employeeID BIGINT,
	clockIn TIMESTAMP,
    clockOut TIMESTAMP,
    hoursWorked DECimal(10,2) as (cast(TIMESTAMPDIFF(minute, clockIn, clockOut) as Decimal(10,2)) / 60),
    foreign key (employeeID) REFERENCES Employee(employeeID)
);

DROP TABLE TIMELOGGED_BKUP;
CREATE TABLE TimeLogged_BKUP
(
	employeeID BIGINT,
	clockIn TIMESTAMP,
    clockOut TIMESTAMP,
    hoursWorked DECimal(10,2) as (cast(TIMESTAMPDIFF(minute, clockIn, clockOut) as Decimal(10,2)) / 60),
    foreign key (employeeID) REFERENCES Employee(employeeID)
);