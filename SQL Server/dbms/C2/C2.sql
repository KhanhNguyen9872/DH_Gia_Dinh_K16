-- 221402 - KhanhNguyen9872

use master;
ALTER DATABASE QLGH SET OFFLINE WITH ROLLBACK IMMEDIATE;
ALTER DATABASE QLGH SET ONLINE;

DROP DATABASE QLGH;


CREATE DATABASE QLGH;
GO
use QLGH;
GO

CREATE TABLE KHACHHANG
(
	MAKHACHHANG VARCHAR(255) PRIMARY KEY,
	TENCONGTY NVARCHAR(255),
	TENGIAODICH NVARCHAR(255),
	DIACHI NVARCHAR(255),
	EMAIL VARCHAR(255),
	DIENTHOAI CHAR(10),
	FAX CHAR(20)
)

CREATE TABLE NHACUNGCAP
(
	MACONGTY NVARCHAR(255) PRIMARY KEY,
	TENCONGTY NVARCHAR(255),
	TENGIAODICH NVARCHAR(255),
	DIACHI NVARCHAR(255),
	DIENTHOAI CHAR(10),
	FAX CHAR(20),
	EMAIL VARCHAR(50)
)

CREATE TABLE LOAIHANG
(
	MALOAIHANG VARCHAR(255) PRIMARY KEY,
	TENLOAIHANG NVARCHAR(255)
)

CREATE TABLE MATHANG
(
	MAHANG VARCHAR(255) PRIMARY KEY,
	TENHANG NVARCHAR(255),
	MACONGTY NVARCHAR(255),
	MALOAIHANG VARCHAR(255),
	SOLUONG INT,
	DONVITINH NVARCHAR(255),
	GIAHANG DECIMAL(10,2),

	FOREIGN KEY(MACONGTY) REFERENCES NHACUNGCAP(MACONGTY),
	FOREIGN KEY(MALOAIHANG) REFERENCES LOAIHANG(MALOAIHANG)
)

CREATE TABLE NHANVIEN(
	MANHANVIEN VARCHAR(255) PRIMARY KEY,
	HO CHAR(20),
	TEN CHAR(20),
	NGAYSINH DATE,
	NGAYLAMVIEC DATE,
	DIACHI NVARCHAR(255),
	DIENTHOAI CHAR(10),
	LUONGCOBAN DECIMAL(10,2),
	PHUCAP DECIMAL(10,2)
)

CREATE TABLE DONDATHANG
(
	SOHOADON INT PRIMARY KEY,
	MAKHACHHANG VARCHAR(255),
	MANHANVIEN VARCHAR(255),
	NGAYDATHANG DATE,
	NGAYGIAOHANG DATE DEFAULT(GETDATE()),
	NGAYCHUYENHANG DATE,
	NOIGIAOHANG NVARCHAR(255),

	FOREIGN KEY(MAKHACHHANG) REFERENCES KHACHHANG(MAKHACHHANG),
	FOREIGN KEY(MANHANVIEN) REFERENCES NHANVIEN(MANHANVIEN)
)

CREATE TABLE CHITIETDATHANG
(
	SOHOADON VARCHAR(10),
	MAHANG VARCHAR(255),
	GIABAN DECIMAL(10, 2),
	SOLUONG INT,
	MUCGIAMGIA CHAR(10),

	PRIMARY KEY(SOHOADON, MAHANG),
	FOREIGN KEY(MAHANG) REFERENCES MATHANG(MAHANG)
)


INSERT INTO NHACUNGCAP 
	(MACONGTY, TENCONGTY, TENGIAODICH, DIACHI, DIENTHOAI, FAX, EMAIL)
VALUES 
	('NCC001', N'Nhà Cung Cấp iphone', 'Công ty tinh 1 TV iphone', '789 Đường CMT8, TP.HCM', '0123456789', '987654', 'iphone@gmail.com'),
	('NCC091',N'Nhà Cung Cấp SamSung','Công ty tinh 1 TV SamSung','123 Đường CMT8, TP.HCM','0123457891','123456','SamSung@gmail.com')


INSERT INTO KHACHHANG 
	(MAKHACHHANG, TENCONGTY, TENGIAODICH, DIACHI, EMAIL, DIENTHOAI, FAX)
VALUES 
	('KH001', N'Công ty điện thoại ', 'Bphone', N'Địa chỉ 29 Lê Văn Thọ, TP.HCM', 'Bphone@gmail.com', '1234567890', 'FAX123'),
	('KH002', N'Công ty điện thoại ', 'SamPhone', N'Địa chỉ 10 Nguyễn Văn Quá, TP.HCM ', 'SamPhone@gmail.com', '0987654321', 'FAX456')


INSERT INTO LOAIHANG 
	(MALOAIHANG, TENLOAIHANG)
VALUES 
	('SP01', 'Iphone x'),
       ('SP02', 'SumSung S20 ')


INSERT INTO MATHANG 
	(MAHANG, TENHANG, MACONGTY, MALOAIHANG, SOLUONG, DONVITINH, GIAHANG)
VALUES
	('SP01', 'Iphone ', 'NCC001', 'SP01', 200, 'Cái', 150.00),
	('SP02', 'SamSung', 'NCC091','SP02', 20, 'Cái', 50.00)


INSERT INTO NHANVIEN 
	(MANHANVIEN, HO, TEN, NGAYSINH, NGAYLAMVIEC, DIACHI, DIENTHOAI, LUONGCOBAN, PHUCAP)
VALUES 
	('NV001', N'Nguyễn', N'Văn Báo', '1990-01-01', '2020-01-01', 'Địa chỉ 192 CMT8, TP.HCM', '1111111111', 1000.00, 200.00),
	('NV002', N'Trần', N'Thị Sương ', '1995-05-05', '2021-02-01', 'Địa chỉ 191 CMT8, TP.HCM', '2222222222', 1200.00, 250.00)


INSERT INTO DONDATHANG 
	(SOHOADON, MAKHACHHANG, MANHANVIEN, NGAYDATHANG, NGAYGIAOHANG, NGAYCHUYENHANG, NOIGIAOHANG)
VALUES 
	(1, 'KH001', 'NV001', '2024-04-10', '2024-04-15', '2024-04-13', '192 CMT8, TP.HCM'),
	(2, 'KH002', 'NV002', '2024-04-11', '2024-04-16', '2024-04-14', '191 CMT8, TP.HCM')


INSERT INTO CHITIETDATHANG 
	(SOHOADON, MAHANG, GIABAN, SOLUONG, MUCGIAMGIA)
VALUES 
	(1, 'SP01', 150.00, 20, '10%'),
	(1, 'SP02', 30.00, 3, '0%'),
	(2, 'SP01', 150.00, 4, '0%')

-- 1. Xét mặc định số 1 cho cột SOLUONG của bảng CHITIETDATHANG và 0 cho cột MUCGIAMGIA 

ALTER TABLE CHITIETDATHANG ADD DEFAULT 1 FOR SOLUONG
ALTER TABLE CHITIETDATHANG ADD DEFAULT 0 FOR MUCGIAMGIA

-- 2. Bo sung cho bảng DonDatHang ràng buộc kiểm tra ngày giao hàng và ngày chuyển hàng phải sau hoặc bằng với ngày đặt hàng.

ALTER TABLE DonDatHang ADD CONSTRAINT CK_NgayGiaoHang_NgayChuyenHang CHECK (NGAYGIAOHANG >= NGAYDATHANG AND NGAYCHUYENHANG >= NGAYDATHANG)

-- 3. Bổ sung ràng buộc cho bảng NhanVien để đảm bảo rằng một nhân viên chỉ có thể làm việc trong công ty khi đủ 18 tuổi và dưới 60 tuổi.

ALTER TABLE NhanVien ADD CONSTRAINT CK_TuoiNhanVien CHECK (DATEDIFF(YEAR, NgaySinh, GETDATE()) >= 18 AND DATEDIFF(YEAR, NgaySinh, GETDATE()) < 60)

-- 4. Với các bảng đã tạo được, câu lệnh: DROP TABLE NhaCungCap có thể thực hiện được không? Tại sao?

DROP TABLE NHACUNGCAP

/*
	Không thể DROP TABLE NhaCungCap vì nó có khóa ngoại ở bảng mathang tham chiếu đến bảng nhacungcap
*/

-- 5. Cho khung nhìn được định nghĩa như sau:  
/*
CREATE VIEW view_donhang
AS
	SELECT DOH.sohoadon, makhachhang, manhanvien,ngaydathang,ngaygiachang, ngaychuyenhang,noigiachang,mahang, giaban, soluong,mucgiangia
	FROM DonDat Hang DDH JOIN ChiTietDathang ON DDH.sohoadon-ChiTietDathang.sohoadon
*/

-- a. Có thể thông qua khung nhìn này để thêm dữ liệu cho bảng DonDatHang được không? 
/*
	Không thể thêm dữ liệu trực tiếp vào bảng DonDatHang thông qua khung nhìn view_donhang. 
*/

-- b. Có thể thông qua khung nhìn này để thêm dữ liệu cho bảng ChiTietDathang được không?
/*
	Tương tự như trên chúng ta không thể thêm dữ liệu cho bảng ChiTietDatHang
*/

-- 6. Cho khung nhìn được định nghĩa như sau:  
/*
CREATE VIEW view_donhang 
AS
	SELECT DDH.sohoadon,makhachhang,manhanvien,ngaydathang,ngaygiaohang,ngaychuyenhang,noigiaohang,mahang,giaban*soluong as thanh tien, mucgiamgia
	FROM DonDatHang DDH JOIN ChiTietDathang ON DDH.sohoadon=ChiTietDathang.sohoadon
*/

-- a. Có thể thông qua khung nhìn này để xóa hay cập nhật dữ liệu cho bảng DonDatHang được không
/*
	Không thể xóa hay cập nhật trực tiếp vào bảng DonDatHang thông qua khung nhìn view_donhang. 
*/

-- b. Có thể thông qua khung nhìn này để xóa hay cập nhật dữ liệu cho bảng ChiTietDathang được không?
/*
	Tương tự như trên chúng ta không thể xóa hay cập nhật dữ liệu cho bảng ChiTietDatHang
*/

-- 7. Tạo khung nhìn view_sanpham_soluong cho biết những mặt hàng hiện có số lượng trên 50

go
CREATE VIEW view_sanpham_soluong
AS
	SELECT MAHANG, TENHANG, SOLUONG
	FROM MATHANG
	WHERE SOLUONG > 50

-- 8. Cập nhật giá hàng giảm 5% cho mặt hàng có mã là ’SP01’ vào view_sanpham_soluong.

UPDATE MATHANG
SET GIAHANG = GIAHANG * 0.95 
WHERE MAHANG = 'SP01'

-- 9. Tạo khung nhìn view_mucgiamgia dùng liệt kê các mặt hàng có mức giảm giá trên 5% trongmỗi hóa đơn.

go
CREATE VIEW view_mucgiamgia 
AS
	SELECT SOHOADON, MAHANG, MUCGIAMGIA
	FROM CHITIETDATHANG
	WHERE CAST(REPLACE(MUCGIAMGIA, '%', '') AS DECIMAL(5,2)) > 5

-- 10. Cập nhật mức giảm giá là 6% cho mặt hàng mua với số lượng trên 10 vào view_mucgiamgia.

UPDATE view_mucgiamgia
SET MUCGIAMGIA = '6%'
WHERE SOHOADON IN (
	SELECT SOHOADON
	FROM CHITIETDATHANG
	WHERE SOLUONG > 10 
)

-- 11. Tạo khung nhìn view_chi_tiet_dat_hang dùng hiển thị tiền bán trên từng hóa đơn gồm các thông tin: số hóa đơn, ngày đặt, tiền hóa đơn bằng tổng tiền bán từng mặt hàng ghi trên mỗi hóa đơn.

go
CREATE VIEW view_Chi_Tiet_Dat_Hang
AS
	SELECT DONDATHANG.SOHOADON, DONDATHANG.NGAYDATHANG, SUM(CHITIETDATHANG.GIABAN * CHITIETDATHANG.SOLUONG) AS TIENHOADON
	FROM DONDATHANG
	JOIN CHITIETDATHANG ON DONDATHANG.SOHOADON = DONDATHANG.SOHOADON
	GROUP BY DONDATHANG.SOHOADON, DONDATHANG.NGAYDATHANG

-- 12. Tạo khung nhìn dùng hiển thị các thông tin sau: số hóa đơn, mã mặt hàng, tên mặt hàng, số lượng, giá hàng, tổng tiền. Và chỉ liệt kê các mặt hàng của công ty có mã là ’NCC091.

go
CREATE VIEW view_mathang_NCC091
AS
	SELECT DONDATHANG.SOHOADON, CHITIETDATHANG.MAHANG, MATHANG.TENHANG, CHITIETDATHANG.SOLUONG, MATHANG.GIAHANG, CHITIETDATHANG.GIABAN * CHITIETDATHANG.SOLUONG AS TONGTIEN
	FROM DONDATHANG
	JOIN CHITIETDATHANG ON DONDATHANG.SOHOADON = CHITIETDATHANG.SOHOADON 
	JOIN MATHANG ON CHITIETDATHANG.MAHANG = MATHANG.MAHANG
	WHERE MATHANG.MACONGTY = 'NCC091'
