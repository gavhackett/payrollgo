<html> 
    <h3><p><a href="http://localhost/main_page.html">Main Page</a></p></h3>
</html>

<?php
 
// login
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

//pull data from database
$sql = " SELECT * FROM employee ORDER BY employeeID ASC ";
$result = $mysqli->query($sql);

//get hours worked to update
$hoursWorked = array();
while($rows=$result->fetch_assoc()) {
    array_push($hoursWorked, $rows['hoursWorked']);
}

//calculate new hours to set
$hours = $_POST["hours"];
$eid = $_POST["eid"];
$newHours = $hoursWorked[$eid-1] + $hours;

//create SQL statement using POST submission
$sql = "UPDATE employee SET hoursWorked = ";
$sql .= $newHours;
$sql .= " WHERE employeeID = ";
$sql .= $eid;
$mysqli->query($sql);

echo "Hours updated.";
?>


