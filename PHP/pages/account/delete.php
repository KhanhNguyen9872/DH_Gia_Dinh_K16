<?php
include '../../config/check_login.php';
include '../../config/is_admin.php';
include '../../config/db.php';

$id = $_GET['id'];

$sql = "DELETE FROM account WHERE id=$id";

if (!$conn->query($sql)) {
    echo "Error deleting record: " . $conn->error;
    die();
}

$conn->close();

header('Location: /?page=account');
?>
