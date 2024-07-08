<?php
if (session_status() == PHP_SESSION_NONE) {
    header('Location: /');
}

include 'config/db.php';
?>
<head>
    <link rel="stylesheet" href="/customer/styles.css">
</head>
