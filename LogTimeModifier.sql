SELECT * FROM TimeLogged;

TRUNCATE TABLE TimeLogged;

INSERT INTO TimeLogged ( clockIn, clockOut) values ( '2022-10-31 12:00:00', '2022-10-31 19:00:00');

ALTER TABLE TimeLogged
RENAME COLUMN hourWorked to hoursWorked;

ALTER TABLE TimeLogged
MODIFY COLUMN hoursWorked DECIMAL AS (HOUR(clockOut) - HOUR(clockIn));

ALTER TABLE TimeLogged
MODIFY COLUMN hoursWorked TIMESTAMP AS (subtime(clockOut, clockIn));



select * from timelogged_bkup;
truncate table timelogged_bkup;
INSERT INTO TimeLogged_bkup ( clockIn, clockOut) values ( '2022-10-31 12:00:00', '2022-11-01 12:15:00');
ALTER TABLE TimeLogged_BKUP
MODIFY COLUMN clockIn TIMESTAMP;

ALTER TABLE TimeLogged_BKUP
MODIFY COLUMN clockOut timestamp;

ALTER TABLE TimeLogged_BKUP
MODIFY Column hoursWorked INT as ((TIMESTAMPDIFF(minute, clockIn, clockOut)) / 60);

ALTER TABLE TimeLogged_BKUP
MODIFY Column hoursWorked DECimal(10,2) as (cast(TIMESTAMPDIFF(minute, clockIn, clockOut) as Decimal(10,2)) / 60);



