<?php
include 'config/check_login.php';
include 'config/db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $model = $_POST['model'];
    $producer = $_POST['producer'];
    $phonetype = $_POST['phonetype'];
    $quantity = $_POST['quantity'];
    $price = $_POST['price'];

    $sql = "UPDATE phones SET name='$name', model='$model', producer_id='$producer', phonetype_id='$phonetype', quantity = '$quantity', price='$price' WHERE id=$id";

    if (!$conn->query($sql)) {
        echo "Error updating record: " . $conn->error;
        die();
    }

    $conn->close();

    echo "<script>window.location.href='/?page=phone';</script>";
    exit();
} else {
    $id = $_GET['id'];
    $sql = "SELECT * FROM phones WHERE id=$id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
    } else {
        echo "Record not found";
        die();
    }
}
?>

<link rel="stylesheet" href="/pages/phone/styles.css">
<main>
    <section class="edit-phone">
        <h2>Sửa thông tin điện thoại</h2>
        <form action="/?page=editPhone" method="post">
            <div>
                <label for="id">ID</label><br>
                <input type="text" name="id" value="<?php echo $row['id']; ?>" size="1" readonly>
            </div>
            
            <div>
            <label for="name">Tên điện thoại</label><br>
                <input type="text" id="name" name="name" placeholder="Tên điện thoại" value="<?php echo $row['name']; ?>" required>
            </div>
            <div>
                <label for="model">Mẫu</label><br>
                <input type="text" id="model" name="model" placeholder="Mẫu" value="<?php echo $row['model']; ?>" required>
            </div>
            <div>
                <label for="producer">Nhà sản xuất</label><br>
                <select name="producer">
                    <?php
                        $sql = "SELECT id, name FROM producer;";
                        $result = $conn->query($sql);
    
                        if ($result->num_rows > 0) {
                            while($r = $result->fetch_assoc()) {
                                echo '<option value="' . $r['id'] . '"' . ($row['producer_id'] == $r['id'] ? 'selected="selected"' : '') . '>' . $r['name'] . '</option>';
                            }
                        } else {
                            echo "<option value=\"0\">null</option>";
                        }   
                    ?>
                </select>
            </div>
            <div>
                <label for="phonetype">Loại</label><br>
                <select name="phonetype">
                    <?php
                        $sql = "SELECT id, name FROM phonetype;";
                        $result = $conn->query($sql);
    
                        if ($result->num_rows > 0) {
                            while($r = $result->fetch_assoc()) {
                                echo '<option value="' . $r['id'] . '"' . ($row['phonetype_id'] == $r['id'] ? 'selected="selected"' : '') . '>' . $r['name'] . '</option>';
                            }
                        } else {
                            echo "<option value=\"0\">null</option>";
                        }   
                    ?>
                </select>
            </div>
            <div>
                <label for="quantity">Số lượng</label><br>
                <input type="number" id="quantity" name="quantity" placeholder="Số lượng" value="<?php echo $row['quantity']; ?>" size="1" required>
            </div>
            <div>
                <label for="price">Giá</label><br>
                <input type="number" id="price" name="price" placeholder="Giá" value="<?php echo round($row['price'], 0); ?>" size="5" required>
            </div>
            <button type="submit">Sửa</button>
        </form>
    </section>
</main>
