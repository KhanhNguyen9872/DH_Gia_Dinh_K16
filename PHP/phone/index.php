<?php include '../config/db.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kho hàng</title>
    <link rel="stylesheet" href="/styles.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Kho hàng</h1>
        </header>
        <main>
            <section class="add-phone">
                <form action="/" method="get">
                    <button type="submit">Về trang chủ</button>
                </form>
            </section>
            <section class="add-phone">
                <h2>Thêm điện thoại mới</h2>
                <form action="/phone/add_phone.php" method="post">
                    <input type="text" name="name" placeholder="Tên điện thoại" required>
                    <input type="text" name="model" placeholder="Mẫu" required>
                    <input type="number" name="quantity" placeholder="Số lượng" required>
                    <input type="number" name="price" placeholder="Giá" required>
                    <button type="submit">Thêm</button>
                </form>
            </section>
            <section class="phone-list">
                <h2>Danh sách điện thoại</h2>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên</th>
                            <th>Mẫu</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $sql = "SELECT * FROM phones;";
                        $result = $conn->query($sql);

                        if ($result->num_rows > 0) {
                            while($row = $result->fetch_assoc()) {
                                echo "<tr>
                                    <td>" . $row["id"] . "</td>
                                    <td>" . $row["name"] . "</td>
                                    <td>" . $row["model"] . "</td>
                                    <td>" . $row["quantity"] . "</td>
                                    <td>" . round($row["price"], 0) . " VND</td>
                                    <td class='actions'>
                                        <a href='/phone/edit_phone.php?id=" . $row["id"] . "' class='edit-btn'>Sửa</a>
                                        <a href='/phone/delete_phone.php?id=" . $row["id"] . "' class='delete-btn'>Xóa</a>
                                    </td>
                                </tr>";
                            }
                        } else {
                            echo "<tr><td colspan='4'>Không có điện thoại nào</td></tr>";
                        }
                        ?>
                    </tbody>
                </table>
            </section>
        </main>
    </div>
</body>
</html>
