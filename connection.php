<?php
$user = "NOE";
$pass = "12345";
$host = "localhost:1521/orcl"; 
$dbname = "PortalNoticiasDB"; 

$dbconn = oci_connect($user, $pass, $host);

if(!$dbconn) {
    $e = oci_error(); 
    trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
} else {
    echo "¡Conexión a la base de datos ORACLE exitosa!";
}

function getArray($pdo, $errorMessage, $sql)
{
    if (!$pdo) {
        echo $errorMessage;
        return null;
    }

    try {
        $statement = $pdo->query($sql);
        $rawdata = $statement->fetchAll(PDO::FETCH_ASSOC);
        return $rawdata;
    } catch (PDOException $e) {
        echo "Error de consulta: " . $e->getMessage();
        return null;
    }
}

?>