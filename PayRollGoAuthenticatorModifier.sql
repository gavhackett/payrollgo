ALTER TABLE payrollgoauthentication
MODIFY COLUMN userPassword VARCHAR(64);

ALTER TABLE payrollgoauthentication
MODIFY COLUMN  userPassword VARCHAR(64) AS (SHA2(employeeID, 256)) STORED NOT NULL;

INSERT INTO payrollgoauthentication (employeeID, userName)
VALUES (3434, 'BuddyDessert');

TRUNCATE TABLE payrollgoauthentication;

SELECT * FROM payrollgoauthentication;