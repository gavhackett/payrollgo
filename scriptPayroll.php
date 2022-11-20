<?php
    $servername = "localhost";
    $username = "username";
    $password = "password";

    try {
        $conn = new PDO("mysql:host=$servername;dbname=myDB", $username, $password);
        // set the PDO error mode to exception
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        echo "Connected successfully";

        echo "Starting payroll sequence";
        
        //formulas --- $ = new php variable, # = from sql column
        //$payGross = #hoursWorked * #hourlyWage
        //$payDeduction = $payGross * #taxBracket
        //$payEarned = $payGross - $payDeduction
        
        //create an array of hoursWorked from database
        $hoursWorked = array();
        $sql = "SELECT hoursWorked FROM employee";
        mysql_select_db('PayRollGo');
        $returnVal = mysql_query($sql, $conn);
        if(! $returnVal ) {
            die('Could not get data: ' . mysql_error());
        }
        
        while($row = mysql_fetch_array($retval, MYSQL_ASSOC)) {
            array_push($hoursWorked, $row);
        }

        //test if array works by printing
        foreach ($hoursWorked as $val) {
            echo "$val, ";
        }


        //create an array of hourlyWage from database
/*
        $hourlyWage = array();
        $sql = "SELECT hourlyWage FROM employee";
        mysql_select_db('PayRollGo');
        $returnVal = mysql_query($sql, $conn);
        if(! $returnVal ) {
            die('Could not get data: ' . mysql_error());
        }
        
        while($row = mysql_fetch_array($retval, MYSQL_ASSOC)) {
            array_push($hourlyWage, $row);
        }
*/

        //create an array of hourlyWage from database
/*
        $taxBracket = array();
        $sql = "SELECT taxBracket FROM employee";
        mysql_select_db('PayRollGo');
        $returnVal = mysql_query($sql, $conn);
        if(! $returnVal ) {
            die('Could not get data: ' . mysql_error());
        }
        
        while($row = mysql_fetch_array($retval, MYSQL_ASSOC)) {
            array_push($taxBracket, $row);
        }
*/





        mysql_close($conn);
    } catch(PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
    }
?>