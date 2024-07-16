<?php
if(!isset($_SESSION)) 
{ 
    session_start(); 
} 

if (!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true) {
    header("location: /auth.php");
    exit;
}

?>