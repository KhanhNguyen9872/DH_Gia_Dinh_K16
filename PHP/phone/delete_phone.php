<?php
include '../config/db.php';

$id = $_GET['id'];

$sql = "DELETE FROM phones WHERE id=$id";

if (!$conn->query($sql)) {
    echo "Error deleting record: " . $conn->error;
    die();
}

$conn->close();

header('Location: /phone');
?>
