<?php
if (session_status() == PHP_SESSION_NONE) {
    header('Location: /');
}

include 'config/db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $model = $_POST['model'];
    $quantity = $_POST['quantity'];
    $price = $_POST['price'];

    $sql = "UPDATE phones SET name='$name', model='$model', quantity = '$quantity', price='$price' WHERE id=$id";

    if (!$conn->query($sql)) {
        echo "Error updating record: " . $conn->error;
        die();
    }

    $conn->close();

    header('Location: /?page=phone');
} else {
    $id = $_GET['id'];
    $sql = "SELECT * FROM phones WHERE id=$id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
    } else {
        echo "Record not found";
        die();
    }
}
?>

<link rel="stylesheet" href="/pages/phone/styles.css">
<header>
    <h1>Sửa thông tin điện thoại</h1>
</header>
<main>
    <section class="edit-phone">
        <h2>Thông tin</h2>
        <form action="/?page=editPhone" method="post">
            <input type="text" name="id" value="<?php echo $row['id']; ?>" readonly>
            <input type="text" name="name" placeholder="Tên điện thoại" value="<?php echo $row['name']; ?>" required>
            <input type="text" name="model" placeholder="Mẫu" value="<?php echo $row['model']; ?>" required>
            <input type="number" name="quantity" placeholder="Số lượng" value="<?php echo $row['quantity']; ?>" required>
            <input type="number" name="price" placeholder="Giá" value="<?php echo round($row['price'], 0); ?>" required>
            <button type="submit">Sửa</button>
        </form>
    </section>
</main>
