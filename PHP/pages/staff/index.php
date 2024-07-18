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
            <h2>Thêm nhân viên mới</h2>
            <form action="/pages/account/add.php" method="post">
                <div>
                    <label for="name">Tên nhân viên</label><br>
                    <input type="text" name="name" placeholder="Tên nhân viên" required>
                </div>
                <div>
                    <label for="gender">Giới tính</label><br>
                    <select name="gender">
                        <option value="0">Nam</option>
                        <option value="1">Nữ</option>
                        <option value="-1">Không xác định</option>
                    </select>
                </div>
                <div>
                    <label for="email">Email</label><br>
                    <input type="email" name="email" placeholder="Email" required>
                </div>
                <div>
                    <label for="phone">Số điện thoại</label><br>
                    <input type="text" name="phone" placeholder="Số điện thoại" required>
                </div>
                <div>
                    <label for="type">Loại</label><br>
                    <select name="type">
                        <option value="0">Khách</option>
                        <option value="1">Nhân viên</option>
                        <option value="-1">Quản trị</option>
                    </select>
                </div>
                
                <div>
                    <br>
                    <button type="submit">Thêm</button>
                </div>
            </form>
        </section>
        <hr>
        <section class="account-list">
            <h2>Danh sách nhân viên</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên nhân viên</th>
                        <th>Giới tính</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Loại</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $sql = "SELECT * FROM user order by id;";
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {

                            echo "<tr>
                                <td>" . $row["id"] . "</td>
                                <td>" . $row["name"] . "</td>
                                <td>" . ($row["gender"] == "0" ? "Nam" : ($row["gender"] == "1" ? "Nữ" : "Không xác định")) . "</td>
                                <td>" . $row["email"] . "</td>
                                <td>" . $row["phone"] . "</td>
                                <td>" . ($row["type"] == "-1" ? "Quản trị" : ($row["type"] == "1" ? "Nhân viên" : "Khách")) . "</td>
                                <td class='actions'>
                                    <a href='/?page=editStaff&id=" . $row["id"] . "' class='edit-btn'>Sửa</a>
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
