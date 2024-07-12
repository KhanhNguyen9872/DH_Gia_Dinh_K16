<?php
$servername = "127.0.0.1";
$username = "root";
$password = "82654264";
$dbname = "phoneStore";

// Tạo kết nối
$conn = new mysqli($servername, $username, $password, $dbname);

// Kiểm tra kết nối
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
