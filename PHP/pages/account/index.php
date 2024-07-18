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
            <h2><b>Thêm tài khoản mới</b></h2>
            <form action="/pages/account/add.php" method="post">
                <div>
                    <label for="username">Tên tài khoản</label><br>
                    <input type="text" name="username" placeholder="Tên tài khoản" required>
                </div>
                <div>
                    <label for="password">Mật khẩu</label><br>
                    <input type="text" name="password" placeholder="Mật khẩu" required>
                </div>
                <div>
                    <label for="email">Email</label><br>
                    <input type="email" name="email" placeholder="Email" required>
                </div>
                
                <div>
                    <label for="user_id">Nhân viên</label><br>
                    <select name="user_id">
                        <?php 
                            $sql = "select id, name from user order by id";
                            $re = $conn->query($sql);
                            if ($re->num_rows > 0) {
                                while ($row = $re->fetch_assoc()) {
                                    echo '<option value="' . $row['id'] . '">' . $row['name'] . '</option>' . "\n"; 
                                }
                            } else {
                                echo '<option value="null">Vui lòng tạo nhăn viên trước</option>';
                            }
                        ?>
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
            <h2><b>Danh sách tài khoản</b></h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên tài khoản</th>
                        <th>Email</th>
                        <th>Nhân viên</th>
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
                            $user_id = $row["user_id"];
                            $sql = "select name, type from user where id = $user_id";
                            $re = $conn->query($sql);
                            if ($re->num_rows > 0) {
                                $rr = $re->fetch_assoc();
                                $type = $rr["type"];
                            } else {
                                $type = "0";
                            }

                            echo "<tr>
                                <td>" . $row["id"] . "</td>
                                <td>" . $row["username"] . "</td>
                                <td>" . $row["email"] . "</td>
                                <td>" . $rr["name"] . "</td>
                                <td>" . ($type == "-1" ? "Quản trị" : ($type == "1" ? "Nhân viên" : "Khách")) . "</td>
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
