<?php
include '../../config/check_login.php';
include '../../config/check_guest.php';
include '../../config/db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'];
    $email = $_POST['email'];

    $sql = "INSERT INTO producer (name, email) VALUES ('$name', '$email')";

    if (!$conn->query($sql)) {
        echo "Error: " . $sql . "<br>" . $conn->error;
        die();
    }

    $conn->close();

    header('Location: /?page=producer');
}
?>
