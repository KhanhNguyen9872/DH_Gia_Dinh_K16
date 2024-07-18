<?php
include '../../config/check_login.php';
if (function_exists('redirectIfNotAdmin')) {
    redirectIfNotAdmin();
} else {
    header('Location: /');
}
include '../../config/db.php';

$id = $_GET['id'];

$sql = "SELECT COUNT(*) as count FROM account WHERE type = '-1'";
$sql2 = "SELECT type FROM account WHERE id = $id";

$result = $conn->query($sql);

if ($result->num_rows == 1) {
    $result2 = $conn->query($sql2);
    $row = $result->fetch_assoc();
    $row2 = $result2->fetch_assoc();
    if (($row["count"] == 1) && ($row2["type"] == "-1")) {
        echo "<script>alert('Không thể xóa tài khoản này!');</script>";
        echo "<script>window.location.href='" . "/?page=account" . "';</script>";
        exit();
    } else {
        $sql = "DELETE FROM account WHERE id = $id";

        if (!$conn->query($sql)) {
            echo "Error deleting record: " . $conn->error;
            die();
        }
    }
}
$conn->close();

header('Location: /?page=account');
?>
