CREATE TABLE BankAccount
(
	employeeID BIGINT NOT NULL,
    balance DEC(8,2) NOT NULL,
    nameBank VARCHAR(50) NOT NULL,
    routingNumber CHAR(9),
    PRIMARY KEY (employeeID),
    FOREIGN KEY (employeeID) REFERENCES Employee(employeeID)
);