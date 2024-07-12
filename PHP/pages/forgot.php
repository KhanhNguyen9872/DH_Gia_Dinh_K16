<?php
if (session_status() == PHP_SESSION_NONE) {
    header('Location: /');
}

function randomPassword() {
    $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    $pass = array(); //remember to declare $pass as an array
    $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
    for ($i = 0; $i < 8; $i++) {
        $n = rand(0, $alphaLength);
        $pass[] = $alphabet[$n];
    }
    return implode($pass); //turn the array into a string
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $email = $_POST["email"];    
    $sql = "select id from account where (username = ? AND email = ?);";
    $stmt = $conn->prepare($sql);
    if ($stmt === false) {
        die('Prepare failed: ' . htmlspecialchars($conn->error));
    }
    $stmt->bind_param("ss", $username_, $email_);
    $username_ = $username;
    $email_ = $email;
    if (mysqli_stmt_execute($stmt)) {
        mysqli_stmt_store_result($stmt);

        if (mysqli_stmt_num_rows($stmt) == 1) {                    
            mysqli_stmt_bind_result($stmt, $id);
            if (mysqli_stmt_fetch($stmt)) {
                $password = randomPassword();
                $password_hash = password_hash($password, PASSWORD_DEFAULT);
                $sql = "UPDATE account SET password='$password_hash' WHERE id = $id";

                if (!$conn->query($sql)) {
                    echo "Hệ thống có sự cố, vui lòng thử lại sau!";
                } else {
                    echo "Mật khẩu mới của bạn là: " . $password;
                }

                $conn->close();
            }
        } else {
            echo "Thông tin không chinh xác!";
        }
    } else {
        echo "Hệ thống có sự cố, vui lòng thử lại sau!";
    }
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
            <p></p>
            <a href="/" class="button">Quay về trang chủ</a>
        </form>
    </body>
</html>
