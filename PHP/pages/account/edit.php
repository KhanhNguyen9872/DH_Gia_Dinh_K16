<?php
include 'config/check_login.php';
include 'config/is_admin.php';
include 'config/db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $email = $_POST['email'];
    $type = $_POST['type'];
    
    if($password != "") {
        $password = ", password = '" . password_hash($password, PASSWORD_DEFAULT) . "'";
    }

    $sql = "UPDATE account SET username='$username', email = '$email', type='$type' $password WHERE id = $id";

    if (!$conn->query($sql)) {
        echo "Error updating record: " . $conn->error;
        die();
    }

    $conn->close();

    echo "<script>window.location.href='/?page=account';</script>";
} else {
    $id = $_GET['id'];
    $sql = "SELECT * FROM account WHERE id=$id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
    } else {
        echo "Record not found";
        die();
    }
}
?>

<link rel="stylesheet" href="/pages/account/styles.css">
<main>
    <section class="edit-account">
        <h2>Sửa thông tin tài khoản</h2>
        <form action="/?page=editAccount" method="post">
            <div>
                <label for="id">ID</label><br>
                <input type="text" id="id" name="id" value="<?php echo $row['id']; ?>" size="1" readonly>
            </div>

            <div>
                <label for="username">Tên tài khoản</label><br>
                <input type="text" id="username" name="username" placeholder="Tên tài khoản" value="<?php echo $row['username']; ?>" size="15" readonly>
            </div>

            <div>
                <label for="password">Mật khẩu</label><br>
                <input type="password" id="password" name="password" placeholder="Mật khẩu" value="">
            </div>

            <div>
                <label for="email">Email</label><br>
                <input type="text" id="email" name="email" placeholder="Email" value="<?php echo $row['email']; ?>" size="30" required>
            </div>

            <div>
                <label for="type">Loại tài khoản</label><br>
                <select id="type" name="type">
                    <option value="0" <?php echo ($row['type'] == "0" ? 'selected="selected"' : ""); ?>>Nhân viên</option>
                    <option value="1" <?php echo ($row['type'] == "1" ? 'selected="selected"' : ""); ?>>Quản trị</option>
                </select>
            </div>
            
            <button type="submit">Sửa</button>
        </form>
    </section>
</main>
