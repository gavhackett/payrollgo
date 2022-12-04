<html> 
    <h3><p><a href="http://localhost/main_page.html">Main Page</a></p></h3>
</html>

<!-- PHP code to establish connection with the localserver -->
<?php
 
//login
$user = 'gavin';
$password = '';
 
// Database name
$database = 'payrollgo';
 
// Server is localhost with
// port number 3306
$servername='localhost:3306';
$mysqli = new mysqli($servername, $user,
                $password, $database);
 
// Checking for connections
if ($mysqli->connect_error) {
    die('Connect Error (' .
    $mysqli->connect_errno . ') '.
    $mysqli->connect_error);
}
 
// SQL query to select data from database
$sql = " SELECT * FROM employee ORDER BY employeeID ASC ";
$result = $mysqli->query($sql);

// create arrays for calculations.
$hoursWorked = array();
$hourlyWage = array();
$taxBracket = array();
$balance = array();
while($rows=$result->fetch_assoc()) {
    array_push($hoursWorked, $rows['hoursWorked']);
    array_push($hourlyWage, $rows['hourlyWage']);
    array_push($taxBracket, $rows['taxBracket']);
    array_push($balance, $rows['balance']);
}
$arrayLength = count($hoursWorked);
$payNet = array();
$payGross = array();
$newBalance = array();

//calculate gross pays of employees
for ($i = 0; $i < $arrayLength; $i++) {
    $payGross[$i] = $hoursWorked[$i] * $hourlyWage[$i];
}

//calculate net pays of employees
for ($i = 0; $i < $arrayLength; $i++) {
    $payNet[$i] = $payGross[$i] - ( $payGross[$i] * $taxBracket[$i] );
}

//calculate new balance to be updated in database
for ($i = 0; $i < $arrayLength; $i++) {
    $newBalance[$i] = $balance[$i] + $payNet[$i];
}

//create sql statement to update employee balances and execute
for ($i = 0; $i < $arrayLength; $i++) {
    $sql = "UPDATE employee SET balance = ";
    $sql .= $newBalance[$i];
    $sql .= " WHERE employeeID = ";
    $sql .= $i+1;
    $mysqli->query($sql);
}

//create sql statement to update employee hours worked back to 0 and execute
for ($i = 0; $i < $arrayLength; $i++) {
    $sql = "UPDATE employee SET hoursWorked = 0";
    $mysqli->query($sql);
}

echo "Balances updated.";

?>