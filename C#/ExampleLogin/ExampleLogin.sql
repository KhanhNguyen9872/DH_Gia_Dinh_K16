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

CREATE TABLE LoaiMatHang(
	MaLoaiMH NVARCHAR(10) PRIMARY KEY,
	TenLoaiMH NVARCHAR(10),
);
GO
CREATE TABLE NhaCungCap(
	MaNhaCungCap NVARCHAR(10) PRIMARY KEY,
	TenNhaCungCap NVARCHAR(10)
);
GO
CREATE TABLE MatHang(
	MaMH NVARCHAR(10) PRIMARY KEY,
	MaNhaCungCap NVARCHAR(10),
	MaLoaiMH NVARCHAR(10),
	TenMH NVARCHAR(100),
	Gia bigint,
	BaoHanh tinyint,
	KhuyenMai tinyint,
	MoTa NVARCHAR(100),
	FOREIGN KEY (MaLoaiMH) REFERENCES LoaiMatHang(MaLoaiMH)	
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
);
GO
CREATE TABLE ChiTietDatHang(
	MaDH NVARCHAR(10),
	MaMH NVARCHAR(10),
	SoLuong INT
	FOREIGN KEY (MaDH) REFERENCES DonDatHang(MaDH),
    FOREIGN KEY (MaMH) REFERENCES MatHang(MaMH)
);
--Nhà cung cấp
GO
INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap) VALUES (N'NCC001', N'Intel');
GO
INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap) VALUES (N'NCC002', N'AMD');
GO
INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap) VALUES (N'NCC003', N'KINGSTON');
GO
INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap) VALUES (N'NCC004', N'CORSAIR');
GO
INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap) VALUES (N'NCC005', N'ASUS');
GO
INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap) VALUES (N'NCC006', N'GIGABYTE');
GO
--Loại mặt hàng
INSERT INTO LoaiMatHang (MaLoaiMH, TenLoaiMH) VALUES (N'LMH001', N'CPU');
GO 
INSERT INTO LoaiMatHang (MaLoaiMH, TenLoaiMH) VALUES (N'LMH002', N'RAM');
GO
INSERT INTO LoaiMatHang (MaLoaiMH, TenLoaiMH) VALUES (N'LMH003', N'MAIN');
GO
INSERT INTO LoaiMatHang (MaLoaiMH, TenLoaiMH) VALUES (N'LMH004', N'GPU');

--Mặt Hàng
--CHIP
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH001', N'NCC001', N'LMH001', N'i5-10500k', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH002', N'NCC001', N'LMH001', N'i5-12600K', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH003', N'NCC001', N'LMH001', N'i7-14700K', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH004', N'NCC001', N'LMH001', N'i5 10500k', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH005', N'NCC002',N'LMH001', N'R7 7780HS', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH006', N'NCC002',N'LMH001', N'R7 7800X3D', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH007', N'NCC002',N'LMH001', N'R5 5600X', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH008', N'NCC002',N'LMH001', N'R5 3600', 500000, 12, 0, N'..');
--Ram
GO
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH009', N'NCC003',N'LMH002', N'Kingston Fury Beast Black 16GB 3200MHz DDR4', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH010', N'NCC003',N'LMH002', N'Kingston Fury Beast Black 8GB 3200MHz DDR4', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH011', N'NCC003',N'LMH002', N'Kingston Fury Beast RGB 16GB 3733MHz DDR4', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH012', N'NCC003',N'LMH002', N'Kingston Fury Beast RGB 16GB 5600MHz DDR5', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH013', N'NCC004',N'LMH002', N'Corsair Vengeance LPX 8GB 3200MHz DDR4', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH014', N'NCC004',N'LMH002', N'Corsair Vengeance LPX 16GB 3200MHz DDR4', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH015', N'NCC004',N'LMH002', N'Corsair Vengeance 16GB 5200MHz DDR5', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH016', N'NCC004',N'LMH002', N'Corsair Vengeance RGB RS 16GB 3200MHz DDR4', 500000, 12, 0, N'..');
--Main
GO
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH017', N'NCC005',N'LMH003', N'ASUS PRIME B450M-A II', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH018', N'NCC005',N'LMH003', N'Asus Prime A620M-A', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH019', N'NCC005',N'LMH003', N'ASUS TUF GAMING B550M-PLUS', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH020', N'NCC005',N'LMH003', N'Asus PRIME B760M-A WIFI', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH021', N'NCC006',N'LMH003', N'Gigabyte A620M GAMING X', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH022', N'NCC006',N'LMH003', N'Gigabyte B760M GAMING WIFI PLUS DDR4', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH023', N'NCC006',N'LMH003', N'Gigabyte B550M AORUS ELITE AX', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH024', N'NCC006',N'LMH003', N'Gigabyte Z790 A ELITE AX ICE', 500000, 12, 0, N'..');
--GPU
GO
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH025', N'NCC006',N'LMH004', N'Gigabyte GeForce RTX 3050 WINDFORCE OC 6G GDDR6', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH026', N'NCC006',N'LMH004', N'Gigabyte Radeon RX 6600 EAGLE 8G GDDR6', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH027', N'NCC006',N'LMH004', N'Gigabyte GeForce RTX 3060 GAMING OC 12G GDDR6', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH028', N'NCC006',N'LMH004', N'Gigabyte GeForce RTX 4060 WINDFORCE OC 8G GDDR6', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH029', N'NCC005',N'LMH004', N'Asus TUF Gaming Radeon RX 7900 XTX OC Edition 24GB GDDR6', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH030', N'NCC005',N'LMH004', N'Asus GeForce RTX 3050 DUAL 6GB OC GDDR6', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH031', N'NCC005',N'LMH004', N'ASUS Dual Radeon RX 7600 V2 OC Edition 8GB GDDR6', 500000, 12, 0, N'..');
INSERT INTO MatHang (MaMH, MaNhaCungCap, MaLoaiMH, TenMH, Gia, BaoHanh, KhuyenMai, MoTa) VALUES (N'MH032', N'NCC005',N'LMH004', N'Asus Dual GeForce RTX 4060 White OC Edition 8GB GDDR6', 500000, 12, 0, N'..');

--Nhân viên
INSERT INTO NhanVien (MaNV, TenNV, DiaChi, SDT, Email) VALUES (N'NV001', N'Nguyễn Văn A', N'HCM', N'0123456789', N'a@gmail.com');
GO
INSERT INTO NhanVien (MaNV, TenNV, DiaChi, SDT, Email) VALUES (N'NV002', N'Nguyễn Văn B', N'Hà Nội', N'0324857691', N'b@gmail.com')
GO
--Khách hàng
INSERT INTO KhachHang (MaKH, TenKH, DiaCHi, SDT, Email) VALUES(N'KH001', N'Trần Văn E', N'HCM', N'0184758398', N'KH1@gmail.com');
GO
INSERT INTO KhachHang (MaKH, TenKH, DiaCHi, SDT, Email) VALUES(N'KH002', N'Trần Văn F', N'Hà Nội', N'0398575842',  N'KH2@gmail.com');
GO 
--Đơn đặt hàng
INSERT INTO DonDatHang (MaDH, MaKH, MaNV, NgayDatHang, NgayGiaoHang, NoiNhan) VALUES(N'DH001', N'KH001', N'NV001', '2024-06-27', '2024-07-01', N'HCM');
GO
INSERT INTO DonDatHang (MaDH, MaKH, MaNV, NgayDatHang, NgayGiaoHang, NoiNhan) VALUES(N'DH002', N'KH002', N'NV002', '2024-05-27', '2024-06-01', N'Hà Nội');
GO
--Chi tiết đặt hàng
INSERT INTO ChiTietDatHang (MaDH, MaMH, SoLuong) VALUES(N'DH001', N'MH001', 10);
GO
INSERT INTO ChiTietDatHang (MaDH, MaMH, SoLuong) VALUES(N'DH002', N'MH003', 10);



