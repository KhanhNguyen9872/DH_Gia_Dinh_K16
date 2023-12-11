
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
	(KHOA.NAM_THANH_LAP BETWEEN '01/01/1980' AND '12/31/1990')
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
	THAMGIADT ON THAMGIADT.MA = DE_TAI.MA
GROUP BY 
	DE_TAI.MA, DE_TAI.TEN

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
			COUNT(NHOM4.MACONGVIEC)
		FROM (
			SELECT DISTINCT
				THAMGIADT.MACONGVIEC
			FROM 
				THAMGIADT 
			JOIN 
				CONG_VIEC ON CONG_VIEC.MACONGVIEC = THAMGIADT.MACONGVIEC
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
			COUNT(NHOM4.MACONGVIEC)
		FROM (
			SELECT DISTINCT
				THAMGIADT.MACONGVIEC
			FROM 
				THAMGIADT 
			JOIN 
				CONG_VIEC ON CONG_VIEC.MACONGVIEC = THAMGIADT.MACONGVIEC
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
			COUNT(NHOM4.MACONGVIEC)
		FROM (
			SELECT DISTINCT
				THAMGIADT.MACONGVIEC
			FROM 
				THAMGIADT 
			JOIN 
				CONG_VIEC ON CONG_VIEC.MACONGVIEC = THAMGIADT.MACONGVIEC
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

-- 42.Cho biết các giáo viên thuộc bộ môn HTTT tham gia tất cả các công việc của các đề tài cấp trường. Danh sách kết xuất gồm mã giáo viên, mã đề tài, số thứ tự.



-----------------------------

-- 43.Thêm vào bảng THAMGIADT các bộ dữ liệu cho biết giáo viên mã là 003 tham gia tất cả các công việc của đề tài mã là 001.

INSERT INTO THAMGIADT 
	(MA, MAGV, MACONGVIEC)
VALUES
	('001', '003', 2000),
	('001', '003', 2003)

-----------------------------

-- 44.Xóa các dòng dữ liệu liên quan đến đề tài 002 trong bảng THAMGIADT.


DELETE FROM 
	THAMGIADT 
WHERE (
	THAMGIADT.MA = '002'
);

-----------------------------

-- 45.Cập nhật lương của những giáo viên thuộc bộ môn mã là HTTT tăng 1.5 lần.

UPDATE 
	GIAOVIEN
SET
	LUONG = LUONG*1.5
WHERE (
	GIAOVIEN.BO_MON = 'HTTT'
)

-----------------------------