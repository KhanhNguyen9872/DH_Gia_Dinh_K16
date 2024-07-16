<?php
include 'config/check_login.php';
include 'config/check_guest.php';
include 'config/db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $email = $_POST['email'];

    $sql = "UPDATE producer SET name='$name', email='$email' WHERE id=$id";

    if (!$conn->query($sql)) {
        echo "Error updating record: " . $conn->error;
        die();
    }

    $conn->close();

    echo "<script>window.location.href='/?page=producer';</script>";
    exit();
} else {
    $id = $_GET['id'];
    $sql = "SELECT * FROM producer WHERE id=$id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
    } else {
        redirect("/?page=producer");
    }
}
?>

<link rel="stylesheet" href="/pages/producer/styles.css">
<main>
    <section class="edit-producer">
        <h2>Sửa thông tin nhà sản xuất</h2>
        <form action="/?page=editProducer" method="post">
            <div>
                <label for="id">ID</label><br>
                <input type="text" name="id" value="<?php echo $row['id']; ?>" size="1" readonly>
            </div>
            
            <div>
            <label for="name">Tên nhà sản xuất</label><br>
                <input type="text" id="name" name="name" placeholder="Tên nhà sản xuất" value="<?php echo $row['name']; ?>" required>
            </div>
            <div>
                <label for="email">Email</label><br>
                <input type="email" id="email" name="email" placeholder="Email" value="<?php echo $row['email']; ?>" size = "50" required>
            </div>
            
            <button type="submit">Sửa</button>
        </form>
    </section>
</main>
