<?php
include '../../config/check_login.php';
include '../../config/check_guest.php';
include '../../config/db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'];
    $model = $_POST['model'];
    $quantity = $_POST['quantity'];
    $price = $_POST['price'];

    $producer = $_POST["producer"];
    $phonetype = $_POST["phonetype"];

    $sql = "INSERT INTO phone (name, model, producer_id, phonetype_id, quantity, price) VALUES ('$name', '$model', '$producer', '$phonetype', '$quantity', '$price')";

    if (!$conn->query($sql)) {
        echo "Error: " . $sql . "<br>" . $conn->error;
        die();
    }

    $conn->close();

    header('Location: /?page=phone');
}
?>
