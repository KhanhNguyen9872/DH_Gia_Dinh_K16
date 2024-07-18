<?php
include '../../config/check_login.php';
include '../../config/check_guest.php';
include '../../config/db.php';

$id = $_GET['id'];

$sql = "select img from phone where id = '$id';";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $r = $result->fetch_assoc();
    $old_image = $r["img"];
    $dir = $target_dir . $old_image;
    if (!is_dir($dir)) {
        if (file_exists($dir)) {
            unlink($dir);
        }
    }
}

$sql = "DELETE FROM phone WHERE id = $id";

if (!$conn->query($sql)) {
    echo "Error deleting record: " . $conn->error;
    die();
}

$conn->close();

header('Location: /?page=phone&list=1');
?>
