<?php
if (session_status() == PHP_SESSION_NONE) {
    header('Location: /');
}

?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Forgot Password</title>
        <link rel="stylesheet" href="/stylesAuth.css">
        </head>
    <body>
        <h2>Quên mật khẩu</h2>
        <form action="/auth.php?type=forgot" method="post">
            <label for="username"><b>Tên tài khoản</b></label>
            <input type="text" placeholder="Nhập tên tài khoản" name="username" required>

            <label for="email"><b>Email</b></label>
            <input type="email" placeholder="Nhập Email của bạn" name="email" required>

            <input type="submit" value="Quên mật khẩu">
        </form>
    </body>
</html>
