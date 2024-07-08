<?php
if (session_status() == PHP_SESSION_NONE) {
    header('Location: /');
}

include '../../config/db.php';

$id = $_GET['id'];

$sql = "DELETE FROM phones WHERE id=$id";

if (!$conn->query($sql)) {
    echo "Error deleting record: " . $conn->error;
    die();
}

$conn->close();

header('Location: /?page=phone');
?>
