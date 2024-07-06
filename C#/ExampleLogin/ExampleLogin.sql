-- 221402 - KhanhNguyen9872

use master;
ALTER DATABASE Nhom1 SET OFFLINE WITH ROLLBACK IMMEDIATE;
ALTER DATABASE Nhom1 SET ONLINE;

DROP DATABASE Nhom1;

create database Nhom1;
go
use Nhom1;
go

create table account (
	username nvarchar(50) primary key,
	password nvarchar(50) not null,
	sdt nchar(10) not null,
	email nvarchar(255) not null unique,
	type int not null default 0,
	lock bit not null default 0
)

insert into account values 
	('root', 'root', '0123456789', 'root@localhost.com', 0, 0)


CREATE TABLE LoaiLinhKien(
	MaLoaiLK NVARCHAR(10) PRIMARY KEY,
	TenLoaiLK NVARCHAR(255),
	NgayTao DATETIME not null,
	NgayCapNhat DATETIME not null
);
GO
CREATE TABLE NhaCungCap(
	MaNhaCungCap NVARCHAR(10) PRIMARY KEY,
	TenNhaCungCap NVARCHAR(255),
	Email VARCHAR(255)
);
GO
CREATE TABLE LinhKien(
	MaLK NVARCHAR(10) PRIMARY KEY,
	MaNhaCungCap NVARCHAR(10),
	MaLoaiLK NVARCHAR(10),
	TenLK NVARCHAR(100),
	Gia bigint,
	BaoHanh tinyint,
	KhuyenMai tinyint,
	MoTa NVARCHAR(100),
	FOREIGN KEY (MaLoaiLK) REFERENCES LoaiLinhKien(MaLoaiLK),
	FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap)
	ON DELETE CASCADE
);
GO
CREATE TABLE NhanVien(
	MaNV NVARCHAR(10) PRIMARY KEY,
	TenNV NVARCHAR(30),
	DiaChi NVARCHAR(50),
	SDT NVARCHAR(10),
	Email NVARCHAR(50)
);
GO
CREATE TABLE KhachHang(
	MaKH NVARCHAR(10) PRIMARY KEY,
	TenKH NVARCHAR(30),
	DiaCHi NVARCHAR(50),
	SDT NVARCHAR(10),
	Email NVARCHAR(50)
);
GO
CREATE TABLE DonDatHang(
	MaDH NVARCHAR(10) PRIMARY KEY,
	MaKH NVARCHAR(10),
	MaNV NVARCHAR(10),
	NgayDatHang DATE,
	NgayGiaoHang DATE,
	NoiNhan NVARCHAR(50)
	FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
	FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
	ON DELETE CASCADE
);
GO
CREATE TABLE ChiTietDatHang(
	MaDH NVARCHAR(10),
	MaLK NVARCHAR(10),
	SoLuong INT
	FOREIGN KEY (MaDH) REFERENCES DonDatHang(MaDH),
    FOREIGN KEY (MaLK) REFERENCES LinhKien(MaLK)
	ON DELETE CASCADE
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

INSERT INTO LinhKien (MaLK, MaNhaCungCap, MaLoaiLK, TenLK, Gia, BaoHanh, KhuyenMai, MoTa) VALUES 
--CPU
('MH001', 'NCC001', 'CPU', 'i5-10500k', 500000, 12, 0, '..'),
('MH002', 'NCC001', 'CPU', 'i5-12600K', 500000, 12, 0, '..'),
('MH003', 'NCC001', 'CPU', 'i7-14700K', 500000, 12, 0, '..'),
('MH004', 'NCC001', 'CPU', 'i5 10500k', 500000, 12, 0, '..'),
('MH005', 'NCC002', 'CPU', 'R7 7780HS', 500000, 12, 0, '..'),
('MH006', 'NCC002', 'CPU', 'R7 7800X3D', 500000, 12, 0, '..'),
('MH007', 'NCC002', 'CPU', 'R5 5600X', 500000, 12, 0, '..'),
('MH008', 'NCC002', 'CPU', 'R5 3600', 500000, 12, 0, '..'),
--RAM
('MH009', 'NCC003', 'RAM', 'Kingston Fury Beast Black 16GB 3200MHz DDR4', 500000, 12, 0, '..'),
('MH010', 'NCC003', 'RAM', 'Kingston Fury Beast Black 8GB 3200MHz DDR4', 500000, 12, 0, '..'),
('MH011', 'NCC003', 'RAM', 'Kingston Fury Beast RGB 16GB 3733MHz DDR4', 500000, 12, 0, '..'),
('MH012', 'NCC003', 'RAM', 'Kingston Fury Beast RGB 16GB 5600MHz DDR5', 500000, 12, 0, '..'),
('MH013', 'NCC004', 'RAM', 'Corsair Vengeance LPX 8GB 3200MHz DDR4', 500000, 12, 0, '..'),
('MH014', 'NCC004', 'RAM', 'Corsair Vengeance LPX 16GB 3200MHz DDR4', 500000, 12, 0, '..'),
('MH015', 'NCC004', 'RAM', 'Corsair Vengeance 16GB 5200MHz DDR5', 500000, 12, 0, '..'),
('MH016', 'NCC004', 'RAM', 'Corsair Vengeance RGB RS 16GB 3200MHz DDR4', 500000, 12, 0, '..'),
--MAIN
('MH017', 'NCC005', 'MAIN', 'ASUS PRIME B450M-A II', 500000, 12, 0, '..'),
('MH019', 'NCC005', 'MAIN', 'ASUS TUF GAMING B550M-PLUS', 500000, 12, 0, '..'),
('MH020', 'NCC005', 'MAIN', 'Asus PRIME B760M-A WIFI', 500000, 12, 0, '..'),
('MH021', 'NCC006', 'MAIN', 'Gigabyte A620M GAMING X', 500000, 12, 0, '..'),
('MH022', 'NCC006', 'MAIN', 'Gigabyte B760M GAMING WIFI PLUS DDR4', 500000, 12, 0, '..'),
('MH023', 'NCC006', 'MAIN', 'Gigabyte B550M AORUS ELITE AX', 500000, 12, 0, '..'),
('MH024', 'NCC006', 'MAIN', 'Gigabyte Z790 A ELITE AX ICE', 500000, 12, 0, '..'),
--VGA
('MH025', 'NCC006', 'VGA', 'Gigabyte GeForce RTX 3050 WINDFORCE OC 6G GDDR6', 500000, 12, 0, '..'),
('MH026', 'NCC006', 'VGA', 'Gigabyte Radeon RX 6600 EAGLE 8G GDDR6', 500000, 12, 0, '..'),
('MH027', 'NCC006', 'VGA', 'Gigabyte GeForce RTX 3060 GAMING OC 12G GDDR6', 500000, 12, 0, '..'),
('MH028', 'NCC006', 'VGA', 'Gigabyte GeForce RTX 4060 WINDFORCE OC 8G GDDR6', 500000, 12, 0, '..'),
('MH029', 'NCC005', 'VGA', 'Asus TUF Gaming Radeon RX 7900 XTX OC Edition 24GB GDDR6', 500000, 12, 0, '..'),
('MH030', 'NCC005', 'VGA', 'Asus GeForce RTX 3050 DUAL 6GB OC GDDR6', 500000, 12, 0, '..'),
('MH031', 'NCC005', 'VGA', 'ASUS Dual Radeon RX 7600 V2 OC Edition 8GB GDDR6', 500000, 12, 0, '..'),
('MH032', 'NCC005', 'VGA', 'Asus Dual GeForce RTX 4060 White OC Edition 8GB GDDR6', 500000, 12, 0, '..'),
--PSU
('MH033', 'NCC005', 'PSU', 'ASUS THOR 1200P2 1200W Platinum Full Modula', 500000, 12, 0, '..'),
('MH034', 'NCC005', 'PSU', 'ASUS TUF Gaming 750W (80 Plus Bronze)', 500000, 12, 0, '..'),
('MH035', 'NCC005', 'PSU', 'ASUS TUF Gaming 1000W Gold Full Modular PCIe 5.0', 500000, 12, 0, '..'),
('MH036', 'NCC005', 'PSU', 'ASUS TUF Gaming 650W (80 Plus Bronze)', 500000, 12, 0, '..'),
('MH037', 'NCC006', 'PSU', 'GIGABYTE UD850GM PG5 - 80 Plus Gold - Full Modular (850W)', 500000, 12, 0, '..'),
('MH038', 'NCC006', 'PSU', 'GIGABYTE UD850GM - 80 Plus Gold - Full Modular (850W)', 500000, 12, 0, '..'),
('MH039', 'NCC006', 'PSU', 'GIGABYTE UD1000GM - 80 Plus Gold - Full Modular (1000W)', 500000, 12, 0, '..'),
('MH040', 'NCC006', 'PSU', 'GIGABYTE AORUS P1200W - 80 Plus Platinum - Full Modular (1200W)', 500000, 12, 0, '..'),
--SSD
('MH041', 'NCC004', 'SSD', 'SSD Corsair MP600 CORE XT 1TB PCIe 4.0 Gen4', 500000, 12, 0, '..'),
('MH042', 'NCC004', 'SSD', 'SSD Corsair MP600 PRO LPX 1TB PCIe Gen4 x4 NVMe M.2 SSD', 500000, 12, 0, '..'),
('MH043', 'NCC004', 'SSD', 'SSD 480G Corsair Force Series MP510 M.2 NVMe PCIe Gen3 x4 3D-NAND', 500000, 12, 0, '..'),
('MH044', 'NCC004', 'SSD', 'SSD Corsair MP700 1TB | M.2 PCIe, Gen 5x4, NVMe 2.0', 500000, 12, 0, '..'),
('MH045', 'NCC003', 'SSD', 'SSD Kingston NV2 250GB M.2 PCIe NVMe Gen4', 500000, 12, 0, '..'),
('MH046', 'NCC003', 'SSD', 'SSD Kingston NV2 500GB M.2 PCIe NVMe Gen4', 500000, 12, 0, '..'),
('MH047', 'NCC003', 'SSD', 'SSD Kingston NV2 1TB M.2 PCIe NVMe Gen4', 500000, 12, 0, '..'),
('MH048', 'NCC003', 'SSD', 'SSD Kingston KC3000 1TB M.2 PCIe gen 4 NVMe', 500000, 12, 0, '..'),
--HDD
('MH049', 'NCC007', 'HDD', 'HDD Seagate IronWolf 4TB', 500000, 12, 0, '..'),
('MH050', 'NCC007', 'HDD', 'HDD SEAGATE IronWolf PRO 14TB', 500000, 12, 0, '..'),
('MH051', 'NCC007', 'HDD', 'HDD Seagate IronWolf Pro 10TB', 500000, 12, 0, '..'),
('MH052', 'NCC007', 'HDD', 'HDD Seagate IronWolf Pro 8TB', 500000, 12, 0, '..'),
('MH053', 'NCC003', 'HDD', 'HDD Enterprise Western Digital Ultrastar DC HC550 18TB', 500000, 12, 0, '..'),
('MH054', 'NCC003', 'HDD', 'HDD Enterprise Western Digital Ultrastar DC HC330 10TB', 500000, 12, 0, '..'),
('MH055', 'NCC003', 'HDD', 'HDD Enterprise Western Digital Ultrastar DC HC320 8TB', 500000, 12, 0, '..'),
('MH056', 'NCC003', 'HDD', 'HDD Enterprise Western Digital Ultrastar DC HC550 16TB', 500000, 12, 0, '..');



--Nhân viên
GO
INSERT INTO NhanVien (MaNV, TenNV, DiaChi, SDT, Email) VALUES 
(N'NV001', N'Nguyễn Văn A', N'HCM', N'0123456789', N'a@gmail.com'),
(N'NV002', N'Nguyễn Văn B', N'Hà Nội', N'0324857691', N'b@gmail.com');
--Khách hàng
GO
INSERT INTO KhachHang (MaKH, TenKH, DiaCHi, SDT, Email) VALUES
(N'KH001', N'Trần Văn E', N'HCM', N'0184758398', N'KH1@gmail.com'),
(N'KH002', N'Trần Văn F', N'Hà Nội', N'0398575842',  N'KH2@gmail.com');
--Đơn đặt hàng
GO
INSERT INTO DonDatHang (MaDH, MaKH, MaNV, NgayDatHang, NgayGiaoHang, NoiNhan) VALUES
(N'DH001', N'KH001', N'NV001', '2024-06-27', '2024-07-01', N'HCM'),
(N'DH002', N'KH002', N'NV002', '2024-05-27', '2024-06-01', N'Hà Nội');
--Chi tiết đặt hàng
GO
INSERT INTO ChiTietDatHang (MaDH, MaLK, SoLuong) VALUES
(N'DH001', N'MH001', 10),
(N'DH002', N'MH003', 10);




