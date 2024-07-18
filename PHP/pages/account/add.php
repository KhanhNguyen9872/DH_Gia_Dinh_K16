<?php
include '../../config/check_login.php';
if (function_exists('redirectIfNotAdmin')) {
    redirectIfNotAdmin();
} else {
    header('Location: /');
}
include '../../config/db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $email = $_POST['email'];
    $user_id = $_POST['user_id'];

    $sql = "INSERT INTO account (username, password, email, user_id) VALUES ('$username', '$password', '$email', '$user_id')";

    if (!$conn->query($sql)) {
        echo "Error: " . $sql . "<br>" . $conn->error;
        die();
    }

    $conn->close();

    header('Location: /?page=account');
}
?>
