<?php
include 'config/check_login.php';
include 'config/db.php';

?>
<head>
<link rel="stylesheet" href="/pages/type/styles.css">
</head>
<body>
    <main>
        <?php
        if (!is_guest()) {
            echo '<section class="add-type">
            <h2>Thêm loại sản phẩm</h2>
            <form action="/pages/type/add.php" method="post">
                <input type="text" name="name" placeholder="Tên loại" required>
                <button type="submit">Thêm</button>
            </form>
        </section>';
        }
        ?>
        <section class="type-list">
            <h2>Danh sách loại sản phẩm</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên loại</th>
                        <?php
                        if (!is_guest()) {
                            echo '<th>Hành động</th>';
                        }
                        ?>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $sql = "SELECT * FROM phonetype;";
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                            echo "<tr>
                                <td>" . $row["id"] . "</td>
                                <td>" . $row["name"] . "</td>";
                            if (!is_guest()) {
                            echo "<td class='actions'>
                                    <a href='/?page=editType&id=" . $row["id"] . "' class='edit-btn'>Sửa</a>
                                    <a href='#' onclick=\"deleteSubmit('" . $row["id"] . "')\" class='delete-btn'>Xóa</a>
                                </td>";
                            }
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='4'>Không có loại sản phẩm nào</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </section>
    </main>
</body>
<?php
    if (!is_guest()) {
    echo "<script>
        function deleteSubmit(id) {
            if (confirm('Bạn có muốn xóa id [' + id + '] không?')) {
                window.location.href = '/pages/type/delete.php?id=' + id;
            }
        }
    </script>";
    }
?>
</html>
