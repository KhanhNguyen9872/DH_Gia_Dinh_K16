﻿-- 221402 - N4

use master;
ALTER DATABASE QLNCKH SET OFFLINE WITH ROLLBACK IMMEDIATE;
ALTER DATABASE QLNCKH SET ONLINE;

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
	PHAI NVARCHAR(3) NOT NULL,
	NGSINH DATETIME NOT NULL,
	LUONG INT NOT NULL DEFAULT 0,
	BO_MON VARCHAR(8),
	KHOA VARCHAR(8),
	PHU_CAP FLOAT NOT NULL DEFAULT 0.0,
	PRIMARY KEY (MA),
	CHECK (LUONG >= 0),
	CHECK (PHU_CAP >= 0.0),
	CHECK (PHAI IN (N'NAM', N'NỮ'))
);

CREATE TABLE PHONG (
	MA VARCHAR(8) NOT NULL,
	TEN NVARCHAR(64) DEFAULT NULL,
	PRIMARY KEY (MA)
);

CREATE TABLE SDT (
	MAGV VARCHAR(8) NOT NULL,
	SO_DIEN_THOAI NVARCHAR(32) NOT NULL,
	PRIMARY KEY (SO_DIEN_THOAI),
	FOREIGN KEY (MAGV) REFERENCES GIAOVIEN (MA)
);

CREATE TABLE KHOA (
	MA VARCHAR(8) NOT NULL,
	TEN NVARCHAR(255) NOT NULL,
	NAM_THANH_LAP INT NOT NULL,
	PHONG_LAM_VIEC VARCHAR(8) DEFAULT NULL,
	SO_DIEN_THOAI NVARCHAR(32) DEFAULT NULL,
	TRUONG_KHOA VARCHAR(8) DEFAULT NULL,
	NGAY_NHAN_CHUC DATETIME DEFAULT NULL,
	PRIMARY KEY (MA),
	FOREIGN KEY (SO_DIEN_THOAI) REFERENCES SDT(SO_DIEN_THOAI),
	FOREIGN KEY (TRUONG_KHOA) REFERENCES GIAOVIEN (MA),
	FOREIGN KEY (PHONG_LAM_VIEC) REFERENCES PHONG (MA)
);

CREATE TABLE BO_MON (
	MA VARCHAR(8) NOT NULL,
	TEN NVARCHAR(255) NOT NULL,
	PHONG VARCHAR(8) DEFAULT NULL,
	SO_DIEN_THOAI NVARCHAR(32) DEFAULT NULL,
	MA_KHOA VARCHAR(8) NOT NULL,
	TRUONG_BO_MON VARCHAR(8) DEFAULT NULL,
	NGAY_NHAN_CHUC DATETIME DEFAULT NULL,
	PRIMARY KEY (MA),
	FOREIGN KEY (SO_DIEN_THOAI) REFERENCES SDT(SO_DIEN_THOAI),
	FOREIGN KEY (TRUONG_BO_MON) REFERENCES GIAOVIEN (MA),
	FOREIGN KEY (MA_KHOA) REFERENCES KHOA (MA),
	FOREIGN KEY (PHONG) REFERENCES PHONG (MA)
);

CREATE TABLE DIA_CHI (
	MAGV VARCHAR(8) NOT NULL UNIQUE,
	SONHA NVARCHAR(255) DEFAULT NULL,
	DUONG NVARCHAR(255) DEFAULT NULL,
	QUAN NVARCHAR(255) DEFAULT NULL,
	THANHPHO NVARCHAR(255) DEFAULT NULL,
	FOREIGN KEY (MAGV) REFERENCES GIAOVIEN (MA)
);

CREATE TABLE CHU_DE (
	MA VARCHAR(8) NOT NULL,
	TEN NVARCHAR(255) NOT NULL,
	PRIMARY KEY (MA)
);

CREATE TABLE DE_TAI (
	STT INT NOT NULL IDENTITY(1,1) UNIQUE,
	MA VARCHAR(8) NOT NULL,
	TEN NVARCHAR(255) NOT NULL,
	CAP_QUAN_LY VARCHAR(8) DEFAULT NULL,
	KINH_PHI INT NOT NULL,
	NGAY_BAT_DAU DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	NGAY_KET_THUC DATETIME NOT NULL,
	CHU_DE VARCHAR(8),
	LA_CAPTRUONG BIT NOT NULL DEFAULT 0,
	PRIMARY KEY (MA),
	FOREIGN KEY (CAP_QUAN_LY) REFERENCES GIAOVIEN (MA),
	FOREIGN KEY (CHU_DE) REFERENCES CHU_DE (MA),
	CHECK (NGAY_BAT_DAU <= NGAY_KET_THUC)
);

CREATE TABLE NGUOI_THAN (
	STT INT NOT NULL IDENTITY(1,1) UNIQUE, 
	HO NVARCHAR(32) NOT NULL DEFAULT '',
	TENLOT NVARCHAR(32) NOT NULL DEFAULT '',
	TEN NVARCHAR(32) NOT NULL,
	PHAI NVARCHAR(3) NOT NULL,
	NGSINH DATETIME NOT NULL,
	MAGV VARCHAR(8) NOT NULL,
	FOREIGN KEY (MAGV) REFERENCES GIAOVIEN (MA),
	CHECK (PHAI IN (N'NAM', N'NỮ'))
);

CREATE TABLE CONG_VIEC (
	STT_CONGVIEC INT NOT NULL,
	MA VARCHAR(8) NOT NULL,
	TEN NVARCHAR(255) NOT NULL,
	NGAY_BAT_DAU DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	NGAY_KET_THUC DATETIME NOT NULL,
	PRIMARY KEY (STT_CONGVIEC),
	FOREIGN KEY (MA) REFERENCES DE_TAI (MA),
	CHECK (NGAY_BAT_DAU <= NGAY_KET_THUC)
);

CREATE TABLE THAMGIADT (
	STT INT NOT NULL IDENTITY(1,1) UNIQUE,
	MA VARCHAR(8) NOT NULL,
	MAGV VARCHAR(8) NOT NULL,
	STT_CONGVIEC INT NOT NULL,
	KETQUA INT NOT NULL DEFAULT 0,
	FOREIGN KEY (MA) REFERENCES DE_TAI (MA),
	FOREIGN KEY (MAGV) REFERENCES GIAOVIEN (MA),
	FOREIGN KEY (STT_CONGVIEC) REFERENCES CONG_VIEC (STT_CONGVIEC)
);

-- CONSTRAINT

ALTER TABLE GIAOVIEN ADD FOREIGN KEY (KHOA) REFERENCES KHOA (MA);
ALTER TABLE GIAOVIEN ADD FOREIGN KEY (BO_MON) REFERENCES BO_MON (MA);

-- FUNCTION
GO
CREATE FUNCTION dbo.CHECK_KHOA_NAM_THANH_LAP (@MA_KHOA VARCHAR(8))
RETURNS VARCHAR(8)
AS
BEGIN
    RETURN (
		SELECT DISTINCT
			KHOA.NAM_THANH_LAP
		FROM 
			KHOA
		WHERE (
			KHOA.MA = @MA_KHOA
		)
	);
END;
GO

GO
CREATE FUNCTION dbo.CHECK_DE_TAI_NGAY_BAT_DAU (@MA_DE_TAI VARCHAR(8))
RETURNS VARCHAR(8)
AS
BEGIN
    RETURN (
		SELECT DISTINCT
			NGAY_BAT_DAU
		FROM 
			DE_TAI
		WHERE (
			DE_TAI.MA = @MA_DE_TAI
		)
	);
END;
GO

GO
CREATE FUNCTION dbo.CHECK_DE_TAI_NGAY_KET_THUC (@MA_DE_TAI VARCHAR(8))
RETURNS VARCHAR(8)
AS
BEGIN
    RETURN (
		SELECT DISTINCT
			NGAY_KET_THUC
		FROM 
			DE_TAI
		WHERE (
			DE_TAI.MA = @MA_DE_TAI
		)
	);
END;
GO

GO
CREATE FUNCTION dbo.CHECK_THAMGIADT_MADT (@STT_CONGVIEC VARCHAR(8))
RETURNS VARCHAR(8)
AS
BEGIN
    RETURN (
		SELECT DISTINCT
			MA
		FROM 
			CONG_VIEC
		WHERE (
			CONG_VIEC.STT_CONGVIEC = @STT_CONGVIEC
		)
	);
END;
GO

GO
CREATE FUNCTION dbo.CHECK_KHOA (@MA_BOMON VARCHAR(8))
RETURNS VARCHAR(8)
AS
BEGIN
    RETURN (
		SELECT DISTINCT
			MA_KHOA
		FROM 
			BO_MON
		WHERE (
			BO_MON.MA = @MA_BOMON
		)
	);
END;
GO
-- 

ALTER TABLE 
	BO_MON 
ADD CHECK (
	YEAR(dbo.CHECK_KHOA_NAM_THANH_LAP(MA_KHOA)) <= YEAR(NGAY_NHAN_CHUC)
);

ALTER TABLE 
	CONG_VIEC 
ADD CHECK (
	dbo.CHECK_DE_TAI_NGAY_BAT_DAU(MA) <= NGAY_BAT_DAU
);

ALTER TABLE 
	CONG_VIEC 
ADD CHECK (
	dbo.CHECK_DE_TAI_NGAY_KET_THUC(MA) >= NGAY_KET_THUC
);

ALTER TABLE 
	THAMGIADT 
ADD CHECK (
	dbo.CHECK_THAMGIADT_MADT(STT_CONGVIEC) = MA
);

ALTER TABLE 
	GIAOVIEN 
ADD CHECK (
	dbo.CHECK_KHOA(BO_MON) = KHOA
);
-- DATA

BEGIN
	ALTER TABLE GIAOVIEN
	NOCHECK CONSTRAINT ALL
	INSERT INTO GIAOVIEN 
		(MA, HO, TENLOT, TEN, PHAI, NGSINH, BO_MON, KHOA, LUONG, PHU_CAP)
	VALUES 
		('GV001', N'Nguyễn', N'Văn', N'Khánh', N'NAM', '02/07/2004', 'HTTT', 'CNTT', 3000, 1.5),
		('GV002', N'Lê', N'Lâm Chiến', N'Thắng', N'NAM', '01/01/2004', 'MMT', 'MKT', 2500, 2.5),
		('GV003', N'Nguyễn', N'Văn', N'Sang', N'NAM', '02/01/2004', 'KTPM', 'NN', 2000, 0.5),
		('GV004', N'Nguyễn', N'Trần Hoàng', N'Thịnh', N'NAM', '03/01/2004', 'HTTT', 'TT', 1500, 3),
		('GV005', N'Nguyễn', N'Văn', N'A', N'NAM', '01/02/1999', 'KTPM', 'TT', 1000, 0),
		('GV006', N'Nguyễn', N'Thị', N'B', N'NỮ', '02/02/1975', 'MMT', 'NN', 1600, 1),
		('GV007', N'Nguyễn', '', N'Cường', N'NAM', '03/02/1982', 'NNA', 'MKT', 1700, 0),
		('GV008', N'Nguyễn', N'Tiến', N'D', N'NAM', '04/02/1997', 'NNT', 'CNTT', 1100, 1),
		('GV009', N'Trần', N'Thị', N'E', N'NỮ', '05/02/2000', 'HTTT', 'TT', 1150, 0.5),
		('GV010', N'Trần', N'Văn', N'F', N'NAM', '06/02/2001', 'TKDH', 'MKT', 1200, 0),
		('GV011', N'Trần', N'Văn', N'Khánh', N'NAM', '07/02/1998', 'MMT', 'CNTT', 1250, 0),
		('GV012', N'Lê', N'Hồng', N'Phong', N'NAM', '01/01/1998', 'TKDH', 'TT', 1275, 0),
		('GV013', N'Nguyễn', N'Thị', N'Kiều', N'NỮ', '12/12/1988', 'KTPM', 'MKT', 1300, 0),
		('GV014', N'Nguyễn', N'Anh', N'Quốc', N'NAM', '01/31/1985', 'KTPM', 'CNTT', 1325, 0),
		('GV015', N'Nguyễn', N'Quốc', N'Anh', N'NAM', '06/14/1986', 'MMT', 'NN', 1400, 0),
		('GV016', N'Nguyễn', N'Thị', N'Chi', N'Nữ', '03/01/1995', 'NNT', 'KT', 1550, 0),
		('GV017', N'Nguyễn', N'Thanh', N'Quốc', N'NAM', '05/12/1999', 'TKDH', 'KHCT', 1575, 0),
		('GV018', N'Nguyễn', N'Văn', N'Chánh', N'NAM', '01/11/1997', 'MMT', 'CNTT', 1625, 1),
		('GV019', N'Nguyễn', N'Hành', N'Chánh', N'NAM', '08/06/1994', NULL, 'MKT', 1625, 0),
		('GV020', N'Lê', N'Văn', N'Hùng', N'NAM', '03/07/1993', NULL, 'KT', 1100, 0)
	ALTER TABLE GIAOVIEN
	CHECK CONSTRAINT ALL
END

BEGIN
	INSERT INTO SDT 
		(MAGV, SO_DIEN_THOAI)
	VALUES 
		('GV001', '0987456231'),
		('GV001', '0321987456'),
		('GV001', '0950321698'),
		('GV001', '0376543210'),
		('GV002', '0912345678'),
		('GV002', '0398765432'),
		('GV003', '0945678901'),
		('GV004', '0389012345'),
		('GV004', '0956789012'),
		('GV005', '0323456789'),
		('GV006', '0932109876'),
		('GV007', '0365432109'),
		('GV008', '0978901234'),
		('GV009', '0343210987'),
		('GV010', '0921098765'),
		('GV011', '0387654321'),
		('GV012', '0963524178'),
		('GV013', '0311223344'),
		('GV014', '0955443322'),
		('GV015', '0387659876'),
		('GV016', '0998765432'),
		('GV017', '0334567890'),
		('GV018', '0987654321'),
		('GV019', '0365432101'),
		('GV020', '0365432432')
END

BEGIN
	INSERT INTO DIA_CHI 
		(MAGV, SONHA, DUONG, QUAN, THANHPHO)
	VALUES
		('GV001', N'371', N'Nguyễn Kiệm', N'Gò Vấp', N'TP.HCM'),
		('GV002', N'162T', N'Trường Chinh', N'Tân Bình', N'TP.HCM'),
		('GV003', N'8 Đ', N'Song Hành', N'Quận 12', N'Bà Rịa Vũng Tàu'),
		('GV004', N'10', N'3', N'Nà Cạn', N'Cao Bằng'),
		('GV005', N'195', N'Yên Ninh', N'Phan Rang-Tháp Chàm', N'Ninh Thuận'),
		('GV006', N'8', N'Số 5', N'Hàm Tân', N'Bình Thuận'),
		('GV007', N'1', N'Tràng Tiền', N'Hoàn Kiếm', N'Hà Nội'),
		('GV008', N'50 Đ', N'Thành Thái', N'Quận 10', N'TP.HCM'),
		('GV009', N'4', N'Số 9', N'Hàm Tân', N'Bình Thuận'),
		('GV010', N'17', N'Nguyễn Văn Lạc', N'Bình Thạnh', N'TP.HCM'),
		('GV011', N'024', N'tổ 23 cũ', N'Nà Cạn', N'Cao Bằng'),
		('GV012', N'265/2', N'Trần Hưng Đạo', N'Khóm 8', N'Sóc Trăng'),
		('GV013', N'8', N'Tân Sơn 2', N'Phan Rang-Tháp Chàm', N'Ninh Thuận'),
		('GV014', N'12', N'An Bình', N'Trảng Bàng', N'Tây Ninh'),
		('GV015', N'48B', N'Hoàng Hoa Thám', N'Tổ 1', N'Hà Giang'),
		('GV016', N'81', N'Phan Ngọc Hiển', N'Phường 4', N'Cà Mau'),
		('GV017', N'40', N'P.4', N'Bình Đa', N'Đồng Nai'),
		('GV018', N'A9C', N'Xa lộ Hà Nội', N'Khu phố 4', N'Đồng Nai'),
		('GV019', N'54', N'Ngư Ông', N'Đức Thắng', N'Bình Thuận'),
		('GV020', N'26', N'Hồng Việt', N'Hợp giang', N'Cao Bằng')
END

BEGIN
	INSERT INTO PHONG 
		(MA, TEN)
	VALUES 
		('001', N'E001'),
		('002', N'B002'),
		('003', N'A003'),
		('004', N'E004'),
		('005', N'A005'),
		('006', N'A006'),
		('007', N'C007'),
		('008', N'E008'),
		('009', N'D009'),
		('010', N'B010'),
		('011', N'E011'),
		('012', N'E012'),
		('013', N'C013'),
		('014', N'E014'),
		('015', N'D015'),
		('016', N'E016'),
		('017', N'F017'),
		('018', N'C018'),
		('019', N'A019'),
		('020', N'E020')
END

BEGIN
	ALTER TABLE KHOA
	NOCHECK CONSTRAINT ALL
	INSERT INTO KHOA 
		(MA, TEN, NAM_THANH_LAP, PHONG_LAM_VIEC, SO_DIEN_THOAI, TRUONG_KHOA, NGAY_NHAN_CHUC)
	VALUES 
		('CNTT', N'Công nghệ thông tin', '1980', '001', '0321987456', 'GV001', '02/02/2020'),
		('MKT', N'Marketing', '2020', '002', '0398765432', 'GV002', '02/02/2022'),
		('NN', N'Ngôn ngữ', '1990', '003', '0945678901', 'GV003', '02/02/2021'),
		('TT', N'Truyền thông', '2020', '004', '0932109876', 'GV006', '02/02/2022'),
		('KHCT', N'Khoa học chính trị', '1985', '005', '0321987456', 'GV007', '01/04/2005'),
		('TLH', N'Tâm lý học', '1991', '006', NULL, NULL, NULL),
		('KT', N'Kế toán', '2000', '007', '0389012345', 'GV004', '09/08/2001'),
		('KTNN', N'Kỹ thuật năng lượng mới', '2015', '009', '0343210987', 'GV009', '10/12/2024'),
		('SH', N'Sinh học', '2003', '010', NULL, NULL, NULL),
		('KTMT', N'Kỹ thuật môi trường', '2016', '011', '0387654321', 'GV011', '11/01/2025'),
		('TC', N'Thể chất', '2006', '013', NULL, NULL, NULL),
		('NH', N'Nghệ thuật', '2003', '014', '0955443322', 'GV014', '12/04/2016'),
		('XD', N'Xây dựng', '2002', '015', NULL, NULL, NULL),
		('MT', N'Môi trường', '2001', '016', NULL, NULL, NULL),
		('YH', N'Y học', '2009', '017', NULL, NULL, NULL),
		('DD', N'Dược đồ', '2003', '018', NULL, NULL, NULL),
		('NNN', N'Nông nghiệp', '2002', '020', NULL, NULL, NULL),
		('TM', N'Thương mại', '2000', '001', NULL, NULL, NULL),
		('QTH', N'Quốc tế học', '2000', '001', NULL, NULL, NULL),
		('TCNH', N'Tài chính - Ngân hàng', '2000', '001', NULL, NULL, NULL)
	ALTER TABLE KHOA
	CHECK CONSTRAINT ALL
END

BEGIN
	ALTER TABLE BO_MON
	NOCHECK CONSTRAINT ALL
	INSERT INTO BO_MON 
		(MA, TEN, PHONG, SO_DIEN_THOAI, MA_KHOA, TRUONG_BO_MON, NGAY_NHAN_CHUC)
	VALUES 
		('HTTT', N'Hệ thống thông tin', '010', '0321987456', 'CNTT', 'GV001', '02/02/2015'),
		('MMT', N'Mạng máy tính', '009', '0398765432', 'CNTT', 'GV002', '02/03/2014'),
		('KTPM', N'Kỹ thuật phần mềm', '008', '0945678901', 'CNTT', 'GV003', '02/04/2016'),
		('TKDH', N'Thiết kế đồ họa', '007', '0978901234', 'CNTT', 'GV008', '02/05/2017'),
		('NNA', N'Ngôn ngữ Anh', '005', '0365432109', 'NN', 'GV007', '02/06/2022'),
		('NNT', N'Ngôn ngữ Trung', '006', '0932109876', 'NN', 'GV006', '02/07/2022'),
		('CCH', N'Chính trị học', '004', NULL, 'KHCT', NULL, NULL),
		('YHNK', N'Y học nội khoa', '001', NULL, 'YH', NULL, NULL),
		('YHTT', N'Y học tâm thần', '003', NULL, 'YH', NULL, NULL),
		('GDTC', N'Giáo dục thể chất', '002', NULL, 'TC', NULL, NULL),
		('TLHTT', N'Tâm lý học thể thao', '020', NULL, 'TC', NULL, NULL),
		('KTH', N'Kiến trúc học', '019', NULL, 'XD', NULL, NULL),
		('KTXD', N'Kỹ thuật xây dựng', '017', NULL, 'XD', NULL, NULL),
		('KHMT', N'Khoa học Môi trường', '015', NULL, 'MT', NULL, NULL),
		('QLMT', N'Quản lý Môi trường', '011', NULL, 'MT', NULL, NULL),
		('SHDT', N'Sinh học Di truyền', '013', NULL, 'SH', NULL, NULL),
		('KTTC', N'Kế toán Tài chính', '014', NULL, 'KT', NULL, NULL),
		('TTDPT', N'Truyền thông Đa phương tiện', '016', NULL, 'TT', NULL, NULL),
		('TLHGD', N'Tâm lý học Giáo dục', '020', NULL, 'TLH', NULL, NULL),
		('TLHSK', N'Tâm lý học Sức khỏe', '010', NULL, 'TLH', NULL, NULL)
	ALTER TABLE BO_MON
	CHECK CONSTRAINT ALL
END

BEGIN
	INSERT INTO NGUOI_THAN 
		(HO, TENLOT, TEN, PHAI, NGSINH, MAGV)
	VALUES
		(N'Nguyễn', N'Văn', N'Q', N'NAM', '12/31/1980', 'GV001'),
		(N'Ngô', N'Thị', N'H', N'NỮ', '12/31/1981', 'GV020'),
		(N'Nguyễn', N'Chính', N'N', N'NAM', '12/31/1982', 'GV002'),
		(N'Ngô', N'Thị Minh', N'H', N'NỮ', '12/31/1976', 'GV003'),
		(N'Nguyen', N'Van', N'A', N'Nam', '1990-01-15', 'GV004'),
		(N'Trần', N'Thị', N'B', N'NỮ', '09/20/1987', 'GV005'),
		(N'Lê', N'Đức', N'C', N'Nam', '10/25/1998', 'GV006'),
		(N'Bùi', N'', N'Tiến', N'NAM', '01/23/1986', 'GV007'),
		(N'Bùi', N'Văn', N'Tiến', N'NAM', '11/22/1985', 'GV008'),
		(N'Đỗ', N'Phước', N'Minh', N'NAM', '04/12/1984', 'GV009'),
		(N'Hoàng', N'Gia', N'Bảo', N'NAM', '10/16/1987', 'GV010'),
		(N'Nguyễn', N'Ngọc', N'Anh', N'NỮ', '11/17/1989', 'GV011'),
		(N'Hà', N'Thị', N'Hoa', N'NAM', '12/04/1986', 'GV012'),
		(N'Bùi', N'Văn', N'Luật', N'NAM', '12/06/1975', 'GV013'),
		(N'Nguyễn', N'Văn', N'Kiên', N'NAM', '02/08/1976', 'GV014'),
		(N'Hoàng', N'Văn', N'Nhớ', N'NAM', '05/12/1989', 'GV015'),
		(N'Nguyễn', N'Văn', N'Chiến', N'NAM', '06/11/1978', 'GV016'),
		(N'Trần', N'Duy', N'Quang', N'NAM', '03/01/1984', 'GV017'),
		(N'Trần', N'Văn', N'Bảo', N'NAM', '01/05/1983', 'GV018'),
		(N'Hoàng', N'Thị', N'Chi', N'NỮ', '08/03/1981', 'GV019')
END

BEGIN
	INSERT INTO CHU_DE 
		(MA, TEN)
	VALUES
		('CD400', N'Trí tuệ nhân tạo (AI) và Máy học'),
		('CD401', N'An toàn thông tin và Bảo mật mạng'),
		('CD402', N'Phát triển Phần mềm và Lập trình'),
		('CD403', N'Nội dung Tiếp thị'),
		('CD404', N'Marketing số'),
		('CD405', N'Chính trị Xã hội và Đa dạng'),
		('CD406', N'Y tế cộng đồng'),
		('CD407', N'Hệ mặt trời'),
		('CD408', N'Công nghệ sinh học'),
		('CD409', N'Năng lượng tái tạo'),
		('CD410', N'Hành tinh khám phá'),
		('CD411', N'Âm nhạc thế giới'),
		('CD412', N'Ẩm thực địa phương'),
		('CD413', N'Du lịch và phiêu lưu'),
		('CD414', N'Học tập trực tuyến'),
		('CD415', N'Lãnh đạo và Quản lý'),
		('CD416', N'Sức khỏe tinh thần'),
		('CD417', N'Phát triển kỹ năng cá nhân'),
		('CD418', N'Y tế tâm thần'),
		('CD419', N'Quan hệ giới tính')
END

BEGIN
	INSERT INTO DE_TAI 
		(MA, TEN, CAP_QUAN_LY, KINH_PHI, NGAY_BAT_DAU, NGAY_KET_THUC, CHU_DE, LA_CAPTRUONG)
	VALUES
		('001', N'HTTT quản lý các trường ĐH', 'GV001', 150000, '01/01/2014', '01/01/2025', 'CD400', 1),
		('002', N'HTTT quản lý giáo vụ cho một Khoa', 'GV002', 150000, '02/01/2016', '01/01/2028', 'CD401', 1),
		('003', N'Ứng dụng hóa học xanh', 'GV003', 120000, '03/01/2015', '01/01/2034', 'CD402', 1),
		('004', N'HTTT quản lý các trường TH', 'GV004', 125000, '04/01/2013', '01/01/2037', 'CD403', 1),
		('005', N'Ứng dụng Di động React Native', 'GV005', 115000, '05/01/2013', '01/01/2036', 'CD404', 1),
		('006', N'Nhận dạng Hình ảnh sử dụng Máy học', 'GV006', 117500, '06/01/2014', '01/01/2031', 'CD405', 0),
		('007', N'Ảnh hưởng của Thói quen Ăn đối với Tim mạch', 'GV007', 107000, '07/01/2012', '01/01/2031', 'CD406', 0),
		('008', N'Dự đoán Ung thư qua Genomic', 'GV008', 90000, '07/06/2011', '01/01/2034', 'CD407', 0),
		('009', N'Yếu tố ảnh hưởng đến Hạnh phúc', 'GV009', 80000, '05/04/2012', '01/01/2033', 'CD408', 0),
		('010', N'Biến đổi Khí hậu và Rừng Amazon', 'GV010', 100000, '06/03/2013', '01/01/2034', 'CD410', 0),
		('011', N'Sáng tạo trong Quảng cáo: Màu sắc và Hình ảnh', 'GV011', 110000, '07/01/2014', '01/01/2031', 'CD409', 0),
		('012', N'Cơ chế Enzyme trong Tiêu hóa thức ăn', 'GV012', 140000, '07/02/2013', '01/01/2035', 'CD414', 0),
		('013', N'Ứng dụng VR cho Trải nghiệm Nghệ thuật tương tác', 'GV013', 130000, '03/01/2012', '01/01/2031', 'CD413', 0),
		('014', N'Văn hóa và Quyết định Kinh tế cá nhân', 'GV014', 115000, '03/05/2011', '01/01/2033', 'CD412', 0),
		('015', N'5G và Tiềm Năng Thay Đổi Cơ Sở Hạ Tầng Mạng', 'GV015', 115000, '04/06/2012', '03/03/2032', 'CD411', 0),
		('016', N'Big Data Trong Mạng Máy Tính: Phân Tích và Quản lý', 'GV018', 116000, '06/03/2007', '03/06/2031', 'CD410', 0),
		('017', N'Edge Computing và Mạng Máy Tính: Tối ưu Hóa Hiệu Suất', 'GV019', 127000, '02/02/2008', '01/01/2033', 'CD415', 0),
		('018', N'Tiếp Cận Khách Hàng Hiệu Quả: Chiến Lược Digital Marketing', 'GV017', 132000, '05/01/2009', '01/06/2031', 'CD417', 0),
		('019', N'Tối ưu Hóa Chiến Dịch và Giao Tiếp Tự Động', 'GV016', 111000, '05/08/2012', '01/01/2031', 'CD416', 0),
		('020', N'Tận Dụng Tiềm Năng Mạng Xã Hội', 'GV020', 110000, '07/01/2011', '01/01/2031', 'CD418', 0)
END

BEGIN
	ALTER TABLE CONG_VIEC
	NOCHECK CONSTRAINT ALL
	INSERT INTO CONG_VIEC 
		(STT_CONGVIEC, MA, TEN, NGAY_BAT_DAU, NGAY_KET_THUC)
	VALUES 
		(0, '001', N'Thu thập yêu cầu', '07/01/2018', '01/01/2024'),
		(1, '002', N'Triển khai và hổ trợ', '12/04/2023', '12/05/2025'),
		(2, '003', N'Sắp xếp tài liệu', '03/12/2017', '01/11/2025'),
		(3, '001', N'Thiết kế hệ thống', '04/10/2016', '11/01/2026'),
		(4, '004', N'Thu thập yêu cầu', '05/01/2019', '01/21/2024'),
		(5, '003', N'Tính toán tài liệu', '06/03/2022', '09/01/2026'),
		(6, '001', N'Thống kê và báo cáo', '04/01/2020', '01/11/2025'),
		(7, '005', N'Thiết kế phần mềm', '05/12/2021', '03/03/2024'),
		(8, '002', N'Quản lý hoạt động', '02/01/2022', '07/06/2025'),
		(9, '005', N'Kiểm thử phần mềm', '01/12/2020', '01/04/2026'),
		(10, '009', N'Nghiên cứu Sự Liên kết với Sức Khỏe', '05/11/2017', '03/04/2025'),
		(11, '009', N'Tìm Hiểu về Chiến lược Tăng cường Hạnh phúc', '03/02/2016', '11/08/2024'),
		(12, '011', N'Viết Báo cáo và Chia sẻ Kết quả', '04/02/2019', '12/12/2025'),
		(13, '011', N'Thu thập Dữ liệu và Phản hồi', '10/11/2016', '01/04/2025'),
		(14, '011', N'Thiết kế Phương tiện Quảng cáo', '09/09/2017', '12/31/2024'),
		(15, '011', N'Tìm hiểu về Tác động của Màu sắc và Hình ảnh trong Quảng cáo', '08/11/2019', '11/30/2025'),
		(16, '015', N'Kiểm Soát Nguồn Gốc', '07/12/2020', '01/04/2025'),
		(17, '015', N'Nghiên cứu Về Phản ứng Miễn dịch', '06/29/2018', '08/03/2025'),
		(18, '012', N'Nguồn Gốc và Sản Xuất Enzyme', '04/30/2022', '11/12/2025'),
		(19, '013', N'Kiểm thử phần mềm', '05/25/2021', '12/11/2024'),
		(20, '015', N'Tìm hiểu về Vi khuẩn Kháng thuốc', '06/16/2020', '08/30/2025')
	ALTER TABLE CONG_VIEC
	CHECK CONSTRAINT ALL
END

BEGIN
	INSERT INTO THAMGIADT 
		(MA, MAGV, STT_CONGVIEC)
	VALUES 
		('001', 'GV001', 0),
		('001', 'GV001', 3),
		('001', 'GV001', 6),
		('001', 'GV006', 0),
		('001', 'GV006', 3),
		('001', 'GV009', 0),
		('001', 'GV008', 3),
		('002', 'GV008', 1),
		('003', 'GV002', 2),
		('004', 'GV003', 4),
		('005', 'GV004', 7),
		('003', 'GV002', 5),
		('001', 'GV018', 3),
		('001', 'GV018', 0),
		('001', 'GV002', 0),
		('001', 'GV002', 3),
		('001', 'GV002', 6),
		('001', 'GV004', 0),
		('002', 'GV004', 1),
		('003', 'GV004', 2),
		('004', 'GV004', 4),
		('005', 'GV004', 7)
END

-- TRIGGER AFTER INSERT

GO
CREATE TRIGGER AUTO_PHUCAPGV
ON THAMGIADT
AFTER INSERT
AS
BEGIN
    UPDATE GIAOVIEN
    SET PHU_CAP = PHU_CAP + 0.5
    WHERE MA IN (
		SELECT MAGV FROM Inserted
	);
END;

-- TRIGGER UPDATE

GO
CREATE TRIGGER bo_mon_TRUONG_BO_MON
ON BO_MON
AFTER UPDATE
AS 
BEGIN
	IF UPDATE(TRUONG_BO_MON)
	BEGIN
		UPDATE BO_MON
		SET NGAY_NHAN_CHUC = CURRENT_TIMESTAMP
		FROM BO_MON
		INNER JOIN inserted ON BO_MON.MA = inserted.MA
		WHERE (
			inserted.TRUONG_BO_MON IS NOT NULL
		);

		UPDATE BO_MON
		SET NGAY_NHAN_CHUC = NULL
		FROM BO_MON
		INNER JOIN inserted ON BO_MON.MA = inserted.MA
		WHERE (
			inserted.TRUONG_BO_MON IS NULL
		);
	END
END;

GO
CREATE TRIGGER khoa_TRUONG_KHOA
ON KHOA	
AFTER UPDATE
AS 
BEGIN
	IF UPDATE(TRUONG_KHOA)
	BEGIN
		UPDATE KHOA
		SET NGAY_NHAN_CHUC = CURRENT_TIMESTAMP
		FROM KHOA
		INNER JOIN inserted ON KHOA.MA = inserted.MA
		WHERE (
			inserted.TRUONG_KHOA IS NOT NULL
		);

		UPDATE KHOA
		SET NGAY_NHAN_CHUC = NULL
		FROM KHOA
		INNER JOIN inserted ON KHOA.MA = inserted.MA
		WHERE (
			inserted.TRUONG_KHOA IS NULL
		);
	END
END;

GO
CREATE TRIGGER khoa_SDT
ON KHOA
AFTER UPDATE
AS
BEGIN
	IF UPDATE(TRUONG_KHOA)
	BEGIN
		UPDATE 
			KHOA
		SET 
			KHOA.SO_DIEN_THOAI = SDT.SO_DIEN_THOAI
		FROM 
			KHOA
		JOIN SDT ON KHOA.TRUONG_KHOA = SDT.MAGV
		WHERE (
			(KHOA.TRUONG_KHOA IS NOT NULL)
			 AND 
			 (KHOA.TRUONG_KHOA IN (SELECT MAGV FROM INSERTED))
		);
	END
END;


GO
CREATE TRIGGER bo_mon_SDT
ON BO_MON
AFTER UPDATE
AS
BEGIN
    IF UPDATE(TRUONG_BO_MON)
	BEGIN
		UPDATE 
			BO_MON
		SET 
			BO_MON.SO_DIEN_THOAI = SDT.SO_DIEN_THOAI
		FROM 
			BO_MON
		JOIN SDT ON BO_MON.TRUONG_BO_MON = SDT.MAGV
		WHERE (
			(BO_MON.TRUONG_BO_MON IS NOT NULL)
			 AND 
			 (BO_MON.TRUONG_BO_MON IN (SELECT MAGV FROM INSERTED))
		);
	END
END;


-- TRIGGER DELETE

GO
CREATE TRIGGER DELETE_CONG_VIEC
ON CONG_VIEC
INSTEAD OF DELETE
AS
BEGIN
	DELETE FROM THAMGIADT
	WHERE STT_CONGVIEC IN (
		SELECT 
			STT_CONGVIEC 
		FROM 
			THAMGIADT
		WHERE MA IN (
			SELECT MA FROM deleted
		)
	);
	DELETE FROM THAMGIADT
	WHERE MA IN (
		SELECT MA FROM deleted
	);
	DELETE FROM CONG_VIEC
	WHERE STT_CONGVIEC IN (
		SELECT STT_CONGVIEC FROM deleted
	);
END;

GO
CREATE TRIGGER DELETE_DE_TAI
ON DE_TAI
INSTEAD OF DELETE
AS
BEGIN
	DELETE FROM CONG_VIEC
	WHERE MA IN (
		SELECT MA FROM deleted
	);
	DELETE FROM DE_TAI
	WHERE MA IN (
		SELECT MA FROM deleted
	);
END;

GO
CREATE TRIGGER DELETE_CHU_DE
ON CHU_DE
INSTEAD OF DELETE
AS
BEGIN
	DELETE FROM DE_TAI
	WHERE CHU_DE IN (
		SELECT MA FROM deleted
	)
	DELETE FROM CHU_DE
	WHERE MA IN (
		SELECT MA FROM deleted
	);
END;

GO
CREATE TRIGGER DELETE_BO_MON
ON BO_MON
INSTEAD OF DELETE
AS
BEGIN
	UPDATE GIAOVIEN
	SET BO_MON = NULL
	WHERE BO_MON IN (
		SELECT MA FROM deleted
	);
	DELETE FROM BO_MON
	WHERE MA IN (
		SELECT MA FROM deleted
	);
END;

GO
CREATE TRIGGER DELETE_KHOA
ON KHOA
INSTEAD OF DELETE
AS
BEGIN
	UPDATE GIAOVIEN
	SET KHOA = NULL
	WHERE KHOA IN (
		SELECT MA FROM deleted
	);
	DELETE FROM BO_MON 
	WHERE MA_KHOA IN (
		SELECT MA FROM deleted
	);
	DELETE FROM KHOA
	WHERE MA IN (
		SELECT MA FROM deleted
	);
END;


GO
CREATE TRIGGER DELETE_GIAOVIEN
ON GIAOVIEN
INSTEAD OF DELETE
AS
BEGIN
	DELETE FROM DIA_CHI
	WHERE MAGV IN (
		SELECT MA FROM deleted
	);
	DELETE FROM NGUOI_THAN 
	WHERE MAGV IN (
		SELECT MA FROM deleted
	);
	DELETE FROM THAMGIADT
	WHERE MAGV IN (
		SELECT MA FROM deleted
	);
	UPDATE KHOA
	SET TRUONG_KHOA = NULL
	WHERE TRUONG_KHOA IN (
		SELECT MA FROM deleted
	);
	UPDATE BO_MON
	SET TRUONG_BO_MON = NULL
	WHERE TRUONG_BO_MON IN (
		SELECT MA FROM deleted
	);
	UPDATE KHOA
	SET SO_DIEN_THOAI = NULL
	WHERE TRUONG_KHOA IS NULL;
	UPDATE BO_MON
	SET SO_DIEN_THOAI = NULL
	WHERE TRUONG_BO_MON IS NULL;
	UPDATE DE_TAI
	SET CAP_QUAN_LY = NULL
	WHERE CAP_QUAN_LY IN (
		SELECT MA FROM deleted
	);
	DELETE FROM SDT
	WHERE MAGV IN (
		SELECT MA FROM deleted
	);
	DELETE FROM GIAOVIEN
	WHERE MA IN (
		SELECT MA FROM deleted
	);
END;


-- BAI TAP
-- 5. Hãy cho biết thông tin giáo viên (mã giáo viên, họ tên) là trưởng bộ môn hoặc trưởng khoa.

SELECT DISTINCT 
	GIAOVIEN.MA AS 'Mã giáo viên',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Họ tên' 
FROM 
	GIAOVIEN, BO_MON, KHOA
WHERE (
	GIAOVIEN.MA = BO_MON.TRUONG_BO_MON 
	OR 
	GIAOVIEN.MA = KHOA.TRUONG_KHOA
);

-----------------------------

-- 6.Cho biết mã khoa, tên khoa và tên các giáo viên làm trưởng khoa đó.

SELECT
	KHOA.MA AS 'Mã khoa',
	KHOA.TEN AS 'Tên khoa',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Họ tên giáo viên' 
FROM 
	GIAOVIEN, KHOA
WHERE (
	GIAOVIEN.MA = KHOA.TRUONG_KHOA
);

-----------------------------

-- 7.Cho biết mã giáo viên, họ tên giáo viên và tên khoa của giáo viên đó đang làm việc.

SELECT 
	GIAOVIEN.MA AS 'Mã giáo viên',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Họ tên',
	KHOA.TEN as 'Tên khoa'
FROM 
	GIAOVIEN, KHOA
WHERE (
	GIAOVIEN.KHOA = KHOA.MA
);

-----------------------------

-- 8.Cho biết mã giáo viên, họ tên và lương của họ sau khi tăng lên 10%.

SELECT
	MA AS 'Mã giáo viên',
	HO + ' ' + TENLOT + ' ' + TEN AS 'Họ tên',
	CAST(LUONG*1.1 AS INT) AS 'Lương'
FROM
	GIAOVIEN;

-----------------------------

-- 9.Tìm các giáo viên có họ là “Trần”.

SELECT
	MA AS 'Mã giáo viên',
	HO + ' ' + TENLOT + ' ' + TEN AS 'Họ tên'
FROM 
	GIAOVIEN
WHERE (
	HO = N'Trần'
);

-----------------------------

-- 10.Tìm các giáo viên có họ là “Trần” và đang làm việc ở khoa CNTT.

SELECT 
	GIAOVIEN.MA AS 'Mã giáo viên',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Họ tên',
	KHOA.TEN AS 'Tên khoa'
FROM 
	GIAOVIEN, KHOA
WHERE (
	GIAOVIEN.HO = N'Trần' AND GIAOVIEN.KHOA = KHOA.MA AND KHOA.TEN = N'Công nghệ thông tin'
);

-----------------------------

-- 11.Cho biết giáo viên nào đang sử dụng nhiều hơn một số điện thoại.

SELECT 
	SDT.MAGV AS 'Mã giáo viên',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Họ tên'
FROM 
	GIAOVIEN, SDT
WHERE (
	GIAOVIEN.MA = SDT.MAGV
)
GROUP BY SDT.MAGV, GIAOVIEN.HO, GIAOVIEN.TENLOT, GIAOVIEN.TEN
HAVING COUNT(SDT.SO_DIEN_THOAI) > 1;

-----------------------------

-- 12.Cho biết danh sách gồm mã, họ tên, phái, ngày sinh của các giáo viên thuộc bộ môn tên là “Hệ thống thông tin”.

SELECT
	GIAOVIEN.MA AS 'Mã giáo viên',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Họ tên',
	GIAOVIEN.PHAI AS 'Phái',
	GIAOVIEN.NGSINH AS 'Ngày sinh'
FROM
	GIAOVIEN, BO_MON
WHERE (
	GIAOVIEN.BO_MON = BO_MON.MA AND BO_MON.TEN = N'Hệ thống thông tin'
);

-----------------------------

-- 13.Cho biết thông tin các giáo viên có độ tuổi từ 25 đến 35 tuổi.

SELECT 
	*,
	YEAR(current_timestamp) - YEAR(GIAOVIEN.NGSINH) AS TUOI
FROM 
	GIAOVIEN
WHERE (
	(YEAR(current_timestamp) - YEAR(GIAOVIEN.NGSINH)) BETWEEN 25 AND 35
);

-- 14.Cho biết thông tin các khoa thành lập từ năm 1980 đến năm 1990.

SELECT 
	KHOA.*,
	KHOA.NAM_THANH_LAP AS 'Năm thành lập'
FROM 
	KHOA, GIAOVIEN
WHERE (
	(KHOA.NAM_THANH_LAP BETWEEN 1980 AND 1990)
	AND
	(GIAOVIEN.MA = KHOA.TRUONG_KHOA)
);

-----------------------------

-- 15.Cho biết mã giáo viên, họ tên và lương. Kết quả trả về sắp xếp mức lương tăng dần.

SELECT
	GIAOVIEN.MA AS 'Mã giáo viên',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Trưởng khoa',
	CAST(GIAOVIEN.LUONG AS INT) AS 'Lương'
FROM 
	GIAOVIEN
ORDER BY GIAOVIEN.LUONG;

-----------------------------

-- 16.Cho biết mã đề tài, số thứ tự công việc, tên công việc. Kết quả trả về sắp xếp mã đề tài tăng dần, số thứ tự công việc giảm dần.

SELECT
	MA AS 'Mã đề tài', 
	STT AS 'Số thứ tự công việc',
	TEN AS 'Tên đề tài'
FROM
	DE_TAI
ORDER BY MA, STT DESC;

-----------------------------

-- 17.Cho biết những giáo viên có lương >= 2500 hoặc có người thân là nam.

SELECT DISTINCT
	GIAOVIEN.MA AS 'Mã giáo viên',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Trưởng khoa'
FROM
	GIAOVIEN, NGUOI_THAN
WHERE (
	(GIAOVIEN.LUONG >= 2500)
	OR
	(
		(NGUOI_THAN.MAGV = GIAOVIEN.MA) 
		AND
		(NGUOI_THAN.PHAI = N'NAM')
	)
);

-----------------------------


-- 18.Tính tổng lương, lương lớn nhất, lương nhỏ nhất và lương trung bình của giáo viên thuộc bộ môn “Hệ thống thông tin”.

SELECT
	SUM(GIAOVIEN.LUONG) AS 'Tổng lương',
	MAX(GIAOVIEN.LUONG) AS 'Lương lớn nhất',
	MIN(GIAOVIEN.LUONG) AS 'Lương nhỏ nhất'
FROM 
	GIAOVIEN, BO_MON
WHERE (
	(GIAOVIEN.BO_MON = BO_MON.MA) 
	AND 
	(BO_MON.TEN = N'Hệ thống thông tin')
);

-----------------------------

-- 19.Cho biết số lượng giáo viên tham gia cho mỗi đề tài.

SELECT
	DE_TAI.MA AS 'Mã đề tài', 
	DE_TAI.TEN AS 'Tên đề tài', 
	COUNT(THAMGIADT.MAGV) AS 'Tổng giáo viên'
FROM
	DE_TAI
LEFT JOIN 
	THAMGIADT ON THAMGIADT.MA = DE_TAI.MA
GROUP BY 
	DE_TAI.MA, DE_TAI.TEN;

-----------------------------

-- 20.Cho biết đề tài nào có nhiều giáo viên tham gia nhất.

SELECT TOP 1
	DE_TAI.MA AS 'Mã đề tài', 
	DE_TAI.TEN AS 'Tên đề tài', 
	COUNT(THAMGIADT.MAGV) AS 'Tổng giáo viên'
FROM
	DE_TAI
LEFT JOIN 
	THAMGIADT ON THAMGIADT.MA = DE_TAI.MA
GROUP BY 
	DE_TAI.MA, DE_TAI.TEN
ORDER BY 
	"Tổng giáo viên" DESC;

-----------------------------

-- 21.Cho biết có bao nhiêu giáo viên không tham gia bất kỳ đề tài nào.

SELECT 
	COUNT(GIAOVIEN.MA) AS 'Tổng giáo viên không tham gia đề tài'
FROM
	GIAOVIEN
WHERE (
	MA NOT IN (
		SELECT 
			MAGV
		FROM
			THAMGIADT
	)
);

-----------------------------

-- 22.Cho biết thông tin các trưởng bộ môn nhận chức từ đầu năm 2015 đến hết năm 2016.

SELECT
	GIAOVIEN.*,
	BO_MON.NGAY_NHAN_CHUC AS 'Ngày nhận chức'
FROM
	GIAOVIEN, BO_MON
WHERE (
	(GIAOVIEN.MA = BO_MON.TRUONG_BO_MON)
	AND
	(BO_MON.NGAY_NHAN_CHUC BETWEEN '01/01/2015' AND '12/31/2016')
);

-----------------------------

-- 23.Cho biết thông tin các giáo viên có mức phụ cấp tham gia đề tài từ 1.5 đến 2.0

SELECT
	*
FROM
	GIAOVIEN
WHERE (
	GIAOVIEN.PHU_CAP BETWEEN 1.5 AND 2.0
);

-----------------------------

-- 24.Xuất ra danh sách giáo viên có mức lương > mức lương trung bình của tất cả giáo viên.

SELECT 
	MA AS 'Mã giáo viên',
	HO + ' ' + TENLOT + ' ' + TEN AS 'Họ tên giáo viên',
	LUONG AS 'Lương'
FROM
	GIAOVIEN
WHERE LUONG > (SELECT AVG(LUONG) FROM GIAOVIEN);

-----------------------------

-- 25.Xuất ra thông tin của khoa có nhiều hơn 2 giáo viên.

SELECT 
	KHOA.*,
	"Tổng giáo viên"
FROM (
	SELECT 
		KHOA.MA AS 'Mã khoa',
		COUNT(GIAOVIEN.MA) AS 'Tổng giáo viên'
	FROM
		GIAOVIEN, KHOA
	WHERE (
		GIAOVIEN.KHOA = KHOA.MA
	)
	GROUP BY KHOA.MA
) NHOM4, KHOA
WHERE (
	("Tổng giáo viên" > 2)
	AND
	(KHOA.MA = "Mã khoa")
);

-----------------------------

-- 26.Cho biết danh sách các bộ môn và tên của người làm trưởng bộ môn.

SELECT
	BO_MON.MA AS 'Mã bộ môn',
	BO_MON.TEN AS 'Tên bộ môn',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Trưởng bộ môn'
FROM
	GIAOVIEN, BO_MON
WHERE (
	GIAOVIEN.MA = BO_MON.TRUONG_BO_MON
);

-----------------------------

-- 27.Cho biết thông tin các bộ môn và tên của người làm trưởng bộ môn, đối với những bộ môn chưa biết giáo viên nào làm trưởng bộ môn thì tại các cột cho biết mã và tên của trưởng bộ môn mang giá trị rỗng (null).

SELECT
	BO_MON.*,
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Tên trưởng bộ môn'
FROM
	BO_MON
LEFT JOIN 
	GIAOVIEN ON GIAOVIEN.MA = BO_MON.TRUONG_BO_MON

-----------------------------

-- 28.Cho biết danh sách gồm mã, họ tên, phái, ngày sinh của các giáo viên thuộc bộ môn tên là “Hệ thống thông tin”.

SELECT
	GIAOVIEN.MA AS 'Mã giáo viên',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Họ tên giáo viên',
	GIAOVIEN.PHAI AS 'Phái',
	GIAOVIEN.NGSINH AS 'Ngày sinh'
FROM
	GIAOVIEN, BO_MON
WHERE (
	(GIAOVIEN.BO_MON = BO_MON.MA)
	AND
	(BO_MON.TEN = N'Hệ thống thông tin')
);

-----------------------------

-- 29.Cho biết danh sách giáo viên và tên người quản lý chuyên môn với kết quả gồm các cột sau: MAGV, HOTEN, NGAYSINH, TEN_GVQLCM. Chỉ xuất thông tin các giáo viên có người quản lý chuyên môn.

SELECT
	GIAOVIEN.MA AS MAGV,
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS HOTEN,
	GIAOVIEN.NGSINH AS NGAYSINH,
	NHOM4.TENGV AS TEN_GVQLCM
FROM
	GIAOVIEN, (
		SELECT 
			BO_MON.MA AS MA_BOMON,
			GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS TENGV
		FROM
			GIAOVIEN, BO_MON
		WHERE (
			BO_MON.TRUONG_BO_MON = GIAOVIEN.MA
		)
	) NHOM4
WHERE (
	GIAOVIEN.BO_MON = NHOM4.MA_BOMON
);

-----------------------------

-- 30.Cho biết danh sách gồm mã và tên giáo viên có tham gia đề tài tên là “HTTT quản lý các trường ĐH” hoặc đề tài có tên là “HTTT quản lý giáo vụ cho một Khoa”.

SELECT 
	GIAOVIEN.MA AS 'Mã giáo viên',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Họ tên giáo viên'
FROM 
	GIAOVIEN 
WHERE (
	GIAOVIEN.MA IN (
		SELECT DISTINCT
			THAMGIADT.MAGV
		FROM
			THAMGIADT, DE_TAI
		WHERE (
			(THAMGIADT.MA = DE_TAI.MA)
			AND
			(
				(DE_TAI.TEN = N'HTTT quản lý các trường ĐH')
				OR
				(DE_TAI.TEN = N'HTTT quản lý giáo vụ cho một Khoa')
			)
		)
	)
);

-----------------------------

-- 31.Cho biết danh sách các giáo viên tham gia tất cả các công việc của đề tài mã là 001.

SELECT 
	GIAOVIEN.MA AS 'Mã giáo viên',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Họ tên giáo viên'
FROM (
	SELECT 
		GIAOVIEN.MA
	FROM
		GIAOVIEN
	JOIN BO_MON ON BO_MON.MA = GIAOVIEN.BO_MON
	JOIN THAMGIADT ON THAMGIADT.MAGV = GIAOVIEN.MA
	JOIN DE_TAI ON THAMGIADT.MA = DE_TAI.MA
	WHERE (
		DE_TAI.MA = '001'
	)
	GROUP BY GIAOVIEN.MA
	HAVING COUNT(GIAOVIEN.MA) = (
		SELECT 
			COUNT(NHOM4.STT_CONGVIEC)
		FROM (
			SELECT DISTINCT
				THAMGIADT.STT_CONGVIEC
			FROM 
				THAMGIADT 
			JOIN 
				CONG_VIEC ON CONG_VIEC.STT_CONGVIEC = THAMGIADT.STT_CONGVIEC
			WHERE (
				CONG_VIEC.MA = '001'
			)
		) NHOM4
	)
) DSGIAOVIEN, GIAOVIEN
WHERE (
	DSGIAOVIEN.MA = GIAOVIEN.MA
);

-----------------------------

-- 32.Cho biết các giáo viên có người quản lý chuyên môn không ở cùng một thành phố.

SELECT 
	GIAOVIEN.MA AS 'Mã giáo viên',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Mã giáo viên',
	DIA_CHI.THANHPHO AS 'Thành phố (Giáo viên)',
	QUANLY."Thành phố" AS 'Thành phố (Quản lý)'
FROM
	GIAOVIEN 
JOIN (
	SELECT DISTINCT
		BO_MON.MA AS 'Mã bộ môn',
		GIAOVIEN.MA AS 'Mã quản lý',
		GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Họ tên quản lý',
		DIA_CHI.THANHPHO AS 'Thành phố'
	FROM
		GIAOVIEN
	JOIN BO_MON ON BO_MON.TRUONG_BO_MON = GIAOVIEN.MA
	JOIN DIA_CHI ON DIA_CHI.MAGV = GIAOVIEN.MA
) QUANLY ON QUANLY."Mã bộ môn" = GIAOVIEN.BO_MON
JOIN DIA_CHI ON DIA_CHI.MAGV = GIAOVIEN.MA
WHERE (
	(GIAOVIEN.MA = DIA_CHI.MAGV)
	AND
	(GIAOVIEN.BO_MON = QUANLY."Mã bộ môn")
	AND
	(DIA_CHI.THANHPHO <> QUANLY."Thành phố")
);

-----------------------------

-- 33.Cho biết mã đề tài, số thứ tự công việc, tên công việc. Kết quả trả về sắp xếp mã đề tài tăng dần, số thứ tự công việc giảm dần.

SELECT
	MA AS 'Mã đề tài',
	STT AS 'Số thứ tự công việc',
	TEN AS 'Tên công việc'
FROM
	DE_TAI
ORDER BY "Mã đề tài" ASC, "Số thứ tự công việc" DESC;

-----------------------------

-- 34.Cho biết mã giáo viên của những giáo viên có lương >= 1500 và có người thân là nam.

SELECT 
	GIAOVIEN.MA AS 'Mã giáo viên'
FROM 
	GIAOVIEN, NGUOI_THAN
WHERE (
	(GIAOVIEN.LUONG >= 1500)
	AND
	(NGUOI_THAN.MAGV = GIAOVIEN.MA)
	AND
	(NGUOI_THAN.PHAI = N'NAM')
);

-----------------------------

-- 35.Cho biết những giáo viên nào ở khoa CNTT đã tham gia ít nhất 1 đề tài.

SELECT DISTINCT
    GIAOVIEN.MA AS 'Mã giáo viên',
    GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Họ tên giáo viên',
	GIAOVIEN.KHOA AS 'Khoa'
FROM
    GIAOVIEN
JOIN
    THAMGIADT ON GIAOVIEN.MA = THAMGIADT.MAGV
WHERE
    GIAOVIEN.KHOA = 'CNTT';

-----------------------------

-- 36.Cho biết số lượng đề tài của mỗi chủ đề (Mã chủ đề, tên chủ đề, số lượng đề tài).

SELECT
	CHU_DE.MA AS 'Mã chủ đề',
	CHU_DE.TEN AS 'Tên chủ đề',
	COUNT(DE_TAI.MA) AS 'Số lượng đề tài'
FROM
	CHU_DE
LEFT JOIN
	DE_TAI ON DE_TAI.CHU_DE = CHU_DE.MA
GROUP BY CHU_DE.MA, CHU_DE.TEN;

-----------------------------

-- 37.Mỗi bộ môn có bao nhiêu giáo viên (Mã bộ môn, tên bộ môn, số giáo viên).

SELECT
	BO_MON.MA AS 'Mã bộ môn',
	BO_MON.TEN AS 'Tên bộ môn',
	COUNT(GIAOVIEN.MA) AS 'Số giáo viên'
FROM
	BO_MON
LEFT JOIN
	GIAOVIEN ON GIAOVIEN.BO_MON = BO_MON.MA
GROUP BY BO_MON.MA, BO_MON.TEN;

-----------------------------

-- 38.Cho biết danh sách gồm mã các giáo viên có tham gia đề tài mã số 001 hoặc mã số 002.

SELECT DISTINCT
	THAMGIADT.MAGV
FROM 
	THAMGIADT
WHERE (
	(THAMGIADT.MA = '001')
	OR
	(THAMGIADT.MA = '002')
);

-----------------------------

-- 39.Cho biết danh sách gồm mã các giáo viên có tham gia đề tài mã số 001 nhưng không tham gia đề tài mã số 002.

SELECT DISTINCT
	THAMGIADT.MAGV
FROM 
	THAMGIADT
WHERE (
	(THAMGIADT.MA = '001')
	AND
	THAMGIADT.MAGV NOT IN (
		SELECT 
			MAGV
		FROM
			THAMGIADT
		WHERE (
			THAMGIADT.MA = '002'
		)
	)
);

-----------------------------

-- 40.Liệt kê danh sách các thể hiện cho biết các giáo viên thuộc bộ môn tên là “Mạng máy tính” tham gia tất cả các công việc liên quan đến đề tài tên là “Ứng dụng hóa học xanh”.

SELECT 
	GIAOVIEN.MA AS 'Mã giáo viên',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Họ tên giáo viên'
FROM (
	SELECT 
		GIAOVIEN.MA
	FROM
		GIAOVIEN
	JOIN BO_MON ON BO_MON.MA = GIAOVIEN.BO_MON
	JOIN THAMGIADT ON THAMGIADT.MAGV = GIAOVIEN.MA
	JOIN DE_TAI ON THAMGIADT.MA = DE_TAI.MA
	WHERE (
		(BO_MON.TEN = N'Mạng máy tính')
		AND
		(DE_TAI.TEN = N'Ứng dụng hóa học xanh')
	)
	GROUP BY GIAOVIEN.MA
	HAVING COUNT(GIAOVIEN.MA) = (
		SELECT 
			COUNT(NHOM4.STT_CONGVIEC)
		FROM (
			SELECT DISTINCT
				THAMGIADT.STT_CONGVIEC
			FROM 
				THAMGIADT 
			JOIN 
				CONG_VIEC ON CONG_VIEC.STT_CONGVIEC = THAMGIADT.STT_CONGVIEC
			WHERE (
				CONG_VIEC.MA = (
					SELECT
						MA
					FROM
						DE_TAI
					WHERE (
						DE_TAI.TEN = N'Ứng dụng hóa học xanh'
					)
				)
			)
		) NHOM4
	)
) DSGIAOVIEN, GIAOVIEN
WHERE (
	DSGIAOVIEN.MA = GIAOVIEN.MA
);

-----------------------------

-- 41.Liệt kê danh sách các thể hiện cho biết các giáo viên thuộc bộ môn mã là MMT tham gia tất cả các công việc liên quan đến đề tài 001.

SELECT 
	GIAOVIEN.MA AS 'Mã giáo viên',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Họ tên giáo viên'
FROM (
	SELECT 
		GIAOVIEN.MA
	FROM
		GIAOVIEN
	JOIN BO_MON ON BO_MON.MA = GIAOVIEN.BO_MON
	JOIN THAMGIADT ON THAMGIADT.MAGV = GIAOVIEN.MA
	JOIN DE_TAI ON THAMGIADT.MA = DE_TAI.MA
	WHERE (
		(BO_MON.MA = 'MMT')
		AND
		(DE_TAI.MA = '001')
	)
	GROUP BY GIAOVIEN.MA
	HAVING COUNT(GIAOVIEN.MA) = (
		SELECT 
			COUNT(NHOM4.STT_CONGVIEC)
		FROM (
			SELECT DISTINCT
				THAMGIADT.STT_CONGVIEC
			FROM 
				THAMGIADT 
			JOIN 
				CONG_VIEC ON CONG_VIEC.STT_CONGVIEC = THAMGIADT.STT_CONGVIEC
			WHERE (
				CONG_VIEC.MA = '001'
			)
		) NHOM4
	)
) DSGIAOVIEN, GIAOVIEN
WHERE (
	DSGIAOVIEN.MA = GIAOVIEN.MA
);

-----------------------------

-- 42.Cho biết các giáo viên thuộc bộ môn HTTT tham gia tất cả các công việc của các đề tài cấp trường. Danh sách kết quả xuất ra bao gồm mã giáo viên, mã đề tài, số thứ tự.

SELECT DISTINCT
    GIAOVIEN.MA AS 'Mã giáo viên',
    DE_TAI.MA AS 'Mã đề tài',
    DE_TAI.STT AS 'Số thứ tự'
FROM
    GIAOVIEN
JOIN
    THAMGIADT ON GIAOVIEN.MA = THAMGIADT.MAGV
JOIN
    CONG_VIEC ON THAMGIADT.STT_CONGVIEC = CONG_VIEC.STT_CONGVIEC
JOIN
    DE_TAI ON THAMGIADT.MA = DE_TAI.MA
WHERE (
    (GIAOVIEN.BO_MON = 'HTTT')
    AND 
	(DE_TAI.CAP_QUAN_LY = GIAOVIEN.MA)
    AND 
	(DE_TAI.LA_CAPTRUONG = 1)
    AND NOT EXISTS (
        SELECT 
			1
        FROM 
			CONG_VIEC
        WHERE (
			(CONG_VIEC.MA = DE_TAI.MA)
            AND 
			(CONG_VIEC.STT_CONGVIEC NOT IN (
                SELECT 
					THAMGIADT.STT_CONGVIEC
                FROM 
					THAMGIADT
                WHERE ( 
					(THAMGIADT.MA = DE_TAI.MA)
                    AND 
					(THAMGIADT.MAGV = GIAOVIEN.MA)
					)
				)
			)
		)
	)
);

-----------------------------

-- 43.Thêm vào bảng THAMGIADT các bộ dữ liệu cho biết giáo viên mã là 003 tham gia tất cả các công việc của đề tài mã là 001.

INSERT INTO THAMGIADT 
	(MA, MAGV, STT_CONGVIEC)
VALUES
	('001', 'GV003', 0)
INSERT INTO THAMGIADT
	(MA, MAGV, STT_CONGVIEC)
VALUES
	('001', 'GV003', 3)
INSERT INTO THAMGIADT
	(MA, MAGV, STT_CONGVIEC)
VALUES
	('001', 'GV003', 6)

SELECT * FROM THAMGIADT WHERE MAGV = 'GV003' AND MA = '001';


-----------------------------

-- 44.Xóa các dòng dữ liệu liên quan đến đề tài 002 trong bảng THAMGIADT.


DELETE FROM 
	THAMGIADT 
WHERE (
	THAMGIADT.MA = '002'
);

SELECT * FROM THAMGIADT WHERE MA = '002';

-----------------------------

-- 45.Cập nhật lương của những giáo viên thuộc bộ môn mã là HTTT tăng 1.5 lần.

UPDATE 
	GIAOVIEN
SET
	LUONG = LUONG*1.5
WHERE (
	GIAOVIEN.BO_MON = 'HTTT'
);
SELECT * FROM GIAOVIEN WHERE BO_MON = 'HTTT';


-----------------------------