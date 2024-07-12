<?php
if (session_status() == PHP_SESSION_NONE) {
    header('Location: /');
}

include 'config/db.php';
?>
<head>
    <link rel="stylesheet" href="/pages/staff/styles.css">
</head>