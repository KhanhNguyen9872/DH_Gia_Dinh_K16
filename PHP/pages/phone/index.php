<?php
include 'config/check_login.php';
include 'config/db.php';

$current_page = isset($_GET["list"]) ? intval($_GET["list"]) : redirect("/?page=phone&list=1");

$sql = "select count(id) as total from phone;";
$result = $conn->query($sql);

$total_id = $result->fetch_assoc()["total"];

$limit = 10;

$total_page = ceil($total_id / $limit);

$offset = ($current_page - 1) * $limit;

if (($current_page < 1) || ($current_page > $total_page)) {
    redirect("/?page=phone&list=1");
}

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

if (($_SERVER['REQUEST_METHOD'] == 'POST') && ($_POST["name"] != "")) {
    $name = $_POST["name"];
    $sql = "SELECT * FROM phone WHERE `name` like '%$name%'";   
} else {
    $sql = "SELECT * FROM phone order by id LIMIT $limit OFFSET $offset;";
}
$result_table = $conn->query($sql);

?>
<head>
<link rel="stylesheet" href="/pages/phone/styles.css">
</head>
<body>
    <?php
        if (!is_guest()) {
            echo '<section class="add-phone">
            <h2>Thêm điện thoại mới</h2>
            <form action="/pages/phone/add.php" method="post" enctype="multipart/form-data">
                <input type="text" name="name" placeholder="Tên điện thoại" size="15" required>
                <input type="text" name="model" placeholder="Mẫu" size="5" required>
                <select name="producer">';

                    $sql = "SELECT id, name FROM producer order by id;";
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
                <input type="file" name="img" id="img" accept="image/*">
                <button type="submit" value="upload">Thêm</button>
            </form>
        </section><hr>';
        }
    ?>
        

        <section class="add-phone">
            <h2>Tìm kiếm</h2>
            <form action="" method="post">
                <input type="text" name="name" placeholder="Tên điện thoại" size="15">
                <button type="submit">Tìm kiếm</button>
            </form>
        </section>
        <hr>
        <section class="phone-list">
            <h2>Danh sách điện thoại</h2>
            <table>
                <thead>
                    <tr>
                        <?php
                            if (is_guest()) {
                                echo '<th style="width:50px;">ID</th>
                                <th style="width:200px;">Tên</th>
                                <th style="width:130px;">Mẫu</th>
                                <th style="width:130px;">Nhà sản xuất</th>
                                <th style="width:130px;">Loại</th>
                                <th style="width:110px;">Số lượng</th>
                                <th style="width:150px;">Đơn giá</th>
                                <th>Ảnh</th>';
                            } else {
                                echo '<th style="width:20px;">ID</th>
                                <th style="width:160px;">Tên</th>
                                <th style="width:80px;">Mẫu</th>
                                <th style="width:100px;">Nhà sản xuất</th>
                                <th style="width:110px;">Loại</th>
                                <th style="width:90px;">Số lượng</th>
                                <th style="width:150px;">Đơn giá</th>
                                <th>Ảnh</th>
                                <th>Hành động</th>';
                            }
                        ?>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($result_table->num_rows > 0) {
                        while($row = $result_table->fetch_assoc()) {
                            echo "<tr>
                                <td>" . $row["id"] . "</td>
                                <td>" . $row["name"] . "</td>
                                <td>" . $row["model"] . "</td>
                                <td>" . getNameProducer($conn, $row['producer_id']) . "</td>
                                <td>" . getNamePhoneType($conn, $row['phonetype_id']) . "</td>
                                <td>" . $row["quantity"] . "</td>
                                <td>" . number_format(round($row["price"], 0), 0, '', '.') . " VND</td>
                                <td><img src=\"/upload/img/phone/" . $row["img"] . "\" alt=\"phone\" width=\"60\" height=\"60\" onclick=\"window.open(this.src)\"></td>";
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
            <div class="text-center">
                <nav aria-label="Page navigation " style="border-radius:0xpx;">
                <ul class="pagination " style="box-shadow: 0px 0px 10px aqua; border-radius: 0px;">
                    <?php if ($current_page > 1 && $total_page > 1): ?>
                    <li class="page-item"><a class="page-link" href="/?page=phone&list=1">Trang đầu</a></li>
                    <?php endif; ?>

                    <?php for ($i = 1; $i <= $total_page; $i++): ?>
                    <?php if ($i == $current_page): ?>
                        <li class="page-item active">
                        <span class="page-link"><?php echo $i; ?></span>
                        </li>
                    <?php else: ?>
                        <li class="page-item">
                        <a class="page-link" href="/?page=phone&list=<?php echo $i; ?>"><?php echo $i; ?></a>
                        </li>
                    <?php endif; ?>
                    <?php endfor; ?>

                    <?php if ($current_page < $total_page && $total_page > 1): ?>
                    <li class="page-item"><a class="page-link" href="/?page=phone&list=<?php echo $total_page; ?>">Trang cuối</a></li>
                    <?php endif; ?>
                </ul>
                </nav>
            </div>
            
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
