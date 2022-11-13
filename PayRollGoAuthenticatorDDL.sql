CREATE TABLE PayRollGoAuthentication 
(
	employeeID BIGINT NOT NULL,
    userName VARCHAR(20),
    userPassword VARCHAR(20) AS (SHA2(employeeID, 256)) STORED NOT NULL,
    PRIMARY KEY (employeeID)
);