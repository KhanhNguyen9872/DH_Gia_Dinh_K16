<?php
if (session_status() == PHP_SESSION_NONE) {
    header('Location: /');
}

include 'config/db.php';
?>
<head>
    <link rel="stylesheet" href="/pages/sell/styles.css">
</head>
<body>
    <div class="cart-button">
        <a href="/pages/sell/cart.php"><button>Go to Cart</button></a>
    </div>
    <div class="products">
        <?php
        $sql = "SELECT * FROM phones;";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<div class='product'>";
                echo "<h3>" . $row['name'] . "</h3>";
                echo "<p>Price: $" . $row['price'] . "</p>";
                echo "<a href='/pages/sell/addcart.php?id=" . $row['id'] . "'><button>Add to Cart</button></a>";
                echo "</div>";
            }
        } else {
            echo "0 results";
        }

        $conn->close();
        ?>
    </div>
</body>