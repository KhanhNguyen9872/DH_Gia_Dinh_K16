<?php
include '../../config/check_login.php';
include '../../config/db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'];
    $model = $_POST['model'];
    $quantity = $_POST['quantity'];
    $price = $_POST['price'];

    $sql = "INSERT INTO phones (name, model, quantity, price) VALUES ('$name', '$model', '$quantity', '$price')";

    if (!$conn->query($sql)) {
        echo "Error: " . $sql . "<br>" . $conn->error;
        die();
    }

    $conn->close();

    header('Location: /?page=phone');
}
?>
