<?php
include 'config/check_login.php';
include 'config/check_guest.php';
include 'config/db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $name = $_POST['name'];

    $sql = "UPDATE phonetype SET name='$name' WHERE id=$id";

    if (!$conn->query($sql)) {
        echo "Error updating record: " . $conn->error;
        die();
    }

    $conn->close();

    echo "<script>window.location.href='/?page=type';</script>";
    exit();
} else {
    $id = $_GET['id'];
    $sql = "SELECT * FROM phonetype WHERE id = '$id'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
    } else {
        redirect("/?page=type");
    }
}
?>

<link rel="stylesheet" href="/pages/type/styles.css">
<main>
    <section class="edit-type">
        <h2>Sửa thông tin loại</h2>
        <form action="/?page=editType" method="post">
            <div>
                <label for="id">ID</label><br>
                <input type="text" name="id" value="<?php echo $row['id']; ?>" size="1" readonly>
            </div>
            
            <div>
            <label for="name">Tên loại</label><br>
                <input type="text" id="name" name="name" placeholder="Tên loại" value="<?php echo $row['name']; ?>" required>
            </div>
            
            <div>
                <br>
                <button type="submit">Sửa</button>
            </div>
        </form>
    </section>
</main>
