<?php
include 'config/check_login.php';
include 'config/db.php';

function getNameProducer($conn, $producerid) {
    $name = "";
    $sql = "SELECT name FROM producer where id = '$producerid';";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while($r = $result->fetch_assoc()) {
            $name = $r['name'];
            break; 
        }
    } else {
        $name = "null";
    }
    return $name;
}

function getNamePhoneType($conn, $phonetypeid) {
    $name = "";
    $sql = "SELECT name FROM phonetype where id = '$phonetypeid';";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while($r = $result->fetch_assoc()) {
            $name = $r['name'];
            break; 
        }
    } else {
        $name = "null";
    }
    return $name;
}

?>
<head>
<link rel="stylesheet" href="/pages/phone/styles.css">
</head>
<body>
    <main>
        <?php
        if (!is_guest()) {
            echo '<section class="add-phone">
            <h2>Thêm điện thoại mới</h2>
            <form action="/pages/phone/add.php" method="post">
                <input type="text" name="name" placeholder="Tên điện thoại" size="15" required>
                <input type="text" name="model" placeholder="Mẫu" size="5" required>
                <select name="producer">';

                    $sql = "SELECT id, name FROM producer;";
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                            echo '<option value="' . $row['id'] . '">' . $row['name'] . '</option>';
                        }
                    } else {
                        echo "<option value=\"0\">null</option>";
                    }   
            
            echo '</select>
                <select name="phonetype">';

                    $sql = "SELECT id, name FROM phonetype;";
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                            echo '<option value="' . $row['id'] . '">' . $row['name'] . '</option>';
                        }
                    } else {
                        echo "<option value=\"0\">null</option>";
                    }   
                    
            echo '</select>
                <input type="number" name="quantity" placeholder="Số lượng" size="1" required>
                <input type="number" name="price" placeholder="Giá (VND)" required>
                <button type="submit">Thêm</button>
            </form>
        </section>';
        }
        ?>
        
        <section class="phone-list">
            <h2>Danh sách điện thoại</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên</th>
                        <th>Mẫu</th>
                        <th>Nhà sản xuất</th>
                        <th>Loại</th>
                        <th>Số lượng</th>
                        <th>Đơn giá</th>
                        <?php
                            if(is_staff()) {
                                echo '<th>Hành động</th>';
                            }
                        ?>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $sql = "SELECT * FROM phone;";
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                            echo "<tr>
                                <td>" . $row["id"] . "</td>
                                <td>" . $row["name"] . "</td>
                                <td>" . $row["model"] . "</td>
                                <td>" . getNameProducer($conn, $row['producer_id']) . "</td>
                                <td>" . getNamePhoneType($conn, $row['phonetype_id']) . "</td>
                                <td>" . $row["quantity"] . "</td>
                                <td>" . round($row["price"], 0) . " VND</td>";
                                if (!is_guest()) {
                                    echo "<td class='actions'>
                                    <a href='/?page=editPhone&id=" . $row["id"] . "' class='edit-btn'>Sửa</a>
                                    <a href='#' onclick=\"deleteSubmit('" . $row["id"] . "')\" class='delete-btn'>Xóa</a>
                                    </td>";
                                }
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='4'>Không có điện thoại nào</td></tr>";
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
                window.location.href = '/pages/phone/delete.php?id=' + id;
            }
        }
    </script>";
    }
?>
</html>
