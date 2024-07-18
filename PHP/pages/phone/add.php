<?php
include '../../config/check_login.php';
include '../../config/check_guest.php';
include '../../config/db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $target_dir = "../../upload/img/phone/";
    
    $image = generateRandomString() . ".jpg";
    $full_path = $target_dir . $image;
    if (!move_uploaded_file($_FILES["img"]["tmp_name"], $full_path)) {
        echo "Error: Cannot upload image!";
        die();
    }

    $name = $_POST['name'];
    $model = $_POST['model'];
    $quantity = $_POST['quantity'];
    $price = $_POST['price'];

    $producer = $_POST["producer"];
    $phonetype = $_POST["phonetype"];

    $sql = "INSERT INTO phone (name, model, producer_id, phonetype_id, quantity, price, img) VALUES ('$name', '$model', '$producer', '$phonetype', '$quantity', '$price', '$image')";

    if (!$conn->query($sql)) {
        echo "Error: " . $sql . "<br>" . $conn->error;
        die();
    }

    $conn->close();

    header('Location: /?page=phone&list=1');
}
?>
