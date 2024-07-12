<?php
include '../../config/check_login.php';
include '../../config/is_admin.php';
include '../../config/db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $email = $_POST['email'];
    $type = $_POST['type'];

    $sql = "INSERT INTO account (username, password, email, type) VALUES ('$username', '$password', '$email', '$type')";

    if (!$conn->query($sql)) {
        echo "Error: " . $sql . "<br>" . $conn->error;
        die();
    }

    $conn->close();

    header('Location: /?page=account');
}
?>
