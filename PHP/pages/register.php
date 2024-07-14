<?php
if (session_status() == PHP_SESSION_NONE) {
    header('Location: /');
}

if (isset($_POST['submit'])) {
    $username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_STRING);
    $password = $_POST['password'];
    $repassword = $_POST['repassword'];
    $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);

    if (empty($username) || empty($password) || empty($email)) {
        echo "Thông tin không được để trống.";
    } elseif ($password !== $repassword) {
        echo "Mật khẩu phải trùng nhau.";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "Email không đúng định dạng.";
    } else {
        $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
        $repassword = password_hash($_POST['repassword'], PASSWORD_DEFAULT);
        $email = $_POST['email'];

        $stmt = $conn->prepare("INSERT INTO account (username, password, email) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $username, $password, $email);
        try {
            $stmt->execute();
            echo "Đăng ký thành công!";
        } catch (Exception $ex) {
            echo "Thông tin không hợp lệ! Có vẻ như tài khoản hoặc email này đã đăng ký rồi!";
        }
        
        $stmt->close();
    }
    $conn->close();
}
?>


<!DOCTYPE html>
<html>
    <head>
        <title>Đăng ký</title>
        <link rel="stylesheet" href="/stylesAuth.css">
    </head>
    <body>
        <h2>Đăng ký</h2>
        <form action="/auth.php?type=register" method="post">
            Tên tài khoản: <input type="text" name="username" placeholder="Nhập tên tài khoản" required><br>
            Mật khẩu: <input type="password" name="password" placeholder="Nhập mật khẩu" required><br>
            Nhập lại mật khẩu: <input type="password" name="repassword" placeholder="Nhập lại" required><br>
            Email: <input type="email" name="email" placeholder="Nhập Email của bạn" required><br>
            <input type="submit" name="submit" value="Đăng ký">
            <p></p>
            <a href="/" class="button">Quay về trang chủ</a>
        </form>
    </body>
</html>
