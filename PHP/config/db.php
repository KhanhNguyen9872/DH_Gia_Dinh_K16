<?php
$servername = "localhost";
$username = "root";
$password = "12345678";
$dbname = "phoneStore";

// Tạo kết nối
$conn = new mysqli($servername, $username, $password, $dbname);

// Kiểm tra kết nối
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
