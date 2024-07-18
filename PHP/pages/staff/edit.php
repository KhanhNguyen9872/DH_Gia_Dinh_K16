<?php
include 'config/check_login.php';
if (function_exists('redirectIfNotAdmin')) {
    redirectIfNotAdmin();
} else {
    header('Location: /');
}
include 'config/db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $gender = $_POST['gender'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $type = $_POST['type'];

    $sql = "UPDATE user SET name='$name', gender='$gender', email='$email', phone='$phone', type='$type' WHERE id = $id";

    if (!$conn->query($sql)) {
        echo "Error updating record: " . $conn->error;
        die();
    }

    $conn->close();

    echo "<script>window.location.href='/?page=staff';</script>";
} else {
    $id = $_GET['id'];
    $sql = "SELECT * FROM user WHERE id = $id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
    } else {
        redirect("/?page=staff");
    }
}
?>

<link rel="stylesheet" href="/pages/account/styles.css">
<main>
    <section class="edit-account">
        <h2>Sửa thông tin tài khoản</h2>
        <form action="/?page=editStaff" method="post">
            <div>
                <label for="id">ID</label><br>
                <input type="text" name="id" value="<?php echo $row['id'] ?>" placeholder="ID" size="1" readonly>
            </div>
            <div>
                <label for="name">Tên nhân viên</label><br>
                <input type="text" name="name" value="<?php echo $row['name'] ?>" placeholder="Tên nhân viên" required>
            </div>
            <div>
                <label for="gender">Giới tính</label><br>
                <select name="gender">
                    <option value="0" <?php echo ($row['gender'] == "0" ? 'selected="selected"' : ''); ?>>Nam</option>
                    <option value="1" <?php echo ($row['gender'] == "1" ? 'selected="selected"' : ''); ?>>Nữ</option>
                    <option value="-1" <?php echo ($row['gender'] == "-1" ? 'selected="selected"' : ''); ?>>Không xác định</option>
                </select>
            </div>
            <div>
                <label for="email">Email</label><br>
                <input type="email" name="email" value="<?php echo $row['email'] ?>" placeholder="Email" required>
            </div>
            <div>
                <label for="phone">Số điện thoại</label><br>
                <input type="text" name="phone" value="<?php echo $row['phone'] ?>" placeholder="Số điện thoại" required>
            </div>
            <div>
                <label for="type">Loại</label><br>
                <select name="type">
                    <option value="0" <?php echo ($row['type'] == "0" ? 'selected="selected"' : ''); ?>>Khách</option>
                    <option value="1" <?php echo ($row['type'] == "1" ? 'selected="selected"' : ''); ?>>Nhân viên</option>
                    <option value="-1" <?php echo ($row['type'] == "-1" ? 'selected="selected"' : ''); ?>>Quản trị</option>
                </select>
            </div>
            
            <div>
                <br>
                <button type="submit">Sửa</button>
            </div>
        </form>
    </section>
</main>
