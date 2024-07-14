<?php
include '../../config/check_login.php';
include '../../config/check_guest.php';
include '../../config/db.php';

$id = $_GET['id'];

$sql = "DELETE FROM producer WHERE id=$id";

if (!$conn->query($sql)) {
    echo "Error deleting record: " . $conn->error;
    die();
}

$conn->close();

header('Location: /?page=producer');
?>
