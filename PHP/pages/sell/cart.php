<?php
// if (session_status() == PHP_SESSION_NONE) {
//     header('Location: /');
// }
error_reporting(E_ALL);
ini_set('display_errors', 'On');
session_start();

include '../../config/db.php';

if (!isset($_SESSION['cart']) || empty($_SESSION['cart'])) {
    echo "Your cart is empty.";
} else {
    $cart = $_SESSION['cart'];
    $items = implode(',', array_map('intval', $cart));
    $sql = "SELECT * FROM phones WHERE id IN ($items)";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<div class='product'>";
            echo "<h2>" . $row['name'] . "</h2>";
            echo "<p>Price: $" . $row['price'] . "</p>";
            echo "</div>";
        }
    } else {
        echo "Your cart is empty!";
    }
}
$conn->close();
?>
