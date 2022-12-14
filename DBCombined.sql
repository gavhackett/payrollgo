CREATE DATABASE PayRollGo;
USE PayRollGo;

CREATE TABLE Employee 
(
	employeeID BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	taxBracket DECIMAL(3,2) UNSIGNED NOT NULL CHECK (taxBracket in (0.10,0.12,0.22,0.24,0.32,0.35,0.37)),
	nameFirst VARCHAR(30) NOT NULL,
	nameLast VARCHAR(30) NOT NULL,
	hoursWorked SMALLINT UNSIGNED NOT NULL,
	hourlyWage DECIMAL(5,2) UNSIGNED NOT NULL,
	phoneNumber CHAR(10),
    balance DECIMAL(8,2) NOT NULL,
    nameBank VARCHAR(50) NOT NULL,
    routingNumber CHAR(14) NOT NULL,
	address VARCHAR(255) NOT NULL,
	PRIMARY KEY (employeeID)
);

INSERT INTO employee (taxBracket, nameFirst, nameLast, hoursWorked, hourlyWage, phoneNumber, address, nameBank, routingNumber, balance)
VALUES
    (0.22, 'John', 'Jenkins', 0, 32.02, '3141112222', '1 Main St, St. Louis, MO, 63123', 'Bank of America', 11122233344455, 934.11),
	(0.24, 'James', 'Roberts', 0, 75.10, '3140705729', '511 Kerridge Way, St. Louis, MO, 63123', 'Bank of America', 99948399994839, 2573.88),
    (0.35, 'Sam', 'Cole', 0, 201.20, '3145081635', '867 Mitre Fairway, St. Louis, MO, 63123', 'Bank of America', 64025626402562, 5609.12),
    (0.35, 'Robert', 'Carter', 0, 126.50, '3146141757', '423 Lomond Bank, St. Louis, MO, 63123', 'Bank of America', 65689356568935, 5796.16),
    (0.22, 'Jamari', 'Barlett', 0, 37.10, '3142870895', '555 Main St, St. Louis, MO, 63123', 'Bank of America', 11724051172405, 515.64),
    (0.24, 'Lexi', 'Lowe', 0, 70.25, '3145815775', '644 Hay Oval, St. Louis, MO, 63123', 'Bank of America', 66622233344455, 3659.55),
    (0.22, 'Tiana', 'Maxwell', 0, 29.10, '3147162580', '7444 Falconwood Road, St. Louis, MO, 63123', 'Bank of America', 30770363077036, 5375.10),
    (0.35, 'Imani', 'Hurley', 0, 176.50, '3145932761', '833 Bloomfield Way, St. Louis, MO, 63123', 'Bank of America', 63882916388291, 2746.76),
    (0.24, 'Anna', 'Jones', 0, 69.45, '3143565904', '92 Hebden Avenue, St. Louis, MO, 63123', 'Bank of America', 42867344286734, 4337.90),
    (0.35, 'Faith', 'Price', 0, 172.10, '3143255818', '1567 Bellingham Drive, St. Louis, MO, 63123', 'Bank of America', 94919849491984, 682.56),
    (0.32, 'Lia', 'Quinn', 0, 96.80, '3148079204', '1976 Gordon Court, St. Louis, MO, 63123', 'Bank of America', 82730098273009, 3650.92),
    (0.37, 'Shayla', 'Dawson', 0, 274.45, '3143657974', '1122 Abbott Road, St. Louis, MO, 63123', 'Bank of America', 90414869041486, 9189.47),
    (0.24, 'Zaea', 'Bennett', 0, 60.50, '3142506374', '1225 Courtenay Avenue, St. Louis, MO, 63123', 'Bank of America', 98208189820818, 1629.83);
