﻿-- 221402 - N4

use [master];
ALTER DATABASE [QLNCKH] SET OFFLINE WITH ROLLBACK IMMEDIATE;
ALTER DATABASE [QLNCKH] SET ONLINE;

DROP DATABASE QLNCKH;


CREATE DATABASE QLNCKH;
GO
use QLNCKH;
GO

-- Create table
CREATE TABLE GIAOVIEN (
	MA VARCHAR(8) NOT NULL,
	HO NVARCHAR(32) NOT NULL DEFAULT '',
	TENLOT NVARCHAR(32) NOT NULL DEFAULT '',
	TEN NVARCHAR(32) NOT NULL,
	PHAI NVARCHAR(3) NOT NULL CHECK (PHAI IN (N'NAM', N'NỮ')),
	NGSINH DATETIME NOT NULL,
	LUONG INT NOT NULL DEFAULT -1,
	BO_MON VARCHAR(8),
	KHOA VARCHAR(8),
	PRIMARY KEY (MA),
);

CREATE TABLE KHOA (
	MA VARCHAR(8) NOT NULL,
	TEN NVARCHAR(255) NOT NULL,
	NAM_THANH_LAP DATETIME NOT NULL,
	PHONG_LAM_VIEC VARCHAR(8),
	SO_DIEN_THOAI NVARCHAR(16),
	TRUONG_KHOA VARCHAR(8),
	NGAY_NHAN_CHUC DATETIME,
	PRIMARY KEY (MA),
	FOREIGN KEY (TRUONG_KHOA) REFERENCES GIAOVIEN (MA),
);

CREATE TABLE BO_MON (
	MA VARCHAR(8) NOT NULL,
	TEN NVARCHAR(255) NOT NULL,
	PHONG VARCHAR(8) NOT NULL,
	SO_DIEN_THOAI NVARCHAR(16),
	MA_KHOA VARCHAR(8),
	TRUONG_BO_MON VARCHAR(8),
	NGAY_NHAN_CHUC DATETIME,
	PRIMARY KEY (MA),
	FOREIGN KEY (TRUONG_BO_MON) REFERENCES GIAOVIEN (MA),
	FOREIGN KEY (MA_KHOA) REFERENCES KHOA (MA)
);

CREATE TABLE SO_DIEN_THOAI (
	MAGV VARCHAR(8) NOT NULL,
	SO_DIEN_THOAI NVARCHAR(32) NOT NULL,
	PRIMARY KEY (SO_DIEN_THOAI),
	FOREIGN KEY (MAGV) REFERENCES GIAOVIEN (MA)
);

CREATE TABLE DIA_CHI (
	MAGV VARCHAR(8) NOT NULL,
	SONHA NVARCHAR(64),
	DUONG NVARCHAR(64),
	QUAN NVARCHAR(64),
	THANHPHO NVARCHAR(64),
	FOREIGN KEY (MAGV) REFERENCES GIAOVIEN (MA)
);

CREATE TABLE CHU_DE (
	MA VARCHAR(8) NOT NULL,
	TEN NVARCHAR(255) NOT NULL,
	PRIMARY KEY (MA)
);

CREATE TABLE DE_TAI (
	STT INT NOT NULL IDENTITY(1,1),
	MA VARCHAR(8) NOT NULL,
	TEN NVARCHAR(255) NOT NULL,
	CAP_QUAN_LY VARCHAR(8),
	KINH_PHI INT NOT NULL,
	NGAY_BAT_DAU DATETIME,
	NGAY_KET_THUC DATETIME,
	CHU_DE VARCHAR(8),
	PRIMARY KEY (MA),
	FOREIGN KEY (CAP_QUAN_LY) REFERENCES GIAOVIEN (MA),
	FOREIGN KEY (CHU_DE) REFERENCES CHU_DE (MA)
);

CREATE TABLE NGUOI_THAN (
	MA INT NOT NULL IDENTITY(1,1), 
	HO NVARCHAR(32) NOT NULL DEFAULT '',
	TENLOT NVARCHAR(32) NOT NULL DEFAULT '',
	TEN NVARCHAR(32) NOT NULL,
	PHAI NVARCHAR(3) NOT NULL CHECK (PHAI IN (N'NAM', N'NỮ')),
	NGSINH DATETIME NOT NULL,
	MAGV VARCHAR(8) NOT NULL,
	PRIMARY KEY (MA),
	FOREIGN KEY (MAGV) REFERENCES GIAOVIEN (MA)
);

CREATE TABLE CONG_VIEC (
	MACONGVIEC INT NOT NULL,
	MA VARCHAR(8) NOT NULL,
	TEN NVARCHAR(255) NOT NULL,
	PRIMARY KEY (MACONGVIEC),
	FOREIGN KEY (MA) REFERENCES DE_TAI (MA)
);

CREATE TABLE THAMGIADT (
	STT INT NOT NULL IDENTITY(1,1),
	MA VARCHAR(8) NOT NULL,
	MAGV VARCHAR(8) NOT NULL,
	MACONGVIEC INT NOT NULL,
	PRIMARY KEY (STT),
	FOREIGN KEY (MA) REFERENCES DE_TAI (MA),
	FOREIGN KEY (MAGV) REFERENCES GIAOVIEN (MA),
	FOREIGN KEY (MACONGVIEC) REFERENCES CONG_VIEC (MACONGVIEC)
);

ALTER TABLE GIAOVIEN ADD FOREIGN KEY (KHOA) REFERENCES KHOA (MA);
ALTER TABLE GIAOVIEN ADD FOREIGN KEY (BO_MON) REFERENCES BO_MON (MA);

BEGIN
	ALTER TABLE GIAOVIEN
	NOCHECK CONSTRAINT ALL
	INSERT INTO GIAOVIEN 
		(MA, HO, TENLOT, TEN, PHAI, NGSINH, BO_MON, KHOA, LUONG)
	VALUES 
		('001', N'Nguyễn', N'Văn', N'Khánh', N'NAM', '02/07/2004', 'HTTT', 'CNTT', 10000000),
		('002', N'Lê', N'Lâm Chiến', N'Thắng', N'NAM', '01/01/2004', 'MMT', 'MKT', 20000000),
		('003', N'Nguyễn', N'Văn', N'Sang', N'NAM', '02/01/2004', 'KTPM', 'NN', 30000000),
		('004', N'Nguyễn', N'Trần Hoàng', N'Thịnh', N'NAM', '03/01/2004', 'HTTT', 'TT', 40000000),
		('005', N'Nguyễn', N'Văn', N'A', N'NAM', '01/02/2000', 'KTPM', 'TT', 5000000),
		('006', N'Nguyễn', N'Thị', N'B', N'NỮ', '02/02/2000', 'MMT', 'NN', 4000000),
		('007', N'Nguyễn', N'', N'Cường', N'NAM', '03/02/2000', 'NNA', 'MKT', 6000000),
		('008', N'Nguyễn', N'Tiến', N'D', N'NAM', '04/02/2000', 'NNT', 'CNTT', 7000000),
		('009', N'Trần', N'Thị', N'E', N'NỮ', '05/02/2000', 'HTTT', 'TT', 3000000),
		('010', N'Trần', N'Văn', N'F', N'NAM', '06/02/2000', 'TKDH', 'MKT', 4000000),
		('011', N'Trần', N'Văn', N'Khánh', N'NAM', '07/02/2000', 'MMT', 'CNTT', 8000000),
		('012', N'Lê', N'Hồng', N'Phong', N'NAM', '01/01/1998', 'TKDH', 'TT', 5656565),
		('013', N'Nguyễn', N'Thị', N'Kiều', N'NỮ', '01/01/1988', 'KTPM', 'MKT', 5600000),
		('014', N'Nguyễn', N'Anh', N'Quốc', N'NAM', '01/01/1985', 'KTPM', 'CNTT', 10000000),
		('015', N'Nguyễn', N'Quốc', N'Anh', N'NAM', '01/01/1986', 'MMT', 'NN', 20000000),
		('016', N'Nguyễn', N'Thị', N'Chi', N'Nữ', '01/01/1995', 'NNT', 'KT', 15000000),
		('017', N'Nguyễn', N'Thanh', N'Quốc', N'NAM', '01/01/1999', 'TKDH', 'KHCT', 25000000),
		('018', N'Nguyễn', N'Văn', N'Chánh', N'NAM', '01/06/1997', 'MMT', 'CNTT', 3000000)
	ALTER TABLE GIAOVIEN
	CHECK CONSTRAINT ALL
END

BEGIN
	ALTER TABLE SO_DIEN_THOAI
	NOCHECK CONSTRAINT ALL
	INSERT INTO SO_DIEN_THOAI 
		(MAGV, SO_DIEN_THOAI)
	VALUES 
		('001', '0937927510'),
		('001', '0937927511'),
		('001', '0937927512'),
		('001', '0937927513'),
		('002', '0123456789'),
		('002', '0123456780'),
		('003', '0987654321'),
		('004', '0101010101'),
		('004', '0202020202'),
		('005', '0120120120'),
		('006', '0011221100'),
		('007', '0909080807'),
		('008', '0120120121')
	ALTER TABLE SO_DIEN_THOAI
	CHECK CONSTRAINT ALL
END

BEGIN
	ALTER TABLE DIA_CHI
	NOCHECK CONSTRAINT ALL
	INSERT INTO DIA_CHI 
		(MAGV, SONHA, DUONG, QUAN, THANHPHO)
	VALUES
		('001', N'371', N'Nguyễn Kiệm', N'Gò Vấp', N'TP.HCM'),
		('002', N'162T', N'Trường Chinh', N'Tân Bình', N'TP.HCM'),
		('003', N'8 Đ', N'Song Hành', N'Quận 12', N'Bà Rịa Vũng Tàu'),
		('004', N'17', N'Nguyễn Văn Lạc', N'Bình Thạnh', N'Cao Bằng'),
		('005', N'17', N'Nguyễn Văn Lạc', N'Bình Thạnh', N'Ninh Thuận'),
		('006', N'17', N'Nguyễn Văn Lạc', N'Bình Thạnh', N'Bình Thuận'),
		('007', N'17', N'Nguyễn Văn Lạc', N'Bình Thạnh', N'Hà Nội'),
		('008', N'17', N'Nguyễn Văn Lạc', N'Bình Thạnh', N'TP.HCM'),
		('009', N'17', N'Nguyễn Văn Lạc', N'Bình Thạnh', N'Bình Thuận'),
		('010', N'17', N'Nguyễn Văn Lạc', N'Bình Thạnh', N'TP.HCM'),
		('011', N'17', N'Nguyễn Văn Lạc', N'Bình Thạnh', N'Cao Bằng'),
		('012', N'17', N'Nguyễn Văn Lạc', N'Bình Thạnh', N'Sóc Trăng'),
		('013', N'17', N'Nguyễn Văn Lạc', N'Bình Thạnh', N'Ninh Thuận'),
		('014', N'17', N'Nguyễn Văn Lạc', N'Bình Thạnh', N'Tây Ninh'),
		('015', N'17', N'Nguyễn Văn Lạc', N'Bình Thạnh', N'Hà Giang'),
		('016', N'17', N'Nguyễn Văn Lạc', N'Bình Thạnh', N'Cà Mau'),
		('017', N'17', N'Nguyễn Văn Lạc', N'Bình Thạnh', N'Cao Bằng')
	ALTER TABLE DIA_CHI
	CHECK CONSTRAINT ALL
END

BEGIN
	ALTER TABLE KHOA
	NOCHECK CONSTRAINT ALL
	INSERT INTO KHOA 
		(MA, TEN, NAM_THANH_LAP, PHONG_LAM_VIEC, SO_DIEN_THOAI, TRUONG_KHOA, NGAY_NHAN_CHUC)
	VALUES 
		('CNTT', 'Công nghệ thông tin', '02/02/1980', '', '', '001', '02/02/2020'),
		('MKT', 'Marketing', '02/03/2020', '', '', '002', '02/02/2022'),
		('NN', 'Ngôn ngữ', '02/04/1990', '', '', '003', '02/02/2021'),
		('TT', 'Truyền thông', '02/05/2020', '', '', '006', '02/02/2022'),
		('KHCT', 'Khoa học chính trị', '04/06/1985', '', '', '001', '01/04/2005'),
		('TLH', 'Tâm lý học', '04/06/1991', '', '', '', ''),
		('KT', 'Kế toán', '06/12/2000', '', '', '004', '09/08/2001')
	ALTER TABLE KHOA
	CHECK CONSTRAINT ALL
END

BEGIN
	ALTER TABLE BO_MON
	NOCHECK CONSTRAINT ALL
	INSERT INTO BO_MON 
		(MA, TEN, PHONG, SO_DIEN_THOAI, MA_KHOA, TRUONG_BO_MON, NGAY_NHAN_CHUC)
	VALUES 
		('HTTT', N'Hệ thống thông tin', 'B000', '', '', '001', '02/02/2015'),
		('MMT', N'Mạng máy tính', 'B001', '', '', '002', '02/03/2014'),
		('KTPM', N'Kỹ thuật phần mềm', 'B002', '', '', '003', '02/04/2016'),
		('TKDH', N'Thiết kế đồ họa', 'B003', '', '', '008', '02/05/2017'),
		('NNA', N'Ngôn ngữ Anh', 'B004', '', '', '007', '02/06/2022'),
		('NNT', N'Ngôn ngữ Trung', 'B005', '', '', '006', '02/07/2022'),
		('CCH', N'Chính trị học', 'B006', '', '', '', '02/07/2022'),
		('KT', N'Kiến trúc', 'B007', '', '', '', '02/07/2022')
	ALTER TABLE BO_MON
	CHECK CONSTRAINT ALL
END

BEGIN
	ALTER TABLE NGUOI_THAN
	NOCHECK CONSTRAINT ALL
	INSERT INTO NGUOI_THAN 
		(HO, TENLOT, TEN, PHAI, NGSINH, MAGV)
	VALUES
		(N'Nguyễn', N'Văn', N'Q', N'NAM', '12/31/1980', '001'),
		(N'Ngô', N'Thị Minh', N'H', N'NỮ', '12/31/1981', '001'),
		(N'Nguyễn', N'Chính', N'N', N'NAM', '12/31/1982', '002'),
		(N'Ngô', N'Thị Minh', N'H', N'NỮ', '12/31/1976', '003'),
		(N'Bùi', N'', N'Tiến', N'NAM', '12/31/1984', '004')
	ALTER TABLE NGUOI_THAN
	CHECK CONSTRAINT ALL
END

BEGIN
	ALTER TABLE DIA_CHI
	NOCHECK CONSTRAINT ALL
	INSERT INTO DIA_CHI 
		(MAGV, SONHA, DUONG, QUAN, THANHPHO)
	VALUES
		('001', N'1000', N'Nguyễn Văn Cừ', N'Quận 1', N'TP.HCM'),
		('002', N'1001', N'Nguyễn Văn Nghi', N'Gò Vấp', N'TP.HCM'),
		('003', N'1002', N'Nguyễn Thái Học', N'Quận 1', N'TP.HCM'),
		('004', N'1003', N'Cách Mạng Tháng 8', N'Quận 10', N'TP.HCM'),
		('005', N'1004', N'Nguyễn Văn Cừ', N'Quận 1', N'TP.HCM'),
		('006', N'1005', N'Lê Hồng Phong', N'Quận 10', N'TP.HCM'),
		('007', N'1006', N'Chu Văn An', N'Bình Thạnh', N'TP.HCM'),
		('008', N'1007', N'Phan Văn Trị', N'Bình Thạnh', N'TP.HCM'),
		('009', N'1008', N'Quang Trung', N'Gò Vấp', N'TP.HCM'),
		('010', N'1009', N'Thích Quảng Đức', N'Phú Nhuận', N'TP.HCM')
	ALTER TABLE DIA_CHI
	CHECK CONSTRAINT ALL
END

BEGIN
	ALTER TABLE CHU_DE
	NOCHECK CONSTRAINT ALL
	INSERT INTO CHU_DE 
		(MA, TEN)
	VALUES
		('400', N'Chủ đề 0'),
		('401', N'Chủ đề 1'),
		('402', N'Chủ đề 2'),
		('403', N'Chủ đề 3'),
		('404', N'Chủ đề 4'),
		('405', N'Chủ đề 5')
	ALTER TABLE CHU_DE
	CHECK CONSTRAINT ALL
END

BEGIN
	ALTER TABLE DE_TAI
	NOCHECK CONSTRAINT ALL
	INSERT INTO DE_TAI 
		(MA, TEN, CAP_QUAN_LY, KINH_PHI, NGAY_BAT_DAU, NGAY_KET_THUC, CHU_DE)
	VALUES
		('001', N'HTTT quản lý các trường ĐH', '001', 1000000, '01/01/2023', '01/01/2025', '400'),
		('002', N'HTTT quản lý giáo vụ cho một Khoa', '002', 2000000, '02/01/2023', '01/01/2026', '401'),
		('003', N'Ứng dụng hóa học xanh', '003', 3000000, '03/01/2023', '01/01/2027', '402'),
		('004', N'HTTT quản lý các trường TH', '004', 4000000, '04/01/2023', '01/01/2028', '403'),
		('005', N'Ứng dụng Di động React Native', '005', 5000000, '05/01/2023', '01/01/2029', '404'),
		('006', N'Nhận dạng Hình ảnh sử dụng Máy học', '006', 6000000, '06/01/2023', '01/01/2030', '405'),
		('007', N'Ảnh hưởng của Thói quen Ăn đối với Tim mạch', '007', 7000000, '07/01/2023', '01/01/2031', '400'),
		('008', N'Dự đoán Ung thư qua Genomic', '007', 7000000, '07/01/2023', '01/01/2031', '400'),
		('009', N'Yếu tố ảnh hưởng đến Hạnh phúc', '007', 7000000, '07/01/2023', '01/01/2031', '400'),
		('010', N'Biến đổi Khí hậu và Rừng Amazon', '007', 7000000, '07/01/2023', '01/01/2031', '400'),
		('011', N'Sáng tạo trong Quảng cáo: Màu sắc và Hình ảnh', '007', 7000000, '07/01/2023', '01/01/2031', '400'),
		('012', N'Cơ chế Enzyme trong Tiêu hóa thức ăn', '007', 7000000, '07/01/2023', '01/01/2031', '400'),
		('013', N'Ứng dụng VR cho Trải nghiệm Nghệ thuật tương tác', '007', 7000000, '07/01/2023', '01/01/2031', '400'),
		('014', N'Văn hóa và Quyết định Kinh tế cá nhân', '007', 7000000, '07/01/2023', '01/01/2031', '400'),
		('015', N'Nghiên cứu Vắc xin mới chống Vi khuẩn Kháng thuốc', '007', 7000000, '07/01/2023', '01/01/2031', '400')
	ALTER TABLE DE_TAI
	CHECK CONSTRAINT ALL
END

BEGIN
	ALTER TABLE CONG_VIEC
	NOCHECK CONSTRAINT ALL
	INSERT INTO CONG_VIEC 
		(MACONGVIEC, MA, TEN)
	VALUES 
		(2000, '001', N'Làm công ăn lương'),
		(2001, '002', N'Ngủ trên công ty'),
		(2002, '003', N'Sắp xếp tài liệu'),
		(2003, '001', N'Làm công'),
		(2004, '004', N'Chơi game'),
		(2005, '003', N'Tính toán tài liệu')
	ALTER TABLE CONG_VIEC
	CHECK CONSTRAINT ALL
END

BEGIN
	ALTER TABLE THAMGIADT
	NOCHECK CONSTRAINT ALL
	INSERT INTO THAMGIADT 
		(MA, MAGV, MACONGVIEC)
	VALUES
		('001', '001', 2000),
		('001', '006', 2000),
		('001', '006', 2003),
		('001', '009', 2000),
		('001', '008', 2003),
		('002', '008', 2001),
		('002', '001', 2001),
		('003', '002', 2002),
		('004', '003', 2003),
		('005', '004', 2004),
		('003', '002', 2005),
		('001', '018', 2003),
		('001', '018', 2000)
	ALTER TABLE THAMGIADT
	CHECK CONSTRAINT ALL
END