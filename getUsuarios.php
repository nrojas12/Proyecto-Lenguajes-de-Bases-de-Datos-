<?php
require_once 'connection.php';

$connection = oci_connect('NOE', '12345', 'localhost:1521/orcl'); 

if (!$connection) {
    $e = oci_error();
    trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
} else {
    $sql = "SELECT * FROM Usuarios";
    $statement = oci_parse($connection, $sql); 

    if (!$statement) {
        $e = oci_error($connection);
        trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
    } else {
        oci_execute($statement); 

        while ($row = oci_fetch_assoc($statement)) {
            print_r($row); 
        }

        oci_free_statement($statement); 
        oci_close($connection); 
    }
}
?>