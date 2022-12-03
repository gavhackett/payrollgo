CREATE TABLE BankAccount
(
	employeeID BIGINT NOT NULL AUTO_INCREMENT,
    balance DEC(8,2) NOT NULL,
    nameBank VARCHAR(50) NOT NULL,
    routingNumber CHAR(9) NOT NULL,
    PRIMARY KEY (employeeID),
    FOREIGN KEY (employeeID) REFERENCES Employee(employeeID)
);