<?php
include 'config/check_login.php';
include 'config/db.php';

?>
<head>
<link rel="stylesheet" href="/pages/producer/styles.css">
</head>
<body>
    <main>
        <?php
        if (!is_guest()) {
            echo '<section class="add-producer">
            <h2>Thêm nhà sản xuất</h2>
            <form action="/pages/producer/add.php" method="post">
                <input type="text" name="name" placeholder="Tên nhà sản xuất" required>
                <input type="email" name="email" placeholder="Email" required>
                <button type="submit">Thêm</button>
            </form>
        </section>';
        }
        ?>
        <section class="producer-list">
            <h2>Danh sách nhà sản xuất</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên nhà sản xuất</th>
                        <th>Email</th>
                        <?php 
                            if (is_staff()) {
                                echo '<th>Hành động</th>';
                            }
                        ?>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $sql = "SELECT * FROM producer;";
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                            echo "<tr>
                                <td>" . $row["id"] . "</td>
                                <td>" . $row["name"] . "</td>
                                <td>" . $row["email"] . "</td>";
                            if (!is_guest()) {
                                echo "<td class='actions'>
                                    <a href='/?page=editProducer&id=" . $row["id"] . "' class='edit-btn'>Sửa</a>
                                    <a href='#' onclick=\"deleteSubmit('" . $row["id"] . "')\" class='delete-btn'>Xóa</a>
                                </td>";
                            }
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='4'>Không có nhà sản xuất nào</td></tr>";
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
                window.location.href = '/pages/producer/delete.php?id=' + id;
            }
        }
    </script>";
    }
?>
</html>
