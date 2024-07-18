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
    $username = $_POST['username'];
    $password = $_POST['password'];
    $email = $_POST['email'];
    $user_id = $_POST['user_id'];
    
    if($password != "") {
        $password = ", password = '" . password_hash($password, PASSWORD_DEFAULT) . "'";
    }

    $sql = "UPDATE account SET username='$username', email = '$email', user_id='$user_id' $password WHERE id = $id";

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
        redirect("/?page=account");
    }
}
?>

<link rel="stylesheet" href="/pages/account/styles.css">
<main>
    <section class="edit-account">
        <h2><b>Sửa thông tin tài khoản</b></h2>
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
                <label for="user_id">Nhân viên</label><br>
                <select name="user_id">
                    <?php 
                        $sql = "select id, name from user order by id";
                        $re = $conn->query($sql);
                        if ($re->num_rows > 0) {
                            while ($r = $re->fetch_assoc()) {
                                echo '<option value="' . $r['id'] . '"' . ($row['user_id'] == $r['id'] ? 'selected="selected"' : '') . '>' . $r['name'] . '</option>' . "\n"; 
                            }
                        } else {
                            echo '<option value="null">Vui lòng tạo nhăn viên trước</option>';
                        }
                    ?>
                </select>
            </div>
            
            <div>
                <br>
                <button type="submit">Sửa</button>
            </div>
        </form>
    </section>
</main>
