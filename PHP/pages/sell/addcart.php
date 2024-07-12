<?php
// if (session_status() == PHP_SESSION_NONE) {
//     header('Location: /');
// }
session_start();

include 'config/db.php';

if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = array();
}

if (isset($_GET['id'])) {
    $product_id = $_GET['id'];

    if (!in_array($product_id, $_SESSION['cart'])) {
        $_SESSION['cart'][] = $product_id;
    }
}

header("Location: /?page=sell");
?>
