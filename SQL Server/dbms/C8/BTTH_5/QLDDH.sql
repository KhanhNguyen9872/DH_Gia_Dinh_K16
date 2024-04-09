-- 221402 - 22150129 - Nguyễn Văn Khánh


-------- 1. DATABASE -----------

-- a. 

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'QLDDH')
BEGIN
    CREATE DATABASE QLDDH;
    PRINT N'CSDL QLDDH đã được tạo thành công.';
END
ELSE
    PRINT N'CSDL QLDDh đã tồn tại.';
GO
USE QLDDH
GO

CREATE TABLE KhachHang
(
	MaKH CHAR(10) PRIMARY KEY,
	TenKH NVARCHAR (30),
	DiaChi NVARCHAR (50),
	DienThoai CHAR(10)
)

CREATE TABLE DonDatHang
(
	MaDat CHAR(10) PRIMARY KEY,
	NgayDat DATE,
	MaKH CHAR(10),
	TinhTrang BIT
)

CREATE TABLE PhieuGiaoHang
(
	MaGiao CHAR(10) PRIMARY KEY,
	NgayGiao DATE,
	MaDat CHAR (10)
)

CREATE TABLE HangHoa
(
	MaHH CHAR (10) PRIMARY KEY,
	TenHH NVARCHAR (50),
	DVT NVARCHAR (10),
	SLCon INT,
	DonGiaHH FLOAT
)

CREATE TABLE ChiTietGiaoHang
(
	MaGiao CHAR(10),
	MaHH CHAR(10),
	SLGiao INT,
	DonGiaGiao FLOAT
	PRIMARY KEY (MaGiao, MaHH)
)

CREATE TABLE ChiTietDatHang
(
	MaDat CHAR(10),
	MaHH CHAR (10),
	SLDat INT
	PRIMARY KEY (MaDat, MaHH)
)

CREATE TABLE LichSuGiao
(
	MaHH CHAR(10),
	NgayHL DATE,
	DonGia FLOAT
	PRIMARY KEY (MaHH, NgayHL)
)

ALTER TABLE DonDatHang
ADD CONSTRAINT FK_DonDatHang_KhachHang
FOREIGN KEY  (MaKH)
REFERENCES KhachHang(MaKH)

ALTER TABLE PhieuGiaoHang
ADD CONSTRAINT FK_PhieuGiaoHang_DonDatHang
FOREIGN KEY (MaDat)
REFERENCES DonDatHang (MaDat)

ALTER TABLE ChiTietGiaoHang
ADD CONSTRAINT FK_ChiTietGiaoHang_PhieuGiaoHang
FOREIGN KEY (MaGiao)
REFERENCES PhieuGiaoHang (MaGiao)

ALTER TABLE ChiTietGiaoHang
ADD CONSTRAINT FK_ChiTietGiaoHang_HangHoa
FOREIGN KEY (MaHH)
REFERENCES HangHoa (MaHH)

ALTER TABLE ChiTietDatHang
ADD CONSTRAINT FK_ChiTietDatHang_DonDatHang
FOREIGN KEY (MaDat)
REFERENCES DonDatHang (MaDat)

ALTER TABLE ChiTietDatHang
ADD CONSTRAINT FK_ChiTietDatHang_HangHoa
FOREIGN KEY (MaHH)
REFERENCES HangHoa (MaHH)

ALTER TABLE LichSuGiao
ADD CONSTRAINT FK_LichSuGiao_HangHoa
FOREIGN KEY (MaHH)
REFERENCES HangHoa (MaHH)

BEGIN
	ALTER TABLE KhachHang
	NOCHECK CONSTRAINT ALL
	INSERT INTO KhachHang(MaKH, TenKH, DiaChi, DienThoai)
	VALUES ('KH01', N'Của Hàng Lộc Phú', N'HCM', '0398451950')
	INSERT INTO KhachHang(MaKH, TenKH, DiaChi, DienThoai)
	VALUES ('KH02', N'Của Hàng Hoàng Gia', N'Long An', '0938776266')
	INSERT INTO KhachHang(MaKH, TenKH, DiaChi, DienThoai)
	VALUES ('KH03', N'Nguyễn Lan Anh', N'Cần Thơ', '0896317388')
	INSERT INTO KhachHang(MaKH, TenKH, DiaChi, DienThoai)
	VALUES ('KH04', N'Cty TNHH An Phước', N'Long An', '0993810503')
	INSERT INTO KhachHang(MaKH, TenKH, DiaChi, DienThoai)
	VALUES ('KH05', N'Huỳnh Ngọc Trung', N'HCM', '0916783565')
	INSERT INTO KhachHang(MaKH, TenKH, DiaChi, DienThoai)
	VALUES ('KH06', N'Cửa hàng Trung Tín', N'Tây Ninh', '0938435706')
	ALTER TABLE KhachHang
	CHECK CONSTRAINT ALL
END

BEGIN
	ALTER TABLE HangHoa
	NOCHECK CONSTRAINT ALL
	INSERT INTO HangHoa (MaHH,  TenHH, DVT, SLCon, DonGiaHH)
	VALUES ('BU1', N'Bàn ủi Phillip', N'Cái', 60, 350000)
	INSERT INTO HangHoa (MaHH,  TenHH, DVT, SLCon, DonGiaHH)
	VALUES ('BU2', N'Bàn ủi Sharp', N'Cái', 100, 250000)
	INSERT INTO HangHoa (MaHH,  TenHH, DVT, SLCon, DonGiaHH)
	VALUES ('CD1', N'Nồi cơm điện Sharp', N'Cái', 100, 700000)
	INSERT INTO HangHoa (MaHH,  TenHH, DVT, SLCon, DonGiaHH)
	VALUES ('DM1', N'Đầu máy Sharp', N'Cái', 75, 1200000)
	INSERT INTO HangHoa (MaHH,  TenHH, DVT, SLCon, DonGiaHH)
	VALUES ('MG1', N'Máy giặt Sanyo', N'Cái', 10, 4700000)
	INSERT INTO HangHoa (MaHH,  TenHH, DVT, SLCon, DonGiaHH)
	VALUES ('MQ1', N'Máy quạt Senko', N'Cái', 40, 400000)
	INSERT INTO HangHoa (MaHH,  TenHH, DVT, SLCon, DonGiaHH)
	VALUES ('MQ2', N'Máy quạt Daikin', N'Cái', 60, 600000)
	INSERT INTO HangHoa (MaHH,  TenHH, DVT, SLCon, DonGiaHH)
	VALUES ('TL1', N'Tủ lạnh Hitachi', N'Cái', 50, 5500000)
	INSERT INTO HangHoa (MaHH,  TenHH, DVT, SLCon, DonGiaHH)
	VALUES ('TV1', N'Tivi SamSung', N'Cái', 33, 7800000)
	INSERT INTO HangHoa (MaHH,  TenHH, DVT, SLCon, DonGiaHH)
	VALUES ('TV2', N'Tivi LG', N'Cái', 22, 7500000)
	INSERT INTO HangHoa (MaHH,  TenHH, DVT, SLCon, DonGiaHH)
	VALUES ('TV3', N'TIvi Sony', N'Cái', 60, 8000000)
	ALTER TABLE HangHoa
	CHECK CONSTRAINT ALL
END

BEGIN
	ALTER TABLE LichSuGiao
	NOCHECK CONSTRAINT ALL
	INSERT INTO LichSuGiao (MaHH, NgayHL, DonGia)
	VALUES ('BU1', '2022/01/01', 300000)
	INSERT INTO LichSuGiao (MaHH, NgayHL, DonGia)
	VALUES ('BU1', '2023/01/01', 350000)
	INSERT INTO LichSuGiao (MaHH, NgayHL, DonGia)
	VALUES ('BU2', '2023/01/06', 250000)
	INSERT INTO LichSuGiao (MaHH, NgayHL, DonGia)
	VALUES ('CD1', '2022/01/06', 650000)
	INSERT INTO LichSuGiao (MaHH, NgayHL, DonGia)
	VALUES ('CD1', '2023/01/01', 700000)
	INSERT INTO LichSuGiao (MaHH, NgayHL, DonGia)
	VALUES ('MD1', '2022/01/01', 1000000)
	INSERT INTO LichSuGiao (MaHH, NgayHL, DonGia)
	VALUES ('MD1', '2023/01/01', 1200000)
	INSERT INTO LichSuGiao (MaHH, NgayHL, DonGia)
	VALUES ('MG1', '2022/01/06', 4700000)
	INSERT INTO LichSuGiao (MaHH, NgayHL, DonGia)
	VALUES ('MQ1', '2023/01/01', 400000)
	INSERT INTO LichSuGiao (MaHH, NgayHL, DonGia)
	VALUES ('MQ2', '2022/01/01', 450000)
	INSERT INTO LichSuGiao (MaHH, NgayHL, DonGia)
	VALUES ('MQ2', '2023/01/01', 600000)
	INSERT INTO LichSuGiao (MaHH, NgayHL, DonGia)
	VALUES ('TL1', '2023/01/01', 5500000)
	INSERT INTO LichSuGiao (MaHH, NgayHL, DonGia)
	VALUES ('TV1', '2023/01/01', 7800000)
	INSERT INTO LichSuGiao (MaHH, NgayHL, DonGia)
	VALUES ('TV2', '2023/01/01', 7500000)
	INSERT INTO LichSuGiao (MaHH, NgayHL, DonGia)
	VALUES ('TV3', '2023/01/01', 8000000)
	ALTER TABLE LichSuGiao
	CHECK CONSTRAINT ALL
END

BEGIN
	ALTER TABLE DonDatHang
	NOCHECK CONSTRAINT ALL
	INSERT INTO DonDatHang (MaDat, NgayDat, MaKH, TinhTrang)
	VALUES ('DH01', '2022/02/02', 'KH01', 1)
	INSERT INTO DonDatHang (MaDat, NgayDat, MaKH, TinhTrang)
	VALUES ('DH02', '2022/02/12', 'KH02', 1)
	INSERT INTO DonDatHang (MaDat, NgayDat, MaKH, TinhTrang)
	VALUES ('DH03', '2023/02/23', 'KH03', 1)
	INSERT INTO DonDatHang (MaDat, NgayDat, MaKH, TinhTrang)
	VALUES ('DH04', '2023/04/01', 'KH04', 0)
	INSERT INTO DonDatHang (MaDat, NgayDat, MaKH, TinhTrang)
	VALUES ('DH05', '2023/05/09', 'KH05', 1)
	INSERT INTO DonDatHang (MaDat, NgayDat, MaKH, TinhTrang)
	VALUES ('DH06', '2023/05/16', 'KH06', 1)
	INSERT INTO DonDatHang (MaDat, NgayDat, MaKH, TinhTrang)
	VALUES ('DH07', '2023/06/19', 'KH07', 0)
	INSERT INTO DonDatHang (MaDat, NgayDat, MaKH, TinhTrang)
	VALUES ('DH08', '2023/06/26', 'KH08', 0)
	ALTER TABLE DonDatHang
	CHECK CONSTRAINT ALL
END

BEGIN 
	ALTER TABLE ChiTietDatHang
	NOCHECK CONSTRAINT ALL
	INSERT INTO ChiTietDatHang (MaDat, MaHH, SLDat)
	VALUES ('DH01', 'BU1', 15)
	INSERT INTO ChiTietDatHang (MaDat, MaHH, SLDat)
	VALUES ('DH01', 'MD1', 10)
	INSERT INTO ChiTietDatHang (MaDat, MaHH, SLDat)
	VALUES ('DH01', 'TL1', 4)
	INSERT INTO ChiTietDatHang (MaDat, MaHH, SLDat)
	VALUES ('DH02', 'BU2', 20)
	INSERT INTO ChiTietDatHang (MaDat, MaHH, SLDat)
	VALUES ('DH02', 'TL1', 3)
	INSERT INTO ChiTietDatHang (MaDat, MaHH, SLDat)
	VALUES ('DH03', 'MG1', 8)
	INSERT INTO ChiTietDatHang (MaDat, MaHH, SLDat)
	VALUES ('DH04', 'TL1', 5)
	INSERT INTO ChiTietDatHang (MaDat, MaHH, SLDat)
	VALUES ('DH04', 'TV1', 5)
	INSERT INTO ChiTietDatHang (MaDat, MaHH, SLDat)
	VALUES ('DH05', 'BU2', 12)
	INSERT INTO ChiTietDatHang (MaDat, MaHH, SLDat)
	VALUES ('DH05', 'DM1', 15)
	INSERT INTO ChiTietDatHang (MaDat, MaHH, SLDat)
	VALUES ('DH05', 'MG1', 10)
	INSERT INTO ChiTietDatHang (MaDat, MaHH, SLDat)
	VALUES ('DH05', 'TL1', 5)
	INSERT INTO ChiTietDatHang (MaDat, MaHH, SLDat)
	VALUES ('DH06', 'BU1', 30)
	INSERT INTO ChiTietDatHang (MaDat, MaHH, SLDat)
	VALUES ('DH06', 'MG1', 30)
	INSERT INTO ChiTietDatHang (MaDat, MaHH, SLDat)
	VALUES ('DH06', 'MQ1', 30)
	INSERT INTO ChiTietDatHang (MaDat, MaHH, SLDat)
	VALUES ('DH06', 'MQ2', 30)
	INSERT INTO ChiTietDatHang (MaDat, MaHH, SLDat)
	VALUES ('DH07', 'BU1', 20)
	INSERT INTO ChiTietDatHang (MaDat, MaHH, SLDat)
	VALUES ('DH08', 'MQ1', 50)
	INSERT INTO ChiTietDatHang (MaDat, MaHH, SLDat)
	VALUES ('DH08', 'TL1', 10)
	ALTER TABLE ChiTietDatHang
	CHECK CONSTRAINT ALL
END

BEGIN
	ALTER TABLE PhieuGiaoHang
	NOCHECK CONSTRAINT ALL
	INSERT INTO PhieuGiaoHang (MaGiao, NgayGiao, MaDat)
	VALUES ('GH01', '2022/02/02', 'DH01')
	INSERT INTO PhieuGiaoHang (MaGiao, NgayGiao, MaDat)
	VALUES ('GH02', '2022/02/15', 'DH02')
	INSERT INTO PhieuGiaoHang (MaGiao, NgayGiao, MaDat)
	VALUES ('GH03', '2023/02/24', 'DH03')
	INSERT INTO PhieuGiaoHang (MaGiao, NgayGiao, MaDat)
	VALUES ('GH05', '2023/05/10', 'DH05')
	INSERT INTO PhieuGiaoHang (MaGiao, NgayGiao, MaDat)
	VALUES ('GH06', '2023/06/18', 'DH06')
	INSERT INTO PhieuGiaoHang (MaGiao, NgayGiao, MaDat)
	VALUES ('GH07', '2023/07/10', 'DH07')
	INSERT INTO PhieuGiaoHang (MaGiao, NgayGiao, MaDat)
	VALUES ('GH08', '2023/08/20', 'DH08')
	ALTER TABLE PhieuGiaoHang
	CHECK CONSTRAINT ALL
END

BEGIN
	ALTER TABLE ChiTietGiaoHang
	NOCHECK CONSTRAINT ALL
	INSERT INTO ChiTietGiaoHang (MaGiao, MaHH, SLGiao, DonGiaGiao)
	VALUES ('GH01', 'BU1', 15, 300000)
	INSERT INTO ChiTietGiaoHang (MaGiao, MaHH, SLGiao, DonGiaGiao)
	VALUES ('GH01', 'MD1', 10, 1000000)
	INSERT INTO ChiTietGiaoHang (MaGiao, MaHH, SLGiao, DonGiaGiao)
	VALUES ('GH01', 'TL1', 4, 5000000)
	INSERT INTO ChiTietGiaoHang (MaGiao, MaHH, SLGiao, DonGiaGiao)
	VALUES ('GH02', 'BU2', 10, 300000)
	INSERT INTO ChiTietGiaoHang (MaGiao, MaHH, SLGiao, DonGiaGiao)
	VALUES ('GH03', 'MG1', 8, 4700000)
	INSERT INTO ChiTietGiaoHang (MaGiao, MaHH, SLGiao, DonGiaGiao)
	VALUES ('GH05', 'BU2', 12, 350000)
	INSERT INTO ChiTietGiaoHang (MaGiao, MaHH, SLGiao, DonGiaGiao)
	VALUES ('GH05', 'MD1', 15, 1200000)
	INSERT INTO ChiTietGiaoHang (MaGiao, MaHH, SLGiao, DonGiaGiao)
	VALUES ('GH05', 'MG1', 5, 4700000)
	INSERT INTO ChiTietGiaoHang (MaGiao, MaHH, SLGiao, DonGiaGiao)
	VALUES ('GH05', 'TL1', 5, 5500000)
	INSERT INTO ChiTietGiaoHang (MaGiao, MaHH, SLGiao, DonGiaGiao)
	VALUES ('GH06', 'BU1', 20, 350000)
	INSERT INTO ChiTietGiaoHang (MaGiao, MaHH, SLGiao, DonGiaGiao)
	VALUES ('GH06', 'MG1', 30, 4700000)
	INSERT INTO ChiTietGiaoHang (MaGiao, MaHH, SLGiao, DonGiaGiao)
	VALUES ('GH06', 'MQ1', 10, 400000)
	INSERT INTO ChiTietGiaoHang (MaGiao, MaHH, SLGiao, DonGiaGiao)
	VALUES ('GH06', 'MQ2', 15, 450000)
	INSERT INTO ChiTietGiaoHang (MaGiao, MaHH, SLGiao, DonGiaGiao)
	VALUES ('GH07', 'BU1', 20, 300000)
	INSERT INTO ChiTietGiaoHang (MaGiao, MaHH, SLGiao, DonGiaGiao)
	VALUES ('GH08', 'MQ1', 30, 400000)
	ALTER TABLE ChiTietGiaoHang
	CHECK CONSTRAINT ALL
END


--b. 

ALTER TABLE HangHoa
ADD CONSTRAINT UC_TenHH UNIQUE (TenHH);

INSERT INTO HangHoa (TenHH)
VALUES ('ALo')

--c. 

ALTER TABLE HangHoa
ADD CONSTRAINT CHK_SLCon CHECK (SLCon >= 0);

INSERT INTO HangHoa (MaHH, SLCon)
VALUES ('HH11', '10')

--d. 

ALTER TABLE DonDatHang
ADD CONSTRAINT DF_NgayDat DEFAULT (GETDATE()) FOR NgayDat;

INSERT INTO DonDatHang (NgayDat)
VALUES ('2024/04/07')

--e. 

DROP TABLE KhachHang;

--Không xóa được bảng KhachHang vì đã tạo khóa ngoại bảng KhachHang với các bảng khác
--Nếu muốn xóa được bảng thì phải xóa khóa ngoại trước rồi mới xóa bảng được

--f. 

ALTER TABLE KhachHang
DROP COLUMN DiaChi;

ALTER TABLE KhachHang
ADD DiaChi NVARCHAR(50) DEFAULT N'HCM';

--g. 

ALTER TABLE PhieuGiaoHang
DROP CONSTRAINT FK_PhieuGiaoHang_DonDatHang;

ALTER TABLE PhieuGiaoHang
ADD CONSTRAINT FK_PhieuGiaoHang_DonDatHang
FOREIGN KEY (MaDat)
REFERENCES DonDatHang (MaDat)



-------- 2. QUERY -----------



-- a.

SELECT *
FROM DonDatHang AS DDH
JOIN ChiTietDatHang AS CTDDH ON DDH.MaDat = CTDDH.MaDat
JOIN HangHoa AS HH ON CTDDH.MaHH = HH.MaHH
WHERE DDH.MaDat = 'DH01';

-- b.

SELECT *
FROM DonDatHang

-- c.

SELECT TOP 1 TenHH, DonGiaHH
FROM HangHoa
ORDER BY DonGiaHH DESC

-- d.

SELECT KhachHang.MaKH, KhachHang.TenKH, COUNT(DonDatHang.MaDat) AS SoLanDatHang
FROM KhachHang
LEFT JOIN DonDatHang ON KhachHang.MaKH = DonDatHang.MaKH
GROUP BY KhachHang.MaKH, KhachHang.TenKH;

-- e.

SELECT PhieuGiaoHang.MaGiao, NgayGiao, SUM(SLGiao * DonGiaGiao) AS TongTien
FROM PhieuGiaoHang
JOIN ChiTietGiaoHang ON PhieuGiaoHang.MaGiao = ChiTietGiaoHang.MaGiao
WHERE YEAR(NgayGiao) = 2023
GROUP BY PhieuGiaoHang.MaGiao, NgayGiao;

--- f.

SELECT KhachHang.MaKH, KhachHang.TenKH, COUNT(DISTINCT DonDatHang.MaDat) AS SoLanDatHang
FROM KhachHang
JOIN DonDatHang ON KhachHang.MaKH = DonDatHang.MaKH
GROUP BY KhachHang.MaKH, KhachHang.TenKH
HAVING COUNT(DISTINCT DonDatHang.MaDat) >= 2;

-- g.

SELECT TOP 1  MaHH, SUM(SLDat) AS TongSoLuongGiao
FROM ChiTietDatHang
JOIN HangHoa ON ChiTietDatHang.MaHH = HangHoa.MaHH
GROUP BY MaHH, TenHH
ORDER BY SUM(SLDat) DESC

-- h.

UPDATE HangHoa
SET SLCon = SLCon + 10
WHERE MaHH LIKE 'M%';

SELECT MaHH, TenHH, SLCon
FROM HangHoa

-- i. 

SELECT * INTO HangHoa1 FROM HangHoa;

DELETE FROM HangHoa1
WHERE MaHH IN (
    SELECT MaHH
    FROM (
        SELECT MaHH,
               ROW_NUMBER() OVER(PARTITION BY MaHH ORDER BY (SELECT NULL)) AS RowNum
        FROM HangHoa1
    ) AS Subquery
    WHERE RowNum > 1
);

INSERT INTO HangHoa (MaHH, TenHH, DVT, SLCon, DonGiaHH)
SELECT MaHH, TenHH, DVT, SLCon, DonGiaHH FROM HangHoa1;

-- j.

ALTER TABLE ChiTietGiaoHang
ADD thanhtien FLOAT;

UPDATE ChiTietGiaoHang
SET thanhtien = SLGiao * DonGiaGiao;



-------- 3. VIEW -----------



-- b. 

CREATE VIEW SOLUONGDATLONTRONG2023 
AS
SELECT MaHH, SUM(SLDat) AS TongSLDat
FROM ChiTietDatHang
JOIN DonDatHang ON ChiTietDatHang.MaDat = DonDatHang.MaDat
WHERE YEAR(NgayDat) = 2023
GROUP BY MaHH;


-- c. 

CREATE VIEW KhachHang_HCM
AS
SELECT * FROM KhachHang WHERE DiaChi = N'HCM' WITH CHECK OPTION;

INSERT INTO KhachHang_HCM (MaKH, TenKH, DiaChi, DienThoai)
VALUES ('KH07', N'Cửa hàng ABC', N'HCM', '0123456789')

INSERT INTO KhachHang_HCM (MaKH, TenKH, DiaChi, DienThoai)
VALUES ('KH08', N'Cửa hàng XYZ', N'Long An', '0987654321')

-- NHẬN XÉT Trong trường hợp chèn khách hàng có địa chỉ ở Long An vào view KhachHang_HCM, bạn sẽ nhận được một lỗi. Điều này xảy ra vì WITH CHECK OPTION yêu cầu rằng mỗi dòng chèn



-------- 4. CURSOR -----------



-- a.

ALTER TABLE PhieuGiaoHang
ADD tongtien FLOAT;

DECLARE @MaGiao CHAR(10);
DECLARE @MaHH CHAR(10);
DECLARE @SLGiao INT;
DECLARE @DonGiaGiao FLOAT;
DECLARE @ThanhTien FLOAT;

DECLARE cur CURSOR FOR
SELECT MaGiao, MaHH, SLGiao, DonGiaGiao
FROM ChiTietGiaoHang;

OPEN cur;
FETCH NEXT FROM cur INTO @MaGiao, @MaHH, @SLGiao, @DonGiaGiao;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @ThanhTien = @SLGiao * @DonGiaGiao;

    UPDATE PhieuGiaoHang
    SET tongtien = ISNULL(tongtien, 0) + @ThanhTien
    WHERE MaGiao = @MaGiao;

    FETCH NEXT FROM cur INTO @MaGiao, @MaHH, @SLGiao, @DonGiaGiao;
END;

CLOSE cur;
DEALLOCATE cur;

-- b.

ALTER TABLE KhachHang
ADD thuong2023 FLOAT;
DECLARE @MaKH CHAR(10);
DECLARE @TongTien FLOAT;
DECLARE @CoMuaMayGiat BIT;
DECLARE @CoMuaNam2022 BIT;
DECLARE @CoMuaNam2023 BIT;

DECLARE cur CURSOR FOR
SELECT KhachHang.MaKH, SUM(ChiTietDatHang.SLDat * HangHoa.DonGiaHH) AS TongTien, MAX(CASE WHEN HangHoa.MaHH = 'MG1' THEN 1 ELSE 0 END) AS CoMuaMayGiat, 
    MAX(CASE WHEN YEAR(DonDatHang.NgayDat) = 2022 THEN 1 ELSE 0 END) AS CoMuaNam2022, MAX(CASE WHEN YEAR(DonDatHang.NgayDat) = 2023 THEN 1 ELSE 0 END) AS CoMuaNam2023
FROM KhachHang
LEFT JOIN DonDatHang ON KhachHang.MaKH = DonDatHang.MaKH
LEFT JOIN ChiTietDatHang ON DonDatHang.MaDat = ChiTietDatHang.MaDat
LEFT JOIN HangHoa ON ChiTietDatHang.MaHH = HangHoa.MaHH
GROUP BY KhachHang.MaKH;

OPEN cur;
FETCH NEXT FROM cur INTO @MaKH, @TongTien, @CoMuaMayGiat, @CoMuaNam2022, @CoMuaNam2023;

WHILE @@FETCH_STATUS = 0
BEGIN
    IF @TongTien > 50000000 AND @CoMuaNam2023 = 1
    BEGIN
        UPDATE KhachHang
        SET thuong2023 = 3000000
        WHERE MaKH = @MaKH;
    END
    ELSE IF @TongTien > 35000000 AND @CoMuaMayGiat = 1 AND @CoMuaNam2023 = 1
    BEGIN
        UPDATE KhachHang
        SET thuong2023 = 2000000
        WHERE MaKH = @MaKH;
    END
    ELSE IF @CoMuaNam2022 = 1 AND @CoMuaNam2023 = 1
    BEGIN
        UPDATE KhachHang
        SET thuong2023 = 1000000
        WHERE MaKH = @MaKH;
    END
    ELSE
    BEGIN
        UPDATE KhachHang
        SET thuong2023 = 0
        WHERE MaKH = @MaKH;
    END;
    
    FETCH NEXT FROM cur INTO @MaKH, @TongTien, @CoMuaMayGiat, @CoMuaNam2022, @CoMuaNam2023;
END;

CLOSE cur;
DEALLOCATE cur;

-- c.

DECLARE @MaHH CHAR(10);
DECLARE @DonGiaHH FLOAT;
DECLARE @DonGiaMoiHH FLOAT;
DECLARE @NgayCapNhat DATETIME;

DECLARE cur CURSOR FOR
SELECT MaHH, DonGiaHH
FROM HangHoa;

SET @NgayCapNhat = '2024-01-01';

OPEN cur;
FETCH NEXT FROM cur INTO @MaHH, @DonGiaHH;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @DonGiaMoiHH = @DonGiaHH * 1.1;

    UPDATE HangHoa
    SET DonGiaHH = @DonGiaMoiHH
    WHERE MaHH = @MaHH;

    INSERT INTO LichSuGiao (MaHH, NgayHL, DonGia)
    VALUES (@MaHH, @NgayCapNhat, @DonGiaMoiHH);

    FETCH NEXT FROM cur INTO @MaHH, @DonGiaHH;
END;

CLOSE cur;
DEALLOCATE cur;	



-------- 5. THỦ TỤC -----------



-- a. 

CREATE PROCEDURE SoLuongDatHang
    @MaDat CHAR(10),
    @MaHH CHAR(10)
AS
BEGIN
    SELECT SLDat
    FROM ChiTietDatHang
    WHERE MaDat = @MaDat AND MaHH = @MaHH
END
EXEC NhanSoLuongDatHang 'DH01', 'BU1'


-- b.

CREATE PROCEDURE TongSoTien
    @MaGiao CHAR(10)
AS
BEGIN
    SELECT SUM(SLGiao * DonGiaGiao) AS TongTien
    FROM ChiTietGiaoHang
    WHERE MaGiao = @MaGiao
END
EXEC TongSoTien 'PGH01'

-- c.

CREATE PROCEDURE DonDatHangTheoKhachHang
    @MaKH CHAR(10)
AS
BEGIN
    SELECT
        DDH.MaDat,
        DDH.NgayDat,
        PGH.MaGiao,
        PGH.NgayGiao
    FROM
        DonDatHang DDH
        INNER JOIN PhieuGiaoHang PGH ON DDH.MaDat = PGH.MaDat
    WHERE
        DDH.MaKH = @MaKH
END
EXEC DonDatHangTheoKhachHang 'KH01'

-- d.

CREATE PROCEDURE DemSoDonHangDaGiao
    @Ngay1 DATE,
    @Ngay2 DATE
AS
BEGIN
    SELECT COUNT(*) AS SoLuongPhieuGiao
    FROM PhieuGiaoHang
    WHERE NgayGiao BETWEEN @Ngay1 AND @Ngay2
END
EXEC DemSoDonHangDaGiao'2024-01-01', '2024-01-31'

-- e. a.

ALTER TABLE PhieuGiaoHang
ADD tongtien FLOAT;
CREATE PROCEDURE CapNhatTongTien
AS
BEGIN
    DECLARE @MaGiao CHAR(10);
    DECLARE @TongTien FLOAT;

    DECLARE cursorPGH CURSOR FOR
        SELECT MaGiao
        FROM PhieuGiaoHang;

    OPEN cursorPGH;
    FETCH NEXT FROM cursorPGH INTO @MaGiao;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @TongTien = (
            SELECT SUM(SLGiao * DonGiaGiao)
            FROM ChiTietGiaoHang
            WHERE MaGiao = @MaGiao
        );

        UPDATE PhieuGiaoHang
        SET tongtien = @TongTien
        WHERE MaGiao = @MaGiao;

        FETCH NEXT FROM cursorPGH INTO @MaGiao;
    END;

    CLOSE cursorPGH;
    DEALLOCATE cursorPGH;
END;
EXEC CapNhatTongTien;

-- e. b.

ALTER TABLE KhachHang
ADD thuong2023 FLOAT;
ADD TongTien FLOAT;
CREATE PROCEDURE CapNhatTienThuong2023
AS
BEGIN
    DECLARE @MaKH CHAR(10);
    DECLARE @TienThuong FLOAT;

    DECLARE cursorKH CURSOR FOR
        SELECT MaKH
        FROM KhachHang;

    OPEN cursorKH;
    FETCH NEXT FROM cursorKH INTO @MaKH;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @TienThuong = 0;

        IF (
            EXISTS (
                SELECT *
                FROM DonDatHang
                WHERE MaKH = @MaKH
                    AND YEAR(NgayDat) = 2023
                    AND TongTien > 50000000
            )
        )
        BEGIN
            SET @TienThuong = 3000000;
        END
        ELSE
        BEGIN
            IF (
                EXISTS (
                    SELECT *
                    FROM DonDatHang DDH
                    INNER JOIN ChiTietDatHang CTDH ON DDH.MaDat = CTDH.MaDat
                    WHERE DDH.MaKH = @MaKH
                        AND YEAR(DDH.NgayDat) = 2023
                        AND DDH.TongTien > 35000000
                        AND CTDH.MaHH = 'Máy giặt'
                )
            )
            BEGIN
                SET @TienThuong = 2000000;
            END
            ELSE
            BEGIN
                IF (
                    EXISTS (
                        SELECT *
                        FROM DonDatHang
                        WHERE MaKH = @MaKH
                            AND YEAR(NgayDat) = 2023
                    )
                    AND
                    EXISTS (
                        SELECT *
                        FROM DonDatHang
                        WHERE MaKH = @MaKH
                            AND YEAR(NgayDat) = 2022
                    )
                )
                BEGIN
                    SET @TienThuong = 1000000;
                END
            END
        END

        UPDATE KhachHang
        SET thuong2023 = @TienThuong
        WHERE MaKH = @MaKH;

        FETCH NEXT FROM cursorKH INTO @MaKH;
    END;

    CLOSE cursorKH;
    DEALLOCATE cursorKH;
END;
EXEC CapNhatTienThuong2023;

-- e. c.

CREATE TABLE MucGiaMoi
(
    MaHang CHAR(10),
    GiaMoi FLOAT
);
CREATE PROCEDURE CapNhatGia_ChenLichSu
AS
BEGIN
    DECLARE @MaHang CHAR(10);
    DECLARE @DonGia FLOAT;
    DECLARE @GiaMoi FLOAT;

    DECLARE cursorMH CURSOR FOR
        SELECT MaHH, DonGiaHH
        FROM HangHoa;

    OPEN cursorMH;
    FETCH NEXT FROM cursorMH INTO @MaHang, @DonGia;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @GiaMoi = @DonGia * 1.1;

        UPDATE HangHoa
        SET DonGiaHH = @GiaMoi
        WHERE MaHH = @MaHang;

        INSERT INTO LichSuGiao (MaHH, NgayHL, DonGia)
        VALUES (@MaHang, '2024-01-01', @GiaMoi);

        FETCH NEXT FROM cursorMH INTO @MaHang, @DonGia;
    END;

    CLOSE cursorMH;
    DEALLOCATE cursorMH;
END;
EXEC CapNhatGia_ChenLichSu;

-- f.

CREATE PROCEDURE InsertHangHoa
    @MaHang CHAR(10),
    @TenHang NVARCHAR(50),
    @DonViTinh NVARCHAR(20),
    @SoLuong INT,
    @DonGia FLOAT
AS
BEGIN
    IF EXISTS (SELECT * FROM HangHoa WHERE MaHH = @MaHang)
    BEGIN
        RAISERROR ('Mã hàng đã tồn tại.', 16, 1);
        RETURN;
    END;

    IF @TenHang IS NOT NULL AND EXISTS (SELECT * FROM HangHoa WHERE TenHH = @TenHang)
    BEGIN
        RAISERROR ('Tên hàng đã tồn tại.', 16, 1);
        RETURN;
    END;

    IF @SoLuong IS NOT NULL AND @SoLuong < 0
    BEGIN
        RAISERROR ('Số lượng không hợp lệ.', 16, 1);
        RETURN;
    END;

    IF @DonGia IS NOT NULL AND @DonGia < 0
    BEGIN
        RAISERROR ('Đơn giá không hợp lệ.', 16, 1);
        RETURN;
    END;

    INSERT INTO HangHoa (MaHH, TenHH, DVT, SLCon, DonGiaHH)
    VALUES (@MaHang, @TenHang, @DonViTinh, @SoLuong, @DonGia);
END;

-- g.

CREATE PROCEDURE InsertChiTietGiaoHang
    @MaGiao CHAR(10),
    @MaHang CHAR(10),
    @SoLuongGiao INT
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        IF NOT EXISTS (SELECT * FROM ChiTietDatHang WHERE MaDat = @MaGiao AND MaHH = @MaHang)
        BEGIN
            RAISERROR ('Hàng hóa không được đặt.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        IF @SoLuongGiao > (SELECT SLDat FROM ChiTietDatHang WHERE MaDat = @MaGiao AND MaHH = @MaHang)
        BEGIN
            RAISERROR ('Số lượng giao lớn hơn số lượng đặt.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        IF @SoLuongGiao > (SELECT SLCon FROM HangHoa WHERE MaHh = @MaHang)
        BEGIN
            RAISERROR ('Số lượng giao lớn hơn số lượng còn.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        INSERT INTO ChiTietGiaoHang (MaGiao, MaHH, SLGiao, DonGiaGiao)
        SELECT @MaGiao, @MaHang, @SoLuongGiao, DonGiaHH
        FROM HangHoa
        WHERE MaHH = @MaHang;

        UPDATE HangHoa
        SET SLCon = SLCon - @SoLuongGiao
        WHERE MaHH = @MaHang;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;



-------- 6. HÀM -----------



-- b.

CREATE FUNCTION dbo.SoLuongHangHoaTrongDonDatHang 
(
    @MaDat NVARCHAR(10),
    @MaHH NVARCHAR(10)
)
RETURNS INT
AS
BEGIN
    DECLARE @SoLuong INT;
    
    SELECT @SoLuong = SLDat
    FROM ChiTietDatHang
    WHERE MaDat = @MaDat AND MaHH = @MaHH;

    RETURN @SoLuong;
END;

DECLARE @SoLuongHang INT;

SET @SoLuongHang = dbo.SoLuongHangHoaTrongDonDatHang('DH01', 'BU1');

PRINT N'Số lượng hàng hóa trong đơn đặt hàng là: ' + CAST(@SoLuongHang AS NVARCHAR(10));

-- c.

CREATE FUNCTION dbo.HienThiDonDatHangCuaKhachHang 
(
    @MaKH NVARCHAR(10)
)
RETURNS TABLE
AS
RETURN
(
    SELECT DDH.MaDat, DDH.NgayDat, PGH.MaGiao, PGH.NgayGiao
    FROM DonDatHang DDH
    LEFT JOIN PhieuGiaoHang PGH ON DDH.MaDat = PGH.MaDat
    WHERE DDH.MaKH = @MaKH
);


-- d.

CREATE FUNCTION dbo.DemPhieuGiaoHangTrongKhoangThoiGian 
(
    @Ngay1 DATE,
    @Ngay2 DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @SoLuongPhieu INT;

    SELECT @SoLuongPhieu = COUNT(*)
    FROM PhieuGiaoHang
    WHERE NgayGiao BETWEEN @Ngay1 AND @Ngay2;

    RETURN @SoLuongPhieu;
END;


DECLARE @Ngay1 DATE = '2023-01-01';
DECLARE @Ngay2 DATE = '2023-12-31';

SELECT dbo.DemPhieuGiaoHangTrongKhoangThoiGian(@Ngay1, @Ngay2) AS SoLuongPhieuGiaoHang;

-- e. a.

CREATE FUNCTION dbo.TinhTongTienTheoMaGiaoHang
(
    @MaGiao NVARCHAR(10)
)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @TongTien DECIMAL(18, 2);

    SELECT @TongTien = SUM(thanhtien)
    FROM ChiTietGiaoHang
    WHERE MaGiao = @MaGiao;

    RETURN @TongTien;
END;
GO

ALTER TABLE PhieuGiaoHang
ADD tongtien DECIMAL(18, 2) NULL;

DECLARE @MaGiao NVARCHAR(10);
DECLARE @TongTien DECIMAL(18, 2);

DECLARE phieugiaohang_cursor CURSOR FOR
SELECT MaGiao
FROM PhieuGiaoHang;

OPEN phieugiaohang_cursor;

FETCH NEXT FROM phieugiaohang_cursor INTO @MaGiao;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @TongTien = dbo.TinhTongTienTheoMaGiaoHang(@MaGiao);

    UPDATE PhieuGiaoHang
    SET tongtien = @TongTien
    WHERE MaGiao = @MaGiao;

    FETCH NEXT FROM phieugiaohang_cursor INTO @MaGiao;
END

CLOSE phieugiaohang_cursor;
DEALLOCATE phieugiaohang_cursor;


ALTER TABLE PhieuGiaoHang
ADD tongtien DECIMAL(18, 2) NULL;

UPDATE PhieuGiaoHang
SET tongtien = subquery.TongTien
FROM PhieuGiaoHang AS pg
INNER JOIN (
    SELECT MaGiao, SUM(thanhtien) AS TongTien
    FROM ChiTietGiaoHang
    GROUP BY MaGiao
) AS subquery ON pg.MaGiao = subquery.MaGiao;

-- e. b.

ALTER TABLE KhachHang
ADD thuong2023 DECIMAL(18, 2) NULL;
 
CREATE PROCEDURE CapNhatThongTinThuong2023
AS
BEGIN
    DECLARE @MaKH VARCHAR(10)
    DECLARE @TongTien FLOAT
    DECLARE @Thang INT
    DECLARE cursorKhachHang CURSOR FOR
    SELECT MaKH
    FROM KhachHang;
    
    OPEN cursorKhachHang
    FETCH NEXT FROM cursorKhachHang INTO @MaKH
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @TongTien = 0
        SET @Thang = 0

        SELECT @TongTien = SUM(chitiet.SLDat * hanghoa.DonGiaHH)
        FROM ChiTietDatHang chitiet
        INNER JOIN HangHoa hanghoa ON chitiet.MaHH = hanghoa.MaHH
        INNER JOIN DonDatHang donhang ON chitiet.MaDat = donhang.MaDat
        WHERE donhang.MaKH = @MaKH
            AND YEAR(donhang.NgayDat) = 2023

        IF @TongTien > 50000000
            SET @Thang = 3
        ELSE IF @TongTien > 35000000 AND EXISTS (SELECT 1 FROM DonDatHang WHERE MaKH = @MaKH AND YEAR(NgayDat) = 2023 AND EXISTS (SELECT 1 FROM ChiTietDatHang WHERE MaDat = MaDat AND MaHH = 'MG1'))
            SET @Thang = 2
        ELSE IF EXISTS (SELECT 1 FROM DonDatHang WHERE MaKH = @MaKH AND YEAR(NgayDat) = 2023) AND EXISTS (SELECT 1 FROM DonDatHang WHERE MaKH = @MaKH AND YEAR(NgayDat) = 2022)
            SET @Thang = 1

        UPDATE KhachHang
        SET thuong2023 = @Thang
        WHERE MaKH = @MaKH

        FETCH NEXT FROM cursorKhachHang INTO @MaKH
    END

    CLOSE cursorKhachHang
    DEALLOCATE cursorKhachHang
END


EXEC CapNhatThongTinThuong2023;

-- e. c.

CREATE PROCEDURE TangGiaVaThemLichSuGia
AS
BEGIN
    DECLARE @MaHH VARCHAR(10)
    DECLARE @DonGia FLOAT
    DECLARE cursorHangHoa CURSOR FOR
    SELECT MaHH, DonGiaHH
    FROM HangHoa;

    OPEN cursorHangHoa
    FETCH NEXT FROM cursorHangHoa INTO @MaHH, @DonGia
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @DonGia = @DonGia * 1.1
        
        INSERT INTO LichSuGia (MaHH, NgayHL, DonGia)
        VALUES (@MaHH, '2024-01-01', @DonGia)

        FETCH NEXT FROM cursorHangHoa INTO @MaHH, @DonGia
    END

    CLOSE cursorHangHoa
    DEALLOCATE cursorHangHoa
END

-- f.

CREATE PROCEDURE ThemHangHoa
    @MaHH VARCHAR(10),
    @TenHH NVARCHAR(100),
    @DVT NVARCHAR(50),
    @SLCon INT,
    @DonGia FLOAT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM HangHoa WHERE MaHH = @MaHH)
    BEGIN
        RAISERROR('Mã hàng hóa đã tồn tại.', 16, 1)
        RETURN
    END

    IF @TenHH IS NOT NULL AND EXISTS (SELECT 1 FROM HangHoa WHERE TenHH = @TenHH)
    BEGIN
        RAISERROR('Tên hàng hóa phải là duy nhất.', 16, 1)
        RETURN
    END

    IF @SLCon IS NOT NULL AND @SLCon < 0
    BEGIN
        RAISERROR('Số lượng hàng hóa phải lớn hơn hoặc bằng 0.', 16, 1)
        RETURN
    END

    IF @DonGia IS NOT NULL AND @DonGia < 0
    BEGIN
        RAISERROR('Đơn giá hàng hóa phải lớn hơn hoặc bằng 0.', 16, 1)
        RETURN
    END

    INSERT INTO HangHoa (MaHH, TenHH, DVT, SLCon, DonGiaHH)
    VALUES (@MaHH, @TenHH, @DVT, @SLCon, @DonGia)

    PRINT 'Thêm hàng hóa thành công.'
END

-- g.

CREATE PROCEDURE ThemChiTietGiaoHang
    @MaGiao VARCHAR(10),
    @MaHH VARCHAR(10),
    @SLGiao INT
AS
BEGIN
    BEGIN TRANSACTION

    IF NOT EXISTS (
        SELECT 1
        FROM ChiTietDatHang cdh
        INNER JOIN DonDatHang ddh ON cdh.MaDat = ddh.MaDat
        WHERE cdh.MaHH = @MaHH AND ddh.MaDat = (
            SELECT MaDat
            FROM PhieuGiaoHang
            WHERE MaGiao = @MaGiao
        )
    )
    BEGIN
        RAISERROR('Hàng hóa này không được đặt trong đơn đặt hàng tương ứng.', 16, 1)
        ROLLBACK
        RETURN
    END

    IF @SLGiao > (
        SELECT SLDat
        FROM ChiTietDatHang
        WHERE MaDat = (
            SELECT MaDat
            FROM PhieuGiaoHang
            WHERE MaGiao = @MaGiao
        ) AND MaHH = @MaHH
    )
    BEGIN
        RAISERROR('Số lượng giao không được lớn hơn số lượng đặt.', 16, 1)
        ROLLBACK
        RETURN
    END

    IF @SLGiao > (
        SELECT SLCon
        FROM HangHoa
        WHERE MaHH = @MaHH
    )
    BEGIN
        RAISERROR('Số lượng giao không được lớn hơn số lượng còn của hàng hóa.', 16, 1)
        ROLLBACK
        RETURN
    END

    INSERT INTO ChiTietGiaoHang (MaGiao, MaHH, SLGiao, DonGiaGiao)
    VALUES (
        @MaGiao,
        @MaHH,
        @SLGiao,
        (SELECT DonGiaHH FROM HangHoa WHERE MaHH = @MaHH)
    )

    UPDATE HangHoa
    SET SLCon = SLCon - @SLGiao
    WHERE MaHH = @MaHH

    COMMIT
    PRINT 'Thêm chi tiết giao hàng thành công.'
END



-------- 7. TRIGGER -----------



-- a.

ALTER TABLE HangHoa
ADD CONSTRAINT CHK_SLCon_Positive CHECK (SLCon > 0);

CREATE TRIGGER trg_CheckSLCon
ON HangHoa
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE SLCon <= 0)
    BEGIN
        RAISERROR ('Số lượng còn phải lớn hơn 0', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- b. 

ALTER TABLE HangHoa
ADD CONSTRAINT CHK_DVT_ValidValues CHECK (DVT IN ('Cái', 'Thùng', 'Chiếc', 'Chai', 'Lon'));

CREATE TRIGGER trg_CheckDVT
ON HangHoa
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE DVT NOT IN ('Cái', 'Thùng', 'Chiếc', 'Chai', 'Lon'))
    BEGIN
        RAISERROR ('Đơn vị tính không hợp lệ', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- c.

CREATE TRIGGER trg_OnePhieuGiaoPerDonDat
ON PhieuGiaoHang
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT MaDat FROM inserted GROUP BY MaDat HAVING COUNT(MaDat) > 1)
    BEGIN
        RAISERROR ('Mỗi đơn đặt hàng chỉ có tối đa 1 phiếu giao hàng', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- d.

CREATE TRIGGER trg_CheckNgayGiao
ON PhieuGiaoHang
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT p.MaDat FROM inserted p
               INNER JOIN DonDatHang d ON p.MaDat = d.MaDat
               WHERE p.NgayGiao < d.NgayDat OR DATEDIFF(day, d.NgayDat, p.NgayGiao) > 30)
    BEGIN
        RAISERROR ('Ngày giao hàng phải bằng hoặc sau ngày đặt hàng và không quá 30 ngày', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- e.

CREATE TRIGGER trg_UpdateDonGiaHH
ON LichSuGiao
AFTER INSERT
AS
BEGIN
    DECLARE @MaHH CHAR(10), @NgayHL DATE, @DonGia FLOAT;
    SELECT @MaHH = MaHH, @NgayHL = NgayHL, @DonGia = DonGia FROM inserted;

    IF NOT EXISTS (SELECT * FROM LichSuGiao WHERE MaHH = @MaHH AND NgayHL >= @NgayHL)
    BEGIN
        UPDATE HangHoa SET DonGiaHH = @DonGia WHERE MaHH = @MaHH;
    END
    ELSE
    BEGIN
        RAISERROR ('Ngày hiệu lực mới phải lớn hơn tất cả các ngày hiệu lực trong lịch sử giá', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- f. 

CREATE TRIGGER trg_CheckSLGiao
ON ChiTietGiaoHang
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT g.MaHH FROM inserted g
               INNER JOIN ChiTietDatHang d ON g.MaHH = d.MaHH AND g.MaDat = d.MaDat
               WHERE g.SLGiao > d.SLDat)
    BEGIN
        RAISERROR ('Số lượng hàng hóa được giao không được lớn hơn số lượng hàng hóa được đặt', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;



-------- 8. AN TOÀN + BẢO MẬT DỮ LIỆU -----------



-- a.
BCP "SELECT * FROM QLDDH.dbo.KhachHang" queryout 
"D:\dbms\tblKhachHang.txt" -c -T

-- b.

DELETE FROM KhachHang;

BCP QLDDH.dbo.KhachHang IN "D:\dbms\tblKhachHang.txt" -c -T

-- d.

BACKUP DATABASE QLDDH TO DISK = 'D:\dbms\QLDDH.bak';

DELETE FROM KhachHang;

USE master;
RESTORE DATABASE QLDDH FROM DISK = 'D:\dbms\QLDDH.bak' WITH REPLACE;

-- e.

CREATE LOGIN Admin WITH PASSWORD = 'AdminPassword';
CREATE LOGIN Director WITH PASSWORD = 'DirectorPassword';

USE QLDDH;
CREATE USER Admin FOR LOGIN Admin;
CREATE USER Director FOR LOGIN Director;

EXEC sp_addsrvrolemember 'Admin', 'sysadmin';
EXEC sp_addsrvrolemember 'Director', 'sysadmin';

CREATE LOGIN user1 WITH PASSWORD = 'User1Password';
CREATE LOGIN user2 WITH PASSWORD = 'User2Password';
CREATE LOGIN user3 WITH PASSWORD = 'User3Password';

CREATE USER user1 FOR LOGIN user1;
CREATE USER user2 FOR LOGIN user2;
CREATE USER user3 FOR LOGIN user3;
GRANT SELECT ON SCHEMA::dbo TO user1;
GRANT SELECT ON SCHEMA::dbo TO user2;
GRANT SELECT ON SCHEMA::dbo TO user3;

CREATE LOGIN user4 WITH PASSWORD = 'User4Password';
CREATE LOGIN user5 WITH PASSWORD = 'User5Password';
CREATE LOGIN user6 WITH PASSWORD = 'User6Password';

CREATE USER user4 FOR LOGIN user4;
CREATE USER user5 FOR LOGIN user5;
CREATE USER user6 FOR LOGIN user6;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.DonDatHang TO user4;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.ChiTietDatHang TO user4;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.PhieuGiaoHang TO user4;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.ChiTietGiaoHang TO user4;

CREATE ROLE ReadOnlyRole;
CREATE ROLE EditSpecificTablesRole;

GRANT SELECT ON SCHEMA::dbo TO ReadOnlyRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.DonDatHang TO EditSpecificTablesRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.ChiTietDatHang TO EditSpecificTablesRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.PhieuGiaoHang TO EditSpecificTablesRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.ChiTietGiaoHang TO EditSpecificTablesRole;

ALTER ROLE ReadOnlyRole ADD MEMBER user1;
ALTER ROLE ReadOnlyRole ADD MEMBER user2;
ALTER ROLE ReadOnlyRole ADD MEMBER user3;
ALTER ROLE EditSpecificTablesRole ADD MEMBER user4;
ALTER ROLE EditSpecificTablesRole ADD MEMBER user5;
ALTER ROLE EditSpecificTablesRole ADD MEMBER user6;

