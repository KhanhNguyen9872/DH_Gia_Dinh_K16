-- 221402 - KhanhNguyen9872

use master;
ALTER DATABASE Nhom1 SET OFFLINE WITH ROLLBACK IMMEDIATE;
ALTER DATABASE Nhom1 SET ONLINE;

DROP DATABASE Nhom1;

create database Nhom1;
go
use Nhom1;
go

CREATE TABLE LoaiLinhKien(
	MaLoaiLK NVARCHAR(10) PRIMARY KEY,
	TenLoaiLK NVARCHAR(255) NOT NULL,
	NgayTao DATE not null,
	NgayCapNhat DATE not null
);

CREATE TABLE NhaCungCap(
	MaNhaCungCap NVARCHAR(10) PRIMARY KEY,
	TenNhaCungCap NVARCHAR(255) NOT NULL,
	Email VARCHAR(255) NOT NULL
);

CREATE TABLE LinhKien(
	MaLK NVARCHAR(10) PRIMARY KEY,
	MaNhaCungCap NVARCHAR(10),
	MaLoaiLK NVARCHAR(10),
	TenLK NVARCHAR(100) NOT NULL,
	Gia bigint NOT NULL DEFAULT 0,
	BaoHanh tinyint NOT NULL DEFAULT 0,
	KhuyenMai tinyint NOT NULL DEFAULT 0,
	MoTa NVARCHAR(255) NOT NULL DEFAULT N'',
	HinhAnh NVARCHAR(255) NOT NULL 
	FOREIGN KEY (MaLoaiLK) REFERENCES LoaiLinhKien(MaLoaiLK),
	FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap)
	ON DELETE CASCADE
);

CREATE TABLE NhanVien(
	MaNV NVARCHAR(10) PRIMARY KEY,
	TenNV NVARCHAR(30) NOT NULL,
	DiaChi NVARCHAR(50) NOT NULL,
	SDT NVARCHAR(10) NOT NULL,
	Email NVARCHAR(50),
	LaNhanSu int default 0
);

CREATE TABLE KhachHang(
	MaKH NVARCHAR(10) PRIMARY KEY,
	TenKH NVARCHAR(30) NOT NULL,
	DiaChi NVARCHAR(50) NOT NULL,
	SDT NVARCHAR(10) NOT NULL,
	Email NVARCHAR(50)
);

CREATE TABLE DonDatHang(
	MaDH NVARCHAR(10) PRIMARY KEY,
	MaKH NVARCHAR(10),
	MaNV NVARCHAR(10),
	NgayDatHang DATE NOT NULL,
	NgayGiaoHang DATE NOT NULL,
	NoiNhan NVARCHAR(50) NOT NULL,
	TongTien BIGINT NOT NULL DEFAULT 0,
	FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
	FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
	ON DELETE CASCADE
);

CREATE TABLE ChiTietDatHang(
	MaDH NVARCHAR(10),
	MaLK NVARCHAR(10),
	SoLuong INT NOT NULL DEFAULT 1,
	BaoHanh tinyint NOT NULL DEFAULT 0,
	KhuyenMai tinyint NOT NULL DEFAULT 0,
	ThanhTien BIGINT NOT NULL DEFAULT 0,
	FOREIGN KEY (MaDH) REFERENCES DonDatHang(MaDH),
    FOREIGN KEY (MaLK) REFERENCES LinhKien(MaLK)
	ON DELETE CASCADE
);

CREATE TABLE PhuongThucThanhToan(
	MaPhuongThuc NVARCHAR(10) PRIMARY KEY,
	LoaiThanhToan NVARCHAR(255) NOT NULL UNIQUE,
	SoTaiKhoan NVARCHAR(255) DEFAULT N''
);

CREATE TABLE ThongTinThanhToan(
	MaDH NVARCHAR(10) NOT NULL,
	TinhTrang bit default 0,
	MaPhuongThuc NVARCHAR(10) NOT NULL,
	NgayThanhToan date default null,
	FOREIGN KEY (MaDH) REFERENCES DonDatHang(MaDH),
	FOREIGN KEY (MaPhuongThuc) REFERENCES PhuongThucThanhToan(MaPhuongThuc)
);


--Nhà cung cấp
GO
INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap, Email) VALUES 
('NCC001', 'INTEL', 'Intel@gmail.com'),
('NCC002', 'AMD', 'AMD@gmail.com'),
('NCC003', 'Western Digital', 'WD@gmail.com'),
('NCC004', 'CORSAIR', 'Corsair@gmail.com'),
('NCC005', 'ASUS', 'ASUS@gmail.com'),
('NCC006', 'GIGABYTE', 'GIGABYTE@gmail.com'),
('NCC007', 'Seagate', 'Seagate@gmail.com');

GO
--Loại mặt hàng
INSERT INTO LoaiLinhKien (MaLoaiLK, TenLoaiLK, NgayTao, NgayCapNhat) VALUES 
	(N'CPU', N'Bộ vi xử lý','2024-06-27','2024-06-27'),
	(N'RAM', N'Bộ nhớ trong','2024-06-27','2024-06-27'),
	(N'VGA', N'Card màn hình','2024-06-27','2024-06-27'),
	(N'MAIN', N'Bo mạch chủ','2024-06-27','2024-06-27'),
	(N'PSU', N'Bộ nguồn','2024-06-27','2024-06-27'),
	(N'SSD', N'Ổ cứng SSD','2024-06-27','2024-06-27'),
	(N'HDD', N'Ổ cứng HDD','2024-06-27','2024-06-27');
go
--Mặt Hàng

INSERT INTO LinhKien (MaLK, MaNhaCungCap, MaLoaiLK, TenLK, Gia, BaoHanh, KhuyenMai, MoTa, HinhAnh) VALUES 
--CPU
('MH001', 'NCC001', 'CPU', 'i5-10500K', 3000000, 12, 0, N'Intel Core i5 thế hệ 10, hiệu năng cao, phù hợp cho các tác vụ văn phòng và giải trí.','i5 10500k.png'),
('MH002', 'NCC001', 'CPU', 'i5-12600K', 6000000, 12, 0, N'Intel Core i5 thế hệ 12, cải tiến hiệu năng và tiết kiệm năng lượng.', 'i5 12600k.png'),
('MH003', 'NCC001', 'CPU', 'i7-14700K', 10000000, 12, 0, N'Intel Core i7 thế hệ 14, mạnh mẽ cho các tác vụ đồ họa và gaming.', 'i7 14700k.png'),
('MH004', 'NCC001', 'CPU', 'i5 10600k', 3000000, 12, 0, N'Intel Core i5 thế hệ 10, hiệu năng ổn định, phù hợp cho công việc và giải trí.', 'i5 10600k.png'),
('MH005', 'NCC002', 'CPU', 'R7 7780HS', 8000000, 12, 0, N'AMD Ryzen 7 7780HS, mạnh mẽ và tiết kiệm năng lượng, phù hợp cho các hệ thống laptop hiệu năng cao.', 'r7 7780hs.png'),
('MH006', 'NCC002', 'CPU', 'R7 7800X3D', 9000000, 12, 0, N'AMD Ryzen 7 7800X3D, hiệu năng cao với công nghệ 3D V-Cache.', 'r7 7800X3D.png'),
('MH007', 'NCC002', 'CPU', 'R5 5600X', 4000000, 12, 0, N'AMD Ryzen 5 5600X, hiệu năng cao với giá thành hợp lý.', 'r5 5600X.png'),
('MH008', 'NCC002', 'CPU', 'R5 3600', 3000000, 12, 0, N'AMD Ryzen 5 3600, hiệu năng tốt cho các tác vụ đa nhiệm và gaming.', 'r5 5300.png'),
--RAM
('MH009', 'NCC003', 'RAM', 'Kingston Fury Beast Black 16GB 3200MHz DDR4', 1500000, 12, 0, N'RAM Kingston Fury Beast, dung lượng 16GB, tốc độ 3200MHz, DDR4.', 'Kingston Fury Beast Black 16GB 3200MHz DDR4.png'),
('MH010', 'NCC003', 'RAM', 'Kingston Fury Beast Black 8GB 3200MHz DDR4', 800000, 12, 0, N'RAM Kingston Fury Beast, dung lượng 8GB, tốc độ 3200MHz, DDR4.', 'Kingston Fury Beast Black 8GB 3200MHz DDR4.png'),
('MH011', 'NCC003', 'RAM', 'Kingston Fury Beast RGB 16GB 3733MHz DDR4', 1700000, 12, 0, N'RAM Kingston Fury Beast RGB, dung lượng 16GB, tốc độ 3733MHz, DDR4, có đèn RGB.', 'Kingston Fury Beast RGB 16GB 3733MHz DDR4.png'),
('MH012', 'NCC003', 'RAM', 'Kingston Fury Beast RGB 16GB 5600MHz DDR5', 2500000, 12, 0, N'RAM Kingston Fury Beast RGB, dung lượng 16GB, tốc độ 5600MHz, DDR5, có đèn RGB.', 'Kingston Fury Beast RGB 16GB 5600MHz DDR5.png'),
('MH013', 'NCC004', 'RAM', 'Corsair Vengeance LPX 8GB 3200MHz DDR4', 800000, 12, 0, N'RAM Corsair Vengeance LPX, dung lượng 8GB, tốc độ 3200MHz, DDR4.', 'Corsair Vengeance LPX 8GB 3200MHz DDR4.png'),
('MH014', 'NCC004', 'RAM', 'Corsair Vengeance LPX 16GB 3200MHz DDR4', 1600000, 12, 0, N'RAM Corsair Vengeance LPX, dung lượng 16GB, tốc độ 3200MHz, DDR4.', 'Corsair Vengeance LPX 8GB 3200MHz DDR4.png'),
('MH015', 'NCC004', 'RAM', 'Corsair Vengeance 16GB 5200MHz DDR5', 2400000, 12, 0, N'RAM Corsair Vengeance, dung lượng 16GB, tốc độ 5200MHz, DDR5.', 'Corsair Vengeance 16GB 5200MHz DDR5.png'),
('MH016', 'NCC004', 'RAM', 'Corsair Vengeance RGB RS 16GB 3200MHz DDR4', 1800000, 12, 0, N'RAM Corsair Vengeance RGB RS, dung lượng 16GB, tốc độ 3200MHz, DDR4, có đèn RGB.', 'Corsair Vengeance RGB RS 16GB 3200MHz DDR4.png'),
--MAIN
('MH017', 'NCC005', 'MAIN', 'ASUS PRIME B450M-A II', 2200000, 12, 0, N'Mainboard ASUS PRIME B450M-A II, hỗ trợ CPU AMD, kích thước Micro ATX.', 'ASUS PRIME B450M-A II.png'),
('MH019', 'NCC005', 'MAIN', 'ASUS TUF GAMING B550M-PLUS', 3300000, 12, 0, N'Mainboard ASUS TUF GAMING B550M-PLUS, hỗ trợ CPU AMD, thiết kế gaming.', 'ASUS TUF GAMING B550M-PLUS.png'),
('MH020', 'NCC005', 'MAIN', 'Asus PRIME B760M-A WIFI', 4000000, 12, 0, N'Mainboard Asus PRIME B760M-A WIFI, hỗ trợ CPU Intel, tích hợp WiFi.', 'Asus PRIME B760M-A WIFI.png'),
('MH021', 'NCC006', 'MAIN', 'Gigabyte A620M GAMING X', 3000000, 12, 0, N'Mainboard Gigabyte A620M GAMING X, hỗ trợ CPU AMD, thiết kế gaming.', 'Gigabyte A620M GAMING X.png'),
('MH022', 'NCC006', 'MAIN', 'Gigabyte B760M GAMING WIFI PLUS DDR4', 4200000, 12, 0, N'Mainboard Gigabyte B760M GAMING WIFI PLUS, hỗ trợ CPU Intel, tích hợp WiFi, DDR4.', 'Gigabyte B760M GAMING WIFI PLUS DDR4.png'),
('MH023', 'NCC006', 'MAIN', 'Gigabyte B550M AORUS ELITE AX', 3800000, 12, 0, N'Mainboard Gigabyte B550M AORUS ELITE AX, hỗ trợ CPU AMD, thiết kế gaming.', 'Gigabyte B550M AORUS ELITE AX.png'),
('MH024', 'NCC006', 'MAIN', 'Gigabyte Z790 A ELITE AX ICE', 6000000, 12, 0, N'Mainboard Gigabyte Z790 A ELITE AX ICE, hỗ trợ CPU Intel, thiết kế cao cấp.', 'Gigabyte Z790 A ELITE AX ICE.png'),
--VGA
('MH025', 'NCC006', 'VGA', 'Gigabyte GeForce RTX 3050 WINDFORCE OC 6G GDDR6', 8000000, 12, 0, N'Card đồ họa Gigabyte GeForce RTX 3050, 6GB GDDR6, thiết kế WINDFORCE OC.', 'Gigabyte GeForce RTX 3050 WINDFORCE OC 6G GDDR6.png'),
('MH026', 'NCC006', 'VGA', 'Gigabyte Radeon RX 6600 EAGLE 8G GDDR6', 7000000, 12, 0, N'Card đồ họa Gigabyte Radeon RX 6600, 8GB GDDR6, thiết kế EAGLE.', 'Gigabyte Radeon RX 6600 EAGLE 8G GDDR6.png'),
('MH027', 'NCC006', 'VGA', 'Gigabyte GeForce RTX 3060 GAMING OC 12G GDDR6', 10000000, 12, 0, N'Card đồ họa Gigabyte GeForce RTX 3060, 12GB GDDR6, thiết kế GAMING OC.', 'Gigabyte GeForce RTX 3060 GAMING OC 12G GDDR6.png'),
('MH028', 'NCC006', 'VGA', 'Gigabyte GeForce RTX 4060 WINDFORCE OC 8G GDDR6', 12000000, 12, 0, N'Card đồ họa Gigabyte GeForce RTX 4060, 8GB GDDR6, thiết kế WINDFORCE OC.', 'Gigabyte GeForce RTX 4060 WINDFORCE OC 8G GDDR6.png'),
('MH029', 'NCC005', 'VGA', 'Asus TUF Gaming Radeon RX 7900 XTX OC Edition 24GB GDDR6', 20000000, 12, 0, N'Card đồ họa Asus TUF Gaming Radeon RX 7900 XTX, 24GB GDDR6, thiết kế OC Edition.', 'Asus TUF Gaming Radeon RX 7900 XTX OC Edition 24GB GDDR6.png'),
('MH030', 'NCC005', 'VGA', 'Asus GeForce RTX 3050 DUAL 6GB OC GDDR6', 8000000, 12, 0, N'Card đồ họa Asus GeForce RTX 3050, 6GB GDDR6, thiết kế DUAL OC.', 'Asus GeForce RTX 3050 DUAL 6GB OC GDDR6.png'),
('MH031', 'NCC005', 'VGA', 'ASUS Dual Radeon RX 7600 V2 OC Edition 8GB GDDR6', 10000000, 12, 0, N'Card đồ họa ASUS Dual Radeon RX 7600 V2, 8GB GDDR6, thiết kế OC Edition.', 'ASUS Dual Radeon RX 7600 V2 OC Edition 8GB GDDR6.png'),
('MH032', 'NCC005', 'VGA', 'Asus Dual GeForce RTX 4060 White OC Edition 8GB GDDR6', 13000000, 12, 0, N'Card đồ họa Asus Dual GeForce RTX 4060, 8GB GDDR6, thiết kế White OC Edition.', 'Asus Dual GeForce RTX 4060 White OC Edition 8GB GDDR6.png'),
--PSU
('MH033', 'NCC005', 'PSU', 'ASUS THOR 1200P2 1200W Platinum Full Modula', 5000000, 12, 0, N'Nguồn ASUS THOR 1200P2, công suất 1200W, chuẩn Platinum, Full Modular.', 'ASUS THOR 1200P2 1200W Platinum Full Modula.png'),
('MH034', 'NCC005', 'PSU', 'ASUS TUF Gaming 750W (80 Plus Bronze)', 3000000, 12, 0, N'Nguồn ASUS TUF Gaming, công suất 750W, chuẩn 80 Plus Bronze.', 'ASUS TUF Gaming 750W (80 Plus Bronze).png'),
('MH035', 'NCC005', 'PSU', 'ASUS TUF Gaming 1000W Gold Full Modular PCIe 5.0', 7000000, 12, 0, N'Nguồn ASUS TUF Gaming, công suất 1000W, chuẩn Gold, Full Modular, PCIe 5.0.', 'ASUS TUF Gaming 1000W Gold Full Modular PCIe 5.0.png'),
('MH036', 'NCC005', 'PSU', 'ASUS TUF Gaming 650W (80 Plus Bronze)', 2500000, 12, 0, N'Nguồn ASUS TUF Gaming, công suất 650W, chuẩn 80 Plus Bronze.', 'ASUS TUF Gaming 650W (80 Plus Bronze).png'),
('MH037', 'NCC006', 'PSU', 'GIGABYTE UD850GM PG5 - 80 Plus Gold - Full Modular (850W)', 5500000, 12, 0, N'Nguồn GIGABYTE UD850GM PG5, công suất 850W, chuẩn 80 Plus Gold, Full Modular.', 'GIGABYTE UD850GM PG5 - 80 Plus Gold - Full Modular (850W).png'),
('MH038', 'NCC006', 'PSU', 'GIGABYTE UD850GM - 80 Plus Gold - Full Modular (850W)', 5300000, 12, 0, N'Nguồn GIGABYTE UD850GM, công suất 850W, chuẩn 80 Plus Gold, Full Modular.', 'GIGABYTE UD850GM - 80 Plus Gold - Full Modular (850W).png'),
('MH039', 'NCC006', 'PSU', 'GIGABYTE UD1000GM - 80 Plus Gold - Full Modular (1000W)', 6500000, 12, 0, N'Nguồn GIGABYTE UD1000GM, công suất 1000W, chuẩn 80 Plus Gold, Full Modular.', 'GIGABYTE UD1000GM - 80 Plus Gold - Full Modular (1000W).png'),
('MH040', 'NCC006', 'PSU', 'GIGABYTE AORUS P1200W - 80 Plus Platinum - Full Modular (1200W)', 8000000, 12, 0, N'Nguồn GIGABYTE AORUS P1200W, công suất 1200W, chuẩn 80 Plus Platinum, Full Modular.', 'GIGABYTE AORUS P1200W - 80 Plus Platinum - Full Modular (1200W).png'),
--SSD
('MH041', 'NCC004', 'SSD', 'SSD Corsair MP600 CORE XT 1TB PCIe 4.0 Gen4', 3000000, 12, 0, N'SSD Corsair MP600 CORE XT, dung lượng 1TB, giao tiếp PCIe 4.0 Gen4.', 'SSD Corsair MP600 CORE XT 1TB PCIe 4.0 Gen4.png'),
('MH042', 'NCC004', 'SSD', 'SSD Corsair MP600 PRO LPX 1TB PCIe Gen4 x4 NVMe M.2 SSD', 3500000, 12, 0, N'SSD Corsair MP600 PRO LPX, dung lượng 1TB, giao tiếp PCIe Gen4 x4 NVMe M.2.', 'SSD Corsair MP600 PRO LPX 1TB PCIe Gen4 x4 NVMe M.2 SSD.png'),
('MH043', 'NCC004', 'SSD', 'SSD 480G Corsair Force Series MP510 M.2 NVMe PCIe Gen3 x4 3D-NAND', 2500000, 12, 0, N'SSD Corsair Force Series MP510, dung lượng 480GB, giao tiếp M.2 NVMe PCIe Gen3 x4.', 'SSD 480G Corsair Force Series MP510 M.2 NVMe PCIe Gen3 x4 3D-NAND.png'),
('MH044', 'NCC004', 'SSD', 'SSD Corsair MP700 1TB | M.2 PCIe, Gen 5x4, NVMe 2.0', 4000000, 12, 0, N'SSD Corsair MP700, dung lượng 1TB, giao tiếp M.2 PCIe Gen 5x4, NVMe 2.0.', 'Corsair MP700 1TB  M.2 PCIe, Gen 5x4, NVMe 2.0.png'),
('MH045', 'NCC003', 'SSD', 'SSD Kingston NV2 250GB M.2 PCIe NVMe Gen4', 1500000, 12, 0, N'SSD Kingston NV2, dung lượng 250GB, giao tiếp M.2 PCIe NVMe Gen4.', 'SSD Kingston NV2 250GB M.2 PCIe NVMe Gen4.png'),
('MH046', 'NCC003', 'SSD', 'SSD Kingston NV2 500GB M.2 PCIe NVMe Gen4', 2000000, 12, 0, N'SSD Kingston NV2, dung lượng 500GB, giao tiếp M.2 PCIe NVMe Gen4.', 'SSD Kingston NV2 500GB M.2 PCIe NVMe Gen4.png'),
('MH047', 'NCC003', 'SSD', 'SSD Kingston NV2 1TB M.2 PCIe NVMe Gen4', 3500000, 12, 0, N'SSD Kingston NV2, dung lượng 1TB, giao tiếp M.2 PCIe NVMe Gen4.', 'SSD Kingston NV2 1TB M.2 PCIe NVMe Gen4.png'),
('MH048', 'NCC003', 'SSD', 'SSD Kingston KC3000 1TB M.2 PCIe gen 4 NVMe', 4000000, 12, 0, N'SSD Kingston KC3000, dung lượng 1TB, giao tiếp M.2 PCIe gen 4 NVMe.', 'SSD Kingston KC3000 1TB M.2 PCIe gen 4 NVMe.png'),
--HDD
('MH049', 'NCC007', 'HDD', 'HDD Seagate IronWolf 4TB', 4500000, 12, 0, N'HDD Seagate IronWolf, dung lượng 4TB, phù hợp cho NAS và các hệ thống lưu trữ mạng.', 'HDD Seagate IronWolf 4TB.png'),
('MH050', 'NCC007', 'HDD', 'HDD SEAGATE IronWolf PRO 14TB', 10000000, 12, 0, N'HDD SEAGATE IronWolf PRO, dung lượng 14TB, hiệu suất cao, phù hợp cho doanh nghiệp.', 'HDD SEAGATE IronWolf PRO 14TB.png'),
('MH051', 'NCC007', 'HDD', 'HDD Seagate IronWolf Pro 10TB', 8000000, 12, 0, N'HDD Seagate IronWolf Pro, dung lượng 10TB, thiết kế bền bỉ cho các hệ thống NAS.', 'HDD Seagate IronWolf Pro 10TB.png'),
('MH052', 'NCC007', 'HDD', 'HDD Seagate IronWolf Pro 8TB', 6000000, 12, 0, N'HDD Seagate IronWolf Pro, dung lượng 8TB, hiệu suất cao và độ tin cậy.', 'HDD Seagate IronWolf Pro 8TB.png'),
('MH053', 'NCC003', 'HDD', 'HDD Enterprise Western Digital Ultrastar DC HC550 18TB', 12000000, 12, 0, N'HDD Enterprise Western Digital Ultrastar DC HC550, dung lượng 18TB, hiệu suất cao.', 'HDD Enterprise Western Digital Ultrastar DC HC550 18TB.png'),
('MH054', 'NCC003', 'HDD', 'HDD Enterprise Western Digital Ultrastar DC HC330 10TB', 9000000, 12, 0, N'HDD Enterprise Western Digital Ultrastar DC HC330, dung lượng 10TB, phù hợp cho doanh nghiệp.','HDD Enterprise Western Digital Ultrastar DC HC330 10TB.png'),
('MH055', 'NCC003', 'HDD', 'HDD Enterprise Western Digital Ultrastar DC HC320 8TB', 7000000, 12, 0, N'HDD Enterprise Western Digital Ultrastar DC HC320, dung lượng 8TB, hiệu suất cao.','HDD Enterprise Western Digital Ultrastar DC HC320 8TB.png'),
('MH056', 'NCC003', 'HDD', 'HDD Enterprise Western Digital Ultrastar DC HC550 16TB', 11000000, 12, 0, N'HDD Enterprise Western Digital Ultrastar DC HC550, dung lượng 16TB, thiết kế bền bỉ và hiệu suất cao.', 'HDD Enterprise Western Digital Ultrastar DC HC550 16TB.png');

--Nhân viên
GO
INSERT INTO NhanVien (MaNV, TenNV, DiaChi, SDT, Email, LaNhanSu) VALUES 
(N'NV001', N'Nguyễn Văn Khánh', N'HCM', N'0123456789', N'a@gmail.com', 1),
(N'NV002', N'Trần Thị Thu Hằng', N'Hà Nội', N'0987654321', N'b@gmail.com', 0),
(N'NV003', N'Phạm Quốc Toản', N'Đà Nẵng', N'0912345678', N'c@gmail.com', 0),
(N'NV004', N'Hoàng Văn Nam', N'Cần Thơ', N'0923456789', N'd@gmail.com', 0),
(N'NV005', N'Lê Thị Hoa', N'Hải Phòng', N'0934567890', N'e@gmail.com', 0),
(N'NV006', N'Nguyễn Thị Mai', N'Huế', N'0945678901', N'f@gmail.com', 0),
(N'NV007', N'Bùi Văn Tú', N'Vũng Tàu', N'0956789012', N'g@gmail.com', 0),
(N'NV008', N'Phan Thị Lan', N'Nha Trang', N'0967890123', N'h@gmail.com', 0),
(N'NV009', N'Võ Văn Hùng', N'Buôn Ma Thuột', N'0978901234', N'i@gmail.com', 0),
(N'NV010', N'Trần Văn Long', N'Quảng Ninh', N'0989012345', N'j@gmail.com', 0);

--Khách hàng
GO
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, SDT, Email) VALUES 
(N'KH001', N'Nguyễn Thị An', N'HCM', N'0123456789', N'An@gmail.com'),
(N'KH002', N'Trần Văn Bình', N'Hà Nội', N'0987654321', N'binh@gmail.com'),
(N'KH003', N'Lê Thị Cẩm', N'Đà Nẵng', N'0912345678', N'Cam@gmail.com'),
(N'KH004', N'Phạm Văn Đức', N'Cần Thơ', N'0923456789', N'Duc@gmail.com'),
(N'KH005', N'Hoàng Thị Em', N'Hải Phòng', N'0934567890', N'Em@gmail.com'),
(N'KH006', N'Võ Văn Phong', N'Huế', N'0945678901', N'Phong@gmail.com'),
(N'KH007', N'Bùi Thị Gấm', N'Vũng Tàu', N'0956789012', N'Gam@gmail.com'),
(N'KH008', N'Phan Văn Hải', N'Nha Trang', N'0967890123', N'Hai@gmail.com'),
(N'KH009', N'Nguyễn Văn Kỳ', N'Buôn Ma Thuột', N'0978901234', N'Ky@gmail.com'),
(N'KH010', N'Trần Thị Lệ', N'Quảng Ninh', N'0989012345', N'Le@gmail.com');

--Đơn đặt hàng
GO
INSERT INTO DonDatHang (MaDH, MaKH, MaNV, NgayDatHang, NgayGiaoHang, NoiNhan, TongTien) VALUES
(N'DH001', N'KH001', N'NV001', '2024-06-27', '2024-07-01', N'HCM', 25000000),
(N'DH002', N'KH002', N'NV002', '2024-06-28', '2024-07-02', N'Hà Nội', 20000000),
(N'DH003', N'KH003', N'NV003', '2024-06-29', '2024-07-03', N'Đà Nẵng', 68400000),
(N'DH004', N'KH004', N'NV004', '2024-06-30', '2024-07-04', N'Cần Thơ', 2400000),
(N'DH005', N'KH005', N'NV005', '2024-07-01', '2024-07-05', N'Hải Phòng', 10300000),
(N'DH006', N'KH006', N'NV006', '2024-07-02', '2024-07-06', N'Huế', 1700000),
(N'DH007', N'KH007', N'NV007', '2024-07-03', '2024-07-07', N'Vũng Tàu', 6400000),
(N'DH008', N'KH008', N'NV008', '2024-07-04', '2024-07-08', N'Nha Trang', 16800000),
(N'DH009', N'KH009', N'NV009', '2024-07-05', '2024-07-09', N'Buôn Ma Thuột', 8800000),
(N'DH010', N'KH010', N'NV010', '2024-07-06', '2024-07-10', N'Quảng Ninh', 19800000);

--Chi tiết đặt hàng
GO
INSERT INTO ChiTietDatHang (MaDH, MaLK, SoLuong, BaoHanh, KhuyenMai, ThanhTien) VALUES
(N'DH001', N'MH001', 2, 12, 0, 6000000),
(N'DH001', N'MH032', 1, 12, 0, 13000000),
(N'DH001', N'MH021', 2, 12, 0, 6000000),
(N'DH002', N'MH003', 1, 12, 0, 10000000),
(N'DH002', N'MH050', 1, 12, 0, 10000000),
(N'DH003', N'MH015', 3, 12, 0, 2400000),
(N'DH003', N'MH025', 3, 12, 0, 24000000),
(N'DH003', N'MH052', 3, 12, 0, 18000000),
(N'DH003', N'MH040', 3, 12, 0, 24000000),
(N'DH004', N'MH007', 5, 12, 0, 2000000),
(N'DH005', N'MH009', 1, 12, 0, 1500000),
(N'DH005', N'MH019', 1, 12, 0, 3300000),
(N'DH005', N'MH037', 1, 12, 0, 5500000),
(N'DH006', N'MH011', 1, 12, 0, 1700000),
(N'DH007', N'MH013', 8, 12, 0, 6400000),
(N'DH008', N'MH015', 7, 12, 0, 16800000),
(N'DH009', N'MH017', 4, 12, 0, 8800000),
(N'DH010', N'MH019', 6, 12, 0, 19800000);
--Phuong thuc thanh toan
Go
INSERT INTO PhuongThucThanhToan (MaPhuongThuc, LoaiThanhToan, SoTaiKhoan) VALUES
(N'PT001', N'ATM', 'ATM001002003'),
(N'PT002', N'Visa', 'VISA001002003'),
(N'PT003', N'Momo', 'MOMO001002003'),
(N'PT004', N'Paypal', 'PAYPAL001002003'),
(N'PT005', N'ZaloPay', 'ZALOPAY001002003'),
(N'PT006', N'Viettel Money', 'VIETTEL001002003'),
(N'PT007', N'Tiền mặt', ''),
(N'PT008', N'Shopee Pay', 'SHOPEE001002003');
--Thong tin thanh toan
GO
INSERT INTO ThongTinThanhToan (MaDH, TinhTrang, MaPhuongThuc) VALUES
(N'DH001', 1, N'PT001'),
(N'DH002', 0, N'PT007'),
(N'DH003', 1, N'PT002'),
(N'DH004', 0, N'PT003'),
(N'DH005', 1, N'PT004'),
(N'DH006', 0, N'PT005'),
(N'DH007', 1, N'PT006'),
(N'DH008', 0, N'PT001'),
(N'DH009', 1, N'PT007'),
(N'DH010', 0, N'PT002');
--Xuat hoa don
GO

create table account (
	username nvarchar(50) primary key,
	password nvarchar(50) not null,
	sdt nchar(10) not null,
	email nvarchar(255) not null unique,
	-- type int not null default 0,
	MaNV NVARCHAR(10) NOT NULL UNIQUE,
	lock bit not null default 0,
	FOREIGN KEY (MANV) REFERENCES NhanVien(MaNV)
)

insert into account values 
	('root', 'root', '0123456789', 'root@localhost.com', 'NV001', 0),
	('user', 'user', '0011221100', 'user@localhost.con', 'NV002', 0)
