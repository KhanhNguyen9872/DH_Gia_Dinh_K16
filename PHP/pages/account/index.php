<?php
include 'config/check_login.php';
if (function_exists('redirectIfNotAdmin')) {
    redirectIfNotAdmin();
} else {
    header('Location: /');
}
include 'config/db.php';
?>
<head>
<link rel="stylesheet" href="/pages/account/styles.css">
</head>
<body>
    <main>
        <section class="add-account">
            <h2>Thêm tài khoản mới</h2>
            <form action="/pages/account/add.php" method="post">
                <input type="text" name="username" placeholder="Tên tài khoản" required>
                <input type="text" name="password" placeholder="Mật khẩu" required>
                <input type="email" name="email" placeholder="Email" required>
                <select name="type">
                    <option value="0">Khách</option>
                    <option value="1">Nhân viên</option>
                    <option value="-1">Quản trị</option>
                </select>
                <button type="submit">Thêm</button>
            </form>
        </section>
        <hr>
        <section class="account-list">
            <h2>Danh sách tài khoản</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên tài khoản</th>
                        <th>Email</th>
                        <th>Loại tài khoản</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $sql = "SELECT * FROM account order by id;";
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                            echo "<tr>
                                <td>" . $row["id"] . "</td>
                                <td>" . $row["username"] . "</td>
                                <td>" . $row["email"] . "</td>
                                <td>" . ($row["type"] == "-1" ? "Quản trị" : ($row["type"] == "1" ? "Nhân viên" : "Khách")) . "</td>
                                <td class='actions'>
                                    <a href='/?page=editAccount&id=" . $row["id"] . "' class='edit-btn'>Sửa</a>
                                    <a href='#' onclick=\"deleteSubmit('" . $row["id"] . "')\" class='delete-btn'>Xóa</a>
                                </td>
                            </tr>";
                        }
                    } else {
                        echo "<tr><td colspan='4'>Không có tài khoản nào</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </section>
    </main>
</body>
<script>
    function deleteSubmit(id) {
        if (confirm('Bạn có muốn xóa id [' + id + '] không?')) {
            window.location.href = '/pages/account/delete.php?id=' + id;
        }
    }
</script>
</html>
