-- Tạo bảng sản phẩm
USE SAMPLEDB;

CREATE TABLE PRODUCT (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    price DECIMAL(10, 2) NOT NULL,
    size VARCHAR(50),
    color VARCHAR(50),
    stock_quantity INT,
    image_url VARCHAR(255)
);

-- Thêm dữ liệu vào bảng sản phẩm
INSERT INTO PRODUCT (product_name, category, price, size, color, stock_quantity, image_url) 
VALUES
    ('Áo sơ mi nam', 'Áo', 250000.00, 'M', 'Trắng', 100, '/products/ao_thun_nam.png'),
    ('Áo phông nữ', 'Áo', 150000.00, 'L', 'Đen', 200, '/products/ao_phong_nu.jpg'),
    ('Quần jean nam', 'Quần', 350000.00, '32', 'Xanh dương', 150, '/products/quan_jean_nam.jpg'),
    ('Váy đầm nữ', 'Váy', 400000.00, 'S', 'Đỏ', 80, '/products/vay_dam_nu.jpg'),
    ('Áo khoác nam', 'Áo', 500000.00, 'L', 'Xám', 60, '/products/ao_khoac_nam.jpg'),
    ('Quần short nữ', 'Quần', 180000.00, 'M', 'Hồng', 120, '/products/quan_short_nu.png'),
    ('Áo thun nam', 'Áo', 200000.00, 'XL', 'Xanh lá', 90, '/products/ao_thun_nam.png'),
    ('Quần âu nữ', 'Quần', 450000.00, 'S', 'Đen', 50, '/products/quan_au_nu.jpg');

-- Truy vấn lấy tất cả sản phẩm trong bảng
SELECT * FROM PRODUCT;