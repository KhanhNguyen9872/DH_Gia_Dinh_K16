﻿-- DROP ALL CONNECTION
/*
use [master];
ALTER DATABASE [QLNCKH] SET OFFLINE WITH ROLLBACK IMMEDIATE;
ALTER DATABASE [QLNCKH] SET ONLINE;

DROP DATABASE QLNCKH;
*/
-- main

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

CREATE TABLE THAMGIADT (
	MA VARCHAR(8) NOT NULL,
	MAGV VARCHAR(8) NOT NULL,
	CONGVIEC NVARCHAR(255) NOT NULL,
	FOREIGN KEY (MA) REFERENCES DE_TAI (MA),
	FOREIGN KEY (MAGV) REFERENCES GIAOVIEN (MA)
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
		('017', N'Nguyễn', N'Thanh', N'Quốc', N'NAM', '01/01/1999', 'TKDH', 'KHCT', 25000000)
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
		('003', N'8 Đ', N'Song Hành', N'Quận 12', N'TP.HCM'),
		('004', N'17', N'Nguyễn Văn Lạc', N'Bình Thạnh', N'TP.HCM')
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
		('004', N'ĐỀ TÀI 4', '004', 4000000, '04/01/2023', '01/01/2028', '403'),
		('005', N'ĐỀ TÀI 5', '005', 5000000, '05/01/2023', '01/01/2029', '404'),
		('006', N'ĐỀ TÀI 6', '006', 6000000, '06/01/2023', '01/01/2030', '405'),
		('007', N'ĐỀ TÀI 7', '007', 7000000, '07/01/2023', '01/01/2031', '400')
	ALTER TABLE DE_TAI
	CHECK CONSTRAINT ALL
END

BEGIN
	ALTER TABLE THAMGIADT
	NOCHECK CONSTRAINT ALL
	INSERT INTO THAMGIADT 
		(MA, MAGV, CONGVIEC)
	VALUES
		('001', '001', N'Do nothing'),
		('001', '006', N'Do nothing'),
		('001', '009', N'Do nothing'),
		('001', '008', N'Do nothing'),
		('002', '008', N'Do nothing'),
		('002', '001', N'Do nothing'),
		('003', '002', N'Do nothing'),
		('004', '003', N'Do nothing'),
		('005', '004', N'Do nothing'),
		('006', '002', N'Do nothing')
	ALTER TABLE THAMGIADT
	CHECK CONSTRAINT ALL
END

-- BAI TAP
-- 5. Hãy cho biết thông tin giáo viên (mã giáo viên, họ tên) là trưởng bộ môn hoặc trưởng khoa.

SELECT DISTINCT 
	GIAOVIEN.MA AS 'Mã giáo viên',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Họ tên' 
FROM 
	GIAOVIEN, BO_MON, KHOA
WHERE (
	GIAOVIEN.MA = BO_MON.TRUONG_BO_MON OR GIAOVIEN.MA = KHOA.TRUONG_KHOA
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
	SO_DIEN_THOAI.MAGV AS 'Mã giáo viên',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Họ tên'
FROM 
	GIAOVIEN, SO_DIEN_THOAI
WHERE (
	GIAOVIEN.MA = SO_DIEN_THOAI.MAGV
)
GROUP BY SO_DIEN_THOAI.MAGV, GIAOVIEN.HO, GIAOVIEN.TENLOT, GIAOVIEN.TEN
HAVING COUNT(SO_DIEN_THOAI.SO_DIEN_THOAI) > 1;

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
	GIAOVIEN.MA AS 'Mã giáo viên',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Họ tên'
FROM 
	GIAOVIEN
WHERE (
	(YEAR(current_timestamp) - YEAR(GIAOVIEN.NGSINH)) BETWEEN 25 AND 35
);

-- 14.Cho biết thông tin các khoa thành lập từ năm 1980 đến năm 1990.

SELECT 
	KHOA.MA AS 'Mã khoa',
	KHOA.TEN AS 'Tên khoa',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Trưởng khoa',
	YEAR(KHOA.NAM_THANH_LAP) AS 'Năm thành lập'
FROM 
	KHOA, GIAOVIEN
WHERE (
	(KHOA.NAM_THANH_LAP BETWEEN '01/01/1980' AND '31/12/1990')
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

SELECT 
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
	GIAOVIEN.BO_MON = BO_MON.MA AND GIAOVIEN.BO_MON = 'HTTT'
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
	THAMGIADT ON DE_TAI.MA = THAMGIADT.MA
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
	THAMGIADT ON DE_TAI.MA = THAMGIADT.MA
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
	GIAOVIEN.MA AS 'Mã giáo viên',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Trưởng bộ môn',
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
	*
FROM (
	SELECT 
		KHOA.MA AS 'Mã khoa',
		KHOA.TEN AS 'Tên khoa',
		COUNT(GIAOVIEN.MA) AS 'Tổng giáo viên'
	FROM
		GIAOVIEN, KHOA
	WHERE (
		GIAOVIEN.KHOA = KHOA.MA
	)
	GROUP BY KHOA.MA, KHOA.TEN
) NHOM4
WHERE (
	"Tổng giáo viên" > 2
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
	BO_MON.MA AS 'Mã bộ môn',
	BO_MON.TEN AS 'Tên bộ môn',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Trưởng bộ môn'
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
	MAGV,
	HOTEN,
	NGSINH,
	TEN_GVQLCM
FROM

-----------------------------

-- 30.Cho biết danh sách gồm mã và tên giáo viên có tham gia đề tài tên là “HTTT quản lý các trường ĐH” hoặc đề tài có tên là “HTTT quản lý giáo vụ cho một Khoa”.

SELECT 
	GIAOVIEN.MA AS 'Mã giáo viên',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Họ tên giáo viên'
FROM 
	GIAOVIEN 
WHERE (
	GIAOVIEN.MA IN (
		SELECT 
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
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Họ tên giáo viên',
	THAMGIADT.MA AS 'Mã đề tài'
FROM
	GIAOVIEN, THAMGIADT
WHERE (
	(GIAOVIEN.MA = THAMGIADT.MAGV)
	AND
	(THAMGIADT.MA = '001')
);

-----------------------------

-- 32.Cho biết các giáo viên có người quản lý chuyên môn không ở cùng một thành phố.



-----------------------------

-- 33.Cho biết mã đề tài, số thứ tự công việc, tên công việc. Kết quả trả về sắp xếp mã đề tài tăng dần, số thứ tự công việc giảm dần.

SELECT
	MA AS 'Mã đề tài',
	STT AS 'Số thứ tự công việc',
	TEN AS 'Tên công việc'
FROM
	DE_TAI
ORDER BY "Mã đề tài", "Số thứ tự công việc" DESC;

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

-- 40.Liệt kê danh sách các thể hiện cho biết các giáo viên thuộc bộ môn tên là “Mạng máy tính” tham  cả các công việc liên quan đến đề tài tên là “Ứng dụng hóa học xanh”.

SELECT 
	GIAOVIEN.MA AS 'Mã giáo viên',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Họ tên giáo viên'
FROM
	GIAOVIEN, BO_MON
WHERE (
	(GIAOVIEN.BO_MON = BO_MON.MA)
	AND
	(BO_MON.TEN = N'Mạng máy tính')
	AND
	GIAOVIEN.MA IN (
		SELECT 
			THAMGIADT.MAGV
		FROM
			THAMGIADT, DE_TAI
		WHERE (
			(DE_TAI.MA = THAMGIADT.MA)
			AND
			(DE_TAI.TEN = N'Ứng dụng hóa học xanh')
		)
	)
);

-----------------------------

-- 41.Liệt kê danh sách các thể hiện cho biết các giáo viên thuộc bộ môn mã là MMT tham gia tất cả các công việc liên quan đến đề tài 001.



-----------------------------

-- 42.Cho biết các giáo viên thuộc bộ môn HTTT tham gia tất cả các công việc của các đề tài cấp trường. Danh sách kết xuất gồm mã giáo viên, mã đề tài, số thứ tự.



-----------------------------

-- 43.Thêm vào bảng THAMGIADT các bộ dữ liệu cho biết giáo viên mã là 003 tham gia tất cả các công việc của đề tài mã là 001.

INSERT INTO THAMGIADT 
	(MA, MAGV, CONGVIEC)
VALUES
	('001', '003', N'Do nothing')

-----------------------------

-- 44.Xóa các dòng dữ liệu liên quan đến đề tài 002 trong bảng THAMGIADT.


DELETE FROM 
	THAMGIADT 
WHERE (
	THAMGIADT.MA = '002'
);

-----------------------------

-- 45.Cập nhật lương của những giáo viên thuộc bộ môn mã là HTTT tăng 1.5 lần.

SELECT
	GIAOVIEN.MA AS 'Mã giáo viên',
	GIAOVIEN.HO + ' ' + GIAOVIEN.TENLOT + ' ' + GIAOVIEN.TEN AS 'Trưởng khoa',
	BO_MON.TEN AS 'Tên bộ môn',
	CAST(GIAOVIEN.LUONG*1.5 AS INT) AS 'Lương'
FROM 
	GIAOVIEN, BO_MON
WHERE (
	GIAOVIEN.BO_MON = BO_MON.MA AND GIAOVIEN.BO_MON = 'HTTT'
);

-----------------------------