<?php

$type = isset($_GET['type']) ? $_GET['type'] : header('Location: /auth.php?type=login');

if ($type != 'logout') {
    session_start();

    if (isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true) {
        header("location: /");
        exit;
    }

    $allow = array('login', 'register', 'forgot');

    $isAllow = false;
    foreach($allow as $s) {
        if ($s == $type) {
            $isAllow = true;
        }
    }
    
    if(!$isAllow) {
        header('Location: /auth.php?type=login');
    }
}

require_once "config/db.php";

include "pages/" . $type . ".php";
?>