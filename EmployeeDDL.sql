CREATE TABLE Employee 
(
	employeeID BIGINT NOT NULL,
	taxBracket BIT NOT NULL,
	nameFirst VARCHAR(20) NOT NULL,
	nameLast VARCHAR(20) NOT NULL,
	hoursWorked SMALLINT,
	hourlyWage SMALLINT NOT NULL,
	phoneNumber CHAR(12),
	address VARCHAR(255) NOT NULL,
    CHECK (taxBracket in (0.10,0.12,0.22,0.24,0.32,0.35,0.37)),
	PRIMARY KEY (employeeID)
);